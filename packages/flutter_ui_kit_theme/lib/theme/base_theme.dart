import 'package:flutter/material.dart';

import '../tokens/app_motion.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_typography.dart';

/// The single source of truth for all component theme configurations.
///
/// [BaseTheme.build] accepts a [ColorScheme] and produces a fully-configured
/// [ThemeData] with M3 enabled. Every component theme references [scheme]
/// instead of hardcoded colors.
///
/// Brand-specific packages call this with their own [ColorScheme] and
/// optionally apply `.copyWith(...)` for component-level overrides:
///
/// ```dart
/// class BrandATheme {
///   static ThemeData dark() => BaseTheme.build(BrandAColorSchemes.dark);
/// }
///
/// // With brand-specific component override
/// class BrandBTheme {
///   static ThemeData dark() =>
///       BaseTheme.build(BrandBColorSchemes.dark).copyWith(
///         elevatedButtonTheme: ...,
///       );
/// }
/// ```
abstract final class BaseTheme {
  BaseTheme._();

  static ThemeData build(
    ColorScheme scheme, {
    /// Optional font family. Falls back to 'Inter' → system font.
    String? fontFamily,
  }) {
    final tt = AppTypography.textTheme(fontFamily: fontFamily);
    final isDark = scheme.brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: tt,

      // ── AppBar ────────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: scheme.shadow,
        centerTitle: false,
        titleTextStyle: tt.titleLarge?.copyWith(color: scheme.onSurface),
        iconTheme: IconThemeData(color: scheme.onSurfaceVariant),
        actionsIconTheme: IconThemeData(color: scheme.onSurfaceVariant),
      ),

      // ── Card ──────────────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLow,
        shadowColor: scheme.shadow.withValues(alpha: isDark ? 0.4 : 0.12),
        elevation: isDark ? 2 : 1,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.card),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),

      // ── Buttons ───────────────────────────────────────────────────────────

      /// FilledButton = primary call-to-action in M3.
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(64, 48),
          padding: AppSpacing.buttonPadding,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.button),
          textStyle: tt.labelLarge,
        ),
      ),

      /// ElevatedButton = secondary tonal action with slight elevation.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.surfaceContainerLow,
          foregroundColor: scheme.primary,
          shadowColor: scheme.shadow.withValues(alpha: 0.2),
          minimumSize: const Size(64, 48),
          padding: AppSpacing.buttonPadding,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.button),
          elevation: 1,
          textStyle: tt.labelLarge,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          minimumSize: const Size(64, 48),
          padding: AppSpacing.buttonPadding,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.button),
          side: BorderSide(color: scheme.outline),
          textStyle: tt.labelLarge,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          minimumSize: const Size(48, 40),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.x4,
            vertical: AppSpacing.x2,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.button),
          textStyle: tt.labelLarge,
        ),
      ),

      // ── Input ─────────────────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        contentPadding: AppSpacing.inputPadding,
        border: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(
            color: scheme.outline.withValues(alpha: 0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(color: scheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(color: scheme.error, width: 2),
        ),
        hintStyle: tt.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
        labelStyle: tt.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
        errorStyle: tt.bodySmall?.copyWith(color: scheme.error),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
          final base = tt.labelMedium ?? const TextStyle();
          if (states.contains(WidgetState.focused)) {
            return base.copyWith(color: scheme.primary);
          }
          if (states.contains(WidgetState.error)) {
            return base.copyWith(color: scheme.error);
          }
          return base.copyWith(color: scheme.onSurfaceVariant);
        }),
      ),

      // ── Chip ──────────────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        selectedColor: scheme.primaryContainer,
        disabledColor: scheme.onSurface.withValues(alpha: 0.12),
        labelStyle: tt.labelMedium,
        secondaryLabelStyle: tt.labelMedium?.copyWith(
          color: scheme.onPrimaryContainer,
        ),
        side: BorderSide.none,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.x3,
          vertical: AppSpacing.x1,
        ),
      ),

      // ── Dialog ────────────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.dialog),
        titleTextStyle: tt.headlineSmall?.copyWith(color: scheme.onSurface),
        contentTextStyle: tt.bodyMedium?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),

      // ── BottomSheet ───────────────────────────────────────────────────────
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.bottomSheet),
        showDragHandle: true,
        dragHandleColor: scheme.onSurfaceVariant.withValues(alpha: 0.4),
        dragHandleSize: const Size(32, 4),
        modalBarrierColor: scheme.scrim.withValues(alpha: 0.5),
      ),

      // ── Navigation Bar (bottom nav) ───────────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surfaceContainer,
        surfaceTintColor: Colors.transparent,
        indicatorColor: scheme.primaryContainer,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: scheme.onPrimaryContainer, size: 24);
          }
          return IconThemeData(color: scheme.onSurfaceVariant, size: 24);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final base = tt.labelSmall ?? const TextStyle();
          if (states.contains(WidgetState.selected)) {
            return base.copyWith(
              color: scheme.onSurface,
              fontWeight: FontWeight.w600,
            );
          }
          return base.copyWith(color: scheme.onSurfaceVariant);
        }),
        height: 80,
        elevation: 0,
      ),

      // ── Navigation Rail ───────────────────────────────────────────────────
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        indicatorColor: scheme.primaryContainer,
        selectedIconTheme: IconThemeData(color: scheme.onPrimaryContainer),
        unselectedIconTheme: IconThemeData(color: scheme.onSurfaceVariant),
        selectedLabelTextStyle: tt.labelMedium?.copyWith(
          color: scheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelTextStyle: tt.labelMedium?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        elevation: 0,
      ),

      // ── Divider ───────────────────────────────────────────────────────────
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // ── ListTile ──────────────────────────────────────────────────────────
      listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        iconColor: scheme.onSurfaceVariant,
        titleTextStyle: tt.bodyLarge?.copyWith(color: scheme.onSurface),
        subtitleTextStyle: tt.bodyMedium?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.x4,
          vertical: AppSpacing.x1,
        ),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.allMd),
        minLeadingWidth: 0,
      ),

      // ── SnackBar ──────────────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: tt.bodyMedium?.copyWith(
          color: scheme.onInverseSurface,
        ),
        actionTextColor: scheme.inversePrimary,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.snackBar),
        elevation: 4,
      ),

      // ── Switch ────────────────────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return scheme.onPrimary;
          return scheme.onSurfaceVariant;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return scheme.primary;
          return scheme.surfaceContainerHighest;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.transparent;
          }
          return scheme.outline;
        }),
      ),

      // ── Checkbox ──────────────────────────────────────────────────────────
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return scheme.primary;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(scheme.onPrimary),
        side: BorderSide(color: scheme.outline, width: 1.5),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.allXs,
        ),
      ),

      // ── Radio ─────────────────────────────────────────────────────────────
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return scheme.primary;
          return scheme.onSurfaceVariant;
        }),
      ),

      // ── Tooltip ───────────────────────────────────────────────────────────
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: scheme.inverseSurface,
          borderRadius: AppRadius.allXs,
        ),
        textStyle: tt.bodySmall?.copyWith(color: scheme.onInverseSurface),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.x3,
          vertical: AppSpacing.x1,
        ),
        waitDuration: AppMotion.slow,
      ),

      // ── Page transitions ──────────────────────────────────────────────────
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          TargetPlatform.iOS:     CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS:   CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux:   FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
