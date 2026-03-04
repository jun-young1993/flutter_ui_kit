import 'package:flutter/material.dart';

import '../theme/base_theme.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_typography.dart';

/// Color schemes for Brand B — an emerald / green identity.
///
/// Demonstrates how a second product line can share [BaseTheme] infrastructure
/// while presenting a completely different visual personality. Only the seed
/// color changes; the surface stack uses the same neutral navy palette.
abstract final class BrandBColorSchemes {
  BrandBColorSchemes._();

  static final ColorScheme dark = ColorScheme.fromSeed(
    seedColor: AppColors.emerald500,
    brightness: Brightness.dark,
  ).copyWith(
    // Brand B uses the same premium dark surface stack.
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
    seedColor: AppColors.emerald500,
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

/// Brand B theme — emerald identity with more rounded, approachable style.
///
/// Extends [BaseTheme] and applies Brand B–specific component overrides
/// using [ThemeData.copyWith] without reimplementing core logic.
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: BrandBTheme.light(),
///   darkTheme: BrandBTheme.dark(),
///   themeMode: ThemeMode.system,
/// )
/// ```
abstract final class BrandBTheme {
  BrandBTheme._();

  static ThemeData light({String? fontFamily}) =>
      _applyOverrides(BaseTheme.build(BrandBColorSchemes.light, fontFamily: fontFamily));

  static ThemeData dark({String? fontFamily}) =>
      _applyOverrides(BaseTheme.build(BrandBColorSchemes.dark, fontFamily: fontFamily));

  /// Brand B overrides on top of BaseTheme.
  ///
  /// Brand B uses more rounded corners (xl instead of md for buttons) and a
  /// slightly larger minimum button height to feel more spacious/consumer-friendly.
  static ThemeData _applyOverrides(ThemeData base) {
    final scheme = base.colorScheme;
    final tt = AppTypography.textTheme();

    return base.copyWith(
      // More rounded buttons — Brand B's friendlier personality.
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(64, 52),
          padding: AppSpacing.buttonPadding,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.allXl),
          textStyle: tt.labelLarge,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.surfaceContainerLow,
          foregroundColor: scheme.primary,
          minimumSize: const Size(64, 52),
          padding: AppSpacing.buttonPadding,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.allXl),
          elevation: 1,
          textStyle: tt.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          minimumSize: const Size(64, 52),
          padding: AppSpacing.buttonPadding,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.allXl),
          side: BorderSide(color: scheme.outline),
          textStyle: tt.labelLarge,
        ),
      ),
      // Brand B cards are more rounded.
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLow,
        shadowColor: scheme.shadow.withValues(
          alpha: scheme.brightness == Brightness.dark ? 0.4 : 0.12,
        ),
        elevation: scheme.brightness == Brightness.dark ? 2 : 1,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.allXl),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}
