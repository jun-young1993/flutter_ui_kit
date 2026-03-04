import 'package:flutter/material.dart';

import 'app_color_schemes.dart';
import 'base_theme.dart';

/// Default dark [ThemeData] built from [AppColorSchemes.dark].
///
/// Use this when your app does not require brand-level customisation:
/// ```dart
/// MaterialApp(
///   theme: LightTheme.build(),
///   darkTheme: DarkTheme.build(),
///   themeMode: ThemeMode.system,
/// )
/// ```
abstract final class DarkTheme {
  DarkTheme._();

  static ThemeData build({String? fontFamily}) =>
      BaseTheme.build(AppColorSchemes.dark, fontFamily: fontFamily);
}
