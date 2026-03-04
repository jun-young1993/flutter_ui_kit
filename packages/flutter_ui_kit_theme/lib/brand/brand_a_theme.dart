import 'package:flutter/material.dart';

import '../theme/base_theme.dart';
import '../tokens/app_colors.dart';

/// Color schemes for Brand A — the default violet identity.
///
/// Inherits the same seed color as [AppColorSchemes] but is kept as a
/// separate class so Brand A can diverge independently in the future
/// (e.g., slightly adjusted primaryContainer tones, brand-specific error
/// palette) without touching the shared base.
abstract final class BrandAColorSchemes {
  BrandAColorSchemes._();

  static final ColorScheme dark = ColorScheme.fromSeed(
    seedColor: AppColors.violet500,
    brightness: Brightness.dark,
  ).copyWith(
    surface:                 AppColors.ink900,
    surfaceContainerLowest:  AppColors.ink950,
    surfaceContainerLow:     const Color(0xFF090D18),
    surfaceContainer:        const Color(0xFF0B1220),
    surfaceContainerHigh:    AppColors.ink800,
    surfaceContainerHighest: const Color(0xFF162540),
    onSurface:               AppColors.ink100,
    onSurfaceVariant:        AppColors.ink300,
    outline:                 AppColors.ink600,
    outlineVariant:          AppColors.ink700,
  );

  static final ColorScheme light = ColorScheme.fromSeed(
    seedColor: AppColors.violet500,
    brightness: Brightness.light,
  ).copyWith(
    surface:                 AppColors.ink0,
    surfaceContainerLowest:  AppColors.ink0,
    surfaceContainerLow:     AppColors.ink50,
    surfaceContainer:        AppColors.ink100,
    surfaceContainerHigh:    AppColors.ink200,
    surfaceContainerHighest: AppColors.ink300,
    onSurface:               AppColors.ink900,
    onSurfaceVariant:        AppColors.ink600,
    outline:                 AppColors.ink500,
    outlineVariant:          AppColors.ink300,
  );
}

/// Brand A theme — violet identity, default design system style.
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
      BaseTheme.build(BrandAColorSchemes.light, fontFamily: fontFamily);

  static ThemeData dark({String? fontFamily}) =>
      BaseTheme.build(BrandAColorSchemes.dark, fontFamily: fontFamily);
}
