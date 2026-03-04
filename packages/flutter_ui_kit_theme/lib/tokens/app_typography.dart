import 'package:flutter/material.dart';

/// Typography tokens — implements the Material 3 type scale.
///
/// The default font family is `Inter`. To use a custom font, pass it
/// via [textTheme]. The consuming app is responsible for loading the
/// font (via `pubspec.yaml` assets or the `google_fonts` package).
///
/// Colors are intentionally omitted here; they are derived automatically
/// by Flutter from [ColorScheme.onSurface] and related roles at runtime.
///
/// Usage:
/// ```dart
/// // In BaseTheme
/// textTheme: AppTypography.textTheme(),
///
/// // With custom font
/// textTheme: AppTypography.textTheme(fontFamily: 'Poppins'),
/// ```
abstract final class AppTypography {
  AppTypography._();

  static const String _defaultFontFamily = 'Inter';

  /// Returns the full Material 3 type scale.
  ///
  /// [fontFamily] overrides the default `Inter`. When `null`, falls back
  /// to `Inter`, which in turn falls back to the platform system font if
  /// not loaded by the app.
  static TextTheme textTheme({String? fontFamily}) {
    final family = fontFamily ?? _defaultFontFamily;
    return TextTheme(
      // ── Display ──────────────────────────────────────────────────────────
      displayLarge: TextStyle(
        fontFamily: family,
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        height: 1.12,
      ),
      displayMedium: TextStyle(
        fontFamily: family,
        fontSize: 45,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.16,
      ),
      displaySmall: TextStyle(
        fontFamily: family,
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.22,
      ),

      // ── Headline ─────────────────────────────────────────────────────────
      headlineLarge: TextStyle(
        fontFamily: family,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.25,
      ),
      headlineMedium: TextStyle(
        fontFamily: family,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.29,
      ),
      headlineSmall: TextStyle(
        fontFamily: family,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.33,
      ),

      // ── Title ─────────────────────────────────────────────────────────────
      titleLarge: TextStyle(
        fontFamily: family,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.27,
      ),
      titleMedium: TextStyle(
        fontFamily: family,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.50,
      ),
      titleSmall: TextStyle(
        fontFamily: family,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.43,
      ),

      // ── Body ──────────────────────────────────────────────────────────────
      bodyLarge: TextStyle(
        fontFamily: family,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.50,
      ),
      bodyMedium: TextStyle(
        fontFamily: family,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.43,
      ),
      bodySmall: TextStyle(
        fontFamily: family,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.33,
      ),

      // ── Label ─────────────────────────────────────────────────────────────
      labelLarge: TextStyle(
        fontFamily: family,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.43,
      ),
      labelMedium: TextStyle(
        fontFamily: family,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        height: 1.33,
      ),
      labelSmall: TextStyle(
        fontFamily: family,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        height: 1.45,
      ),
    );
  }
}
