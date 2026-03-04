import 'package:flutter/material.dart';

/// Border radius tokens.
///
/// Provides both raw [double] values and pre-built [BorderRadius] constants
/// for the most common UI surfaces. All values are `const` and zero-cost.
///
/// Usage:
/// ```dart
/// // Raw value — for custom shapes
/// Radius.circular(AppRadius.lg)
///
/// // Semantic preset — for common surfaces
/// Container(decoration: BoxDecoration(borderRadius: AppRadius.card))
/// ```
abstract final class AppRadius {
  AppRadius._();

  // ─── Raw double scale ─────────────────────────────────────────────────────

  static const double none = 0;
  static const double xs   = 4;
  static const double sm   = 8;
  static const double md   = 12;
  static const double lg   = 16;
  static const double xl   = 24;
  static const double xxl  = 32;
  /// Use for pill-shaped chips and badges.
  static const double full = 999;

  // ─── Semantic BorderRadius presets ────────────────────────────────────────

  static const BorderRadius card = BorderRadius.all(Radius.circular(lg));

  static const BorderRadius button = BorderRadius.all(Radius.circular(md));

  static const BorderRadius input = BorderRadius.all(Radius.circular(md));

  /// Full-pill shape for chips, tags, and badges.
  static const BorderRadius chip = BorderRadius.all(Radius.circular(full));

  static const BorderRadius dialog = BorderRadius.all(Radius.circular(xl));

  /// Top-rounded only — for bottom sheets and drawers.
  static const BorderRadius bottomSheet = BorderRadius.only(
    topLeft: Radius.circular(xl),
    topRight: Radius.circular(xl),
  );

  static const BorderRadius snackBar = BorderRadius.all(Radius.circular(sm));

  static const BorderRadius avatar = BorderRadius.all(Radius.circular(full));

  // ─── General-purpose symmetric presets ────────────────────────────────────

  static const BorderRadius allXs  = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius allSm  = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius allMd  = BorderRadius.all(Radius.circular(md));
  static const BorderRadius allLg  = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius allXl  = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius allXxl = BorderRadius.all(Radius.circular(xxl));

  // ─── Dynamic helper ───────────────────────────────────────────────────────

  /// Returns a uniform [BorderRadius] for a custom [value].
  static BorderRadius circular(double value) => BorderRadius.circular(value);
}
