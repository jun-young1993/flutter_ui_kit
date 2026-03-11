import 'package:flutter/material.dart';

import '../theme/app_color_schemes.dart';
import '../theme/base_theme.dart';

/// Brand A theme — violet identity, default design system style.
///
/// Brand A shares the same color scheme as the design system default
/// ([AppColorSchemes]). A separate [BrandAColorSchemes] class is unnecessary
/// because the violet seed and surface stack are identical — any future
/// divergence can be introduced here via [ThemeData.copyWith] overrides.
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: BrandATheme.light(),
///   darkTheme: BrandATheme.dark(),
///   themeMode: ThemeMode.system,
/// )
/// ```
abstract final class BrandATheme {
  BrandATheme._();

  static ThemeData light({String? fontFamily}) =>
      BaseTheme.build(AppColorSchemes.light, fontFamily: fontFamily);

  static ThemeData dark({String? fontFamily}) =>
      BaseTheme.build(AppColorSchemes.dark, fontFamily: fontFamily);
}
