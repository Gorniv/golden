import 'package:flutter/widgets.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:golden/golden.dart';

abstract class GoldenTesterBase {
  GoldenTesterBase({
    required Widget Function(Key key) widget,
    required Widget Function(Widget, Locale, NamedTheme) wrapper,
    this.testName = '',
  })  : _widget = widget,
        _wrapper = wrapper,
        key = UniqueKey();

  final String folder = 'golden';

  @protected
  final Key key;

  final Widget Function(Key key) _widget;
  final Widget Function(Widget, Locale, NamedTheme) _wrapper;

  final String testName;
  late String scenarioName;
  late WidgetTester tester;
  late Device device;
  late Locale locale;
  late NamedTheme theme;

  @mustCallSuper
  Future<void> setScenario({
    required WidgetTester tester,
    required String scenarioName,
    required Device device,
    required Locale locale,
    required NamedTheme theme,
  }) async {
    this.tester = tester;
    this.scenarioName = scenarioName;
    this.device = device;
    this.locale = locale;
    this.theme = theme;
    await tester.pumpWidget(_wrapper(_widget(key), locale, theme));
  }

  Future<void> matchesGolden() async {
    final dot = testName.isEmpty ? '' : '.';
    final deviceName = device.name;
    final localeName = locale.toString();
    var postfix = '($localeName)';
    if (localeName == 'en') {
      postfix = '';
    }
    final themeName = theme == NamedTheme.defaultTheme ? '' : '[${theme.name}]';

    await expectLater(
      find.byWidgetPredicate((widget) => true).first,
      matchesGoldenFile(
          '$folder/$scenarioName/$testName$dot$deviceName$themeName$postfix.png'),
    );
  }
}

typedef PumpingCallback = Future<void> Function(WidgetTester tester);

class GoldenTester extends GoldenTesterBase {
  GoldenTester({
    required Widget Function(Key key) widget,
    required Widget Function(Widget, Locale, NamedTheme) wrapper,
    String testName = '',
    PumpingCallback? postPumping = _defaultPostPumping,
  })  : _postPumping = postPumping,
        super(testName: testName, widget: widget, wrapper: wrapper);

  final PumpingCallback? _postPumping;

  Future<void> builder(
    WidgetTester tester,
    Device device,
    Locale locale,
    NamedTheme theme, {
    required String scenarioName,
    required Future<void> Function(GoldenTesterBase) scenario,
    bool wrapRunAsync = false,
  }) async {
    await setScenario(
      tester: tester,
      device: device,
      scenarioName: scenarioName,
      locale: locale,
      theme: theme,
    );
    if (wrapRunAsync) {
      await tester.runAsync(() async => await scenario(this));
    } else {
      await scenario(this);
    }
    await matchesGolden();
    await _postPumping?.call(tester);
  }

  static Future<void> _defaultPostPumping(WidgetTester tester) async {
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1));
  }
}
