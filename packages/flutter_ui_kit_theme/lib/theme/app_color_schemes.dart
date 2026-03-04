import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';

/// Default [ColorScheme] instances for the design system.
///
/// Both schemes are derived from [ColorScheme.fromSeed] with the brand's
/// primary violet seed color, giving full M3 tonal-palette compliance.
/// Surface levels are then precision-overridden to match the product's
/// visual identity (#0A0E1A dark background, #0D1F3C dark surface).
///
/// For brand-specific schemes, see [BrandAColorSchemes] and
/// [BrandBColorSchemes] in the `brand/` directory.
abstract final class AppColorSchemes {
  AppColorSchemes._();

  // ─── Dark ─────────────────────────────────────────────────────────────────

  /// Dark scheme — violet-primary on a deep navy background.
  static final ColorScheme dark = ColorScheme.fromSeed(
    seedColor: AppColors.violet500,
    brightness: Brightness.dark,
  ).copyWith(
    // Override the M3-generated surface stack with the brand's navy palette.
    surface:                   AppColors.ink900,        // #0A0E1A
    surfaceContainerLowest:    AppColors.ink950,        // #070B14
    surfaceContainerLow:       const Color(0xFF090D18),
    surfaceContainer:          const Color(0xFF0B1220),
    surfaceContainerHigh:      AppColors.ink800,        // #0D1F3C
    surfaceContainerHighest:   const Color(0xFF162540),
    onSurface:                 AppColors.ink100,
    onSurfaceVariant:          AppColors.ink300,
    outline:                   AppColors.ink600,
    outlineVariant:            AppColors.ink700,
    scrim:                     AppColors.scrim,
  );

  // ─── Light ────────────────────────────────────────────────────────────────

  /// Light scheme — violet-primary on a clean white surface stack.
  static final ColorScheme light = ColorScheme.fromSeed(
    seedColor: AppColors.violet500,
    brightness: Brightness.light,
  ).copyWith(
    surface:                   AppColors.ink0,          // #FFFFFF
    surfaceContainerLowest:    AppColors.ink0,
    surfaceContainerLow:       AppColors.ink50,         // #F8F9FB
    surfaceContainer:          AppColors.ink100,        // #EEF0F4
    surfaceContainerHigh:      AppColors.ink200,        // #D8DCE6
    surfaceContainerHighest:   AppColors.ink300,        // #B4BAC8
    onSurface:                 AppColors.ink900,
    onSurfaceVariant:          AppColors.ink600,
    outline:                   AppColors.ink500,
    outlineVariant:            AppColors.ink300,
    scrim:                     AppColors.scrim,
  );
}
