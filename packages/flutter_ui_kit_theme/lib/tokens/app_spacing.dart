import 'package:flutter/material.dart';

/// Spacing scale based on a 4 px base grid.
///
/// Use these constants instead of arbitrary numeric literals for all
/// padding, gap, and margin values in the UI. Widgets should always
/// reference named tokens so spacing decisions are traceable and
/// globally adjustable from a single location.
///
/// ```dart
/// Padding(
///   padding: const EdgeInsets.all(AppSpacing.x4), // 16 px
///   child: ...,
/// )
/// ```
abstract final class AppSpacing {
  AppSpacing._();

  static const double x0  = 0;   //  0 px
  static const double x1  = 4;   //  4 px
  static const double x2  = 8;   //  8 px
  static const double x3  = 12;  // 12 px
  static const double x4  = 16;  // 16 px
  static const double x5  = 20;  // 20 px
  static const double x6  = 24;  // 24 px
  static const double x8  = 32;  // 32 px
  static const double x10 = 40;  // 40 px
  static const double x12 = 48;  // 48 px
  static const double x16 = 64;  // 64 px
  static const double x20 = 80;  // 80 px
  static const double x24 = 96;  // 96 px

  // ─── Pre-built EdgeInsets shortcuts ───────────────────────────────────────

  /// Horizontal page gutter — 16 px each side.
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(
    horizontal: x4,
    vertical: x4,
  );

  /// Standard card inner padding — 16 px all sides.
  static const EdgeInsets cardPadding = EdgeInsets.all(x4);

  /// Compact inner padding — 12 px all sides.
  static const EdgeInsets compactPadding = EdgeInsets.all(x3);

  /// Button content padding — 24 px horizontal, 12 px vertical.
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: x6,
    vertical: x3,
  );

  /// Input field content padding — 16 px horizontal, 12 px vertical.
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: x4,
    vertical: x3,
  );

  // ─── SizedBox gap helpers ─────────────────────────────────────────────────

  static const Widget gap1  = SizedBox(height: x1,  width: x1);
  static const Widget gap2  = SizedBox(height: x2,  width: x2);
  static const Widget gap3  = SizedBox(height: x3,  width: x3);
  static const Widget gap4  = SizedBox(height: x4,  width: x4);
  static const Widget gap6  = SizedBox(height: x6,  width: x6);
  static const Widget gap8  = SizedBox(height: x8,  width: x8);

  static const Widget gapH1 = SizedBox(width: x1);
  static const Widget gapH2 = SizedBox(width: x2);
  static const Widget gapH3 = SizedBox(width: x3);
  static const Widget gapH4 = SizedBox(width: x4);
  static const Widget gapH6 = SizedBox(width: x6);

  static const Widget gapV1 = SizedBox(height: x1);
  static const Widget gapV2 = SizedBox(height: x2);
  static const Widget gapV3 = SizedBox(height: x3);
  static const Widget gapV4 = SizedBox(height: x4);
  static const Widget gapV6 = SizedBox(height: x6);
  static const Widget gapV8 = SizedBox(height: x8);
}
