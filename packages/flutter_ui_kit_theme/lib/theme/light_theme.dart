import 'package:flutter/material.dart';

import 'app_color_schemes.dart';
import 'base_theme.dart';

/// Default light [ThemeData] built from [AppColorSchemes.light].
///
/// Use this when your app does not require brand-level customisation:
/// ```dart
/// MaterialApp(
///   theme: LightTheme.build(),
///   darkTheme: DarkTheme.build(),
///   themeMode: ThemeMode.system,
/// )
/// ```
abstract final class LightTheme {
  LightTheme._();

  static ThemeData build({String? fontFamily}) =>
      BaseTheme.build(AppColorSchemes.light, fontFamily: fontFamily);
}
