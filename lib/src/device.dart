import 'dart:ui';

import 'package:flutter/widgets.dart';

/// https://iosref.com/res
/// https://developer.apple.com/design/human-interface-guidelines/layout#Device-screen-sizes-and-orientations
class Device {
  const Device({
    required this.name,
    required this.size,
    this.devicePixelRatio = 1.0,
    this.textScale = 1.0,
    this.brightness = Brightness.light,
    this.highContrast = false,
    this.safeArea = const EdgeInsets.all(0),
  });

  /// [iPhone5S] matches specs of iphone5s the smallest device
  /// iPhone SE (gen 1)
  static const Device iPhone5S = Device(
    name: 'iPhone5S',
    size: Size(640, 1136),
    devicePixelRatio: 2,
  );

  /// [iPhone11] matches specs of iphone11, but with lower DPI for performance
  static const Device iPhone11 = Device(
    name: 'iphone11',
    size: Size(828, 1792),
    devicePixelRatio: 2.0,
    safeArea: EdgeInsets.only(top: 44, bottom: 34),
  );

  static const Device iPhone11Pro = Device(
    name: 'iphone11Pro',
    size: Size(1125, 2436),
    devicePixelRatio: 3.0,
    safeArea: EdgeInsets.only(top: 44, bottom: 34),
  );

  static const Device iPhone11ProMax = Device(
    name: 'iphone11ProMax',
    size: Size(1242, 2688),
    devicePixelRatio: 3.0,
    safeArea: EdgeInsets.only(top: 44, bottom: 34),
  );

  static const Device iPhone14 = Device(
    name: 'iphone14',
    size: Size(1170, 2532),
    devicePixelRatio: 3.0,
    safeArea: EdgeInsets.only(top: 44, bottom: 34),
  );

  static const Device iPhone14Plus = Device(
    name: 'iphone14Plus',
    size: Size(1284, 2778),
    devicePixelRatio: 3.0,
    safeArea: EdgeInsets.only(top: 44, bottom: 34),
  );

  static const Device iPhone15Pro = Device(
    name: 'iphone15Pro',
    size: Size(1179, 2556),
    devicePixelRatio: 3.0,
    safeArea: EdgeInsets.only(top: 44, bottom: 34),
  );

  static const Device iPhone15ProMax = Device(
    name: 'iphone15ProMax',
    size: Size(1290, 2796),
    devicePixelRatio: 3.0,
    safeArea: EdgeInsets.only(top: 44, bottom: 34),
  );

  static const Device iPadPro129 = Device(
    name: 'iPadPro12.9',
    size: Size(2048, 2732),
    devicePixelRatio: 2.0,
  );

  static const Device iPadPro129Landscape = Device(
    name: 'iPadPro12.9Landscape',
    size: Size(2732, 2048),
    devicePixelRatio: 2.0,
  );

  /// iPad (gen 6, 5)
  static const Device iPad = Device(
    name: 'iPad',
    size: Size(1536, 2048),
    devicePixelRatio: 2.0,
  );

  static const Device iPadLandscape = Device(
    name: 'iPadLandscape',
    size: Size(2048, 1536),
    devicePixelRatio: 2.0,
  );

  /// [tabletLandscape] example of tablet that in landscape mode
  static const Device tabletLandscape = Device(
    name: 'tablet_landscape',
    size: Size(2732, 2048),
    devicePixelRatio: 2.0,
  );

  /// [tabletPortrait] example of tablet that in portrait mode
  static const Device tabletPortrait = Device(
    name: 'tablet_portrait',
    size: Size(2048, 2732),
    devicePixelRatio: 2.0,
  );

  static const Device fullHd = Device(
    name: 'FullHd',
    size: Size(1920, 1800),
    devicePixelRatio: 1,
  );
  static const Device macOS = Device(
    name: 'macOS',
    size: Size(2880, 1800),
    devicePixelRatio: 2,
  );
  static const Device uHD4k = Device(
    name: 'UHD4k',
    size: Size(3840, 2160),
  );

// flutter: 2.0
// flutter: 590.0
// flutter: 1180.0
// 1640 x 2360px
  static const Device iPadAirGen5 = Device(
    name: 'iPad_Air_Gen5',
    size: Size(1640, 2360),
    devicePixelRatio: 2.0,
  );

  static const Device iPadAirGen5Landscape = Device(
    name: 'iPad_Air_Gen5_Landscape',
    size: Size(2360, 1640),
    devicePixelRatio: 2.0,
  );

  static const Device iPad7102 = Device(
    name: 'iPad_7_10.2',
    size: Size(2160, 1620),
    devicePixelRatio: 2.0,
  );

  static const Device iPad7102Landscape = Device(
    name: 'iPad_7_10.2_Landscape',
    size: Size(2160, 1620),
    devicePixelRatio: 2.0,
  );

  static const Device iPhone5SLandscape = Device(
    name: "iPhone5S_Landscape",
    size: Size(1136, 640),
    devicePixelRatio: 2,
  );

  /// [iPhone11] matches specs of iphone11, but with lower DPI for performance
  static const Device iPhone11Landscape = Device(
    name: "iphone11_Landscape",
    size: Size(1792, 828),
    devicePixelRatio: 2.0,
    safeArea: EdgeInsets.only(left: 44, right: 34),
  );

  static const Device iPhone11ProLandscape = Device(
    name: "iphone11Pro_Landscape",
    size: Size(2436, 1125),
    devicePixelRatio: 3.0,
    safeArea: EdgeInsets.only(left: 44, right: 34),
  );

  static const Device iPhone11ProMaxLandscape = Device(
    name: "iphone11ProMax_Landscape",
    size: Size(2688, 1242),
    devicePixelRatio: 3.0,
    safeArea: EdgeInsets.only(left: 44, right: 34),
  );

  final String name;
  final Size size;
  final double devicePixelRatio;
  final double textScale;
  final Brightness brightness;
  final bool highContrast;
  final EdgeInsets safeArea;

  Device copyWith({
    String? name,
    Size? size,
    double? devicePixelRatio,
    double? textScale,
    Brightness? brightness,
    bool? highContrast,
    EdgeInsets? safeArea,
  }) {
    return Device(
      name: name ?? this.name,
      size: size ?? this.size,
      devicePixelRatio: devicePixelRatio ?? this.devicePixelRatio,
      textScale: textScale ?? this.textScale,
      brightness: brightness ?? this.brightness,
      highContrast: highContrast ?? this.highContrast,
      safeArea: safeArea ?? this.safeArea,
    );
  }

  /// [toTheme] convenience method to copy the current device and apply needed theme and contrast
  Device toTheme({String? name, Brightness? brightness, bool? highContrast}) {
    return copyWith(
        name: name, brightness: brightness, highContrast: highContrast);
  }

  @override
  String toString() {
    return 'Device: $name, ${size.width}x${size.height} br: $brightness, contrast: $highContrast, ratio: $devicePixelRatio, text: $textScale, safe: $safeArea';
  }
}
