import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden/golden.dart';
import 'package:golden_toolkit/golden_toolkit.dart' hide Device;

const locales = <Locale>[
  Locale('en'),
];

void main() {
  setUpAll(() async {});

  /// flutter test --update-goldens test/devices/devices_test.dart
  group(
    'Example golden -',
    () {
      ExampleGoldenTester exampleTester = ExampleGoldenTester();

      setUp(() {
        exampleTester = ExampleGoldenTester();
      });

      testDeviceGoldens(
        'page',
        (tester, device, locale, theme) async {
          await loadAppFonts();
          return exampleTester.builder(
            tester,
            device,
            locale,
            theme,
            scenarioName: 'crash',
            scenario: (_) async {
              await exampleTester.init();
            },
          );
        },
        devices: [
          Device.iPhone5S,
          Device.iPhone11,
          Device.iPhone11Pro,
          Device.iPhone11ProMax,
          Device.iPhone14,
          Device.iPhone14Plus,
          Device.iPhone15Pro,
          Device.iPhone15ProMax,
          Device.iPadPro129,
          Device.iPadPro129Landscape,
          Device.iPad,
          Device.iPadLandscape,
          Device.fullHd,
          Device.macOS,
          Device.uHD4k,
        ],
        locales: [
          const Locale('en'),
        ],
      );
    },
  );
}

class ExampleGoldenTester extends GoldenTester {
  ExampleGoldenTester()
      : super(
          widget: (key) => const ExampleWidget(),
          wrapper: (child, locale, brightness) => MaterialApp(
            supportedLocales: locales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            locale: locale,
            home: Scaffold(body: child),
          ),
        );

  Future<void> init() async {
    await tester.pumpAndSettle();
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Center(
        child: Column(
      children: [
        Text('Width = ${media.size.width}', style: theme.textTheme.titleLarge),
        Text('Height = ${media.size.height}',
            style: theme.textTheme.titleLarge),
        Text('DevicePixelRatio = ${media.devicePixelRatio}',
            style: theme.textTheme.titleLarge),
      ],
    ));
  }
}
