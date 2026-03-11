import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';

/// Shared surface-stack overrides applied on top of any seed-generated [ColorScheme].
///
/// Extracts the common neutral navy surface palette so that all brand schemes
/// ([AppColorSchemes], [BrandBColorSchemes], …) share a single source of truth.
/// Changing a value here propagates to every brand automatically.
abstract final class AppSurfaceOverrides {
  AppSurfaceOverrides._();

  static ColorScheme applyDark(ColorScheme base) => base.copyWith(
    surface:                 AppColors.ink900,
    surfaceContainerLowest:  AppColors.ink950,
    surfaceContainerLow:     const Color(0xFF090D18),
    surfaceContainer:        const Color(0xFF0B1220),
    surfaceContainerHigh:    AppColors.ink800,
    surfaceContainerHighest: const Color(0xFF1A2D4A),
    onSurface:               AppColors.ink50,
    onSurfaceVariant:        AppColors.ink200,
    outline:                 AppColors.ink300,
    outlineVariant:          AppColors.ink500,
    scrim:                   AppColors.scrim,
  );

  static ColorScheme applyLight(ColorScheme base) => base.copyWith(
    surface:                 AppColors.ink0,
    surfaceContainerLowest:  AppColors.ink0,
    surfaceContainerLow:     AppColors.ink50,
    surfaceContainer:        AppColors.ink100,
    surfaceContainerHigh:    AppColors.ink200,
    surfaceContainerHighest: AppColors.ink200,
    onSurface:               AppColors.ink900,
    onSurfaceVariant:        AppColors.ink600,
    outline:                 AppColors.ink500,
    outlineVariant:          AppColors.ink300,
    scrim:                   AppColors.scrim,
  );
}

/// Default [ColorScheme] instances for the design system (violet / Brand A identity).
///
/// Both schemes are derived from [ColorScheme.fromSeed] with the brand's
/// primary violet seed color, giving full M3 tonal-palette compliance.
/// Surface levels are applied via [AppSurfaceOverrides] — the single source
/// of truth shared across all brand schemes.
abstract final class AppColorSchemes {
  AppColorSchemes._();

  /// Dark scheme — violet-primary on a deep navy background.
  static final ColorScheme dark = AppSurfaceOverrides.applyDark(
    ColorScheme.fromSeed(seedColor: AppColors.violet500, brightness: Brightness.dark),
  );

  /// Light scheme — violet-primary on a clean white surface stack.
  static final ColorScheme light = AppSurfaceOverrides.applyLight(
    ColorScheme.fromSeed(seedColor: AppColors.violet500, brightness: Brightness.light),
  );
}
