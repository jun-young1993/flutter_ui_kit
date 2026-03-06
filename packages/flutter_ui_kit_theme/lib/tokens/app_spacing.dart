import 'package:flutter/widgets.dart';

/// 8pt spacing system tokens.
///
/// Use these constants instead of arbitrary numeric literals for all
/// padding, gap, and margin values in the UI. Widgets should always
/// reference named tokens so spacing decisions are traceable and
/// globally adjustable from a single location.
///
/// ```dart
/// Padding(
///   padding: const EdgeInsets.all(AppSpacing.x2), // 16 px
///   child: ...,
/// )
/// ```
abstract final class AppSpacing {
  AppSpacing._();

  static const double x0_5 = 4;   //  4 px
  static const double x1   = 8;   //  8 px
  static const double x1_5 = 12;  // 12 px
  static const double x2   = 16;  // 16 px
  static const double x3   = 24;  // 24 px
  static const double x4   = 32;  // 32 px
  static const double x5   = 40;  // 40 px
  static const double x6   = 48;  // 48 px

  // ─── Pre-built EdgeInsets shortcuts ───────────────────────────────────────

  /// Screen-level padding — 16 px all sides.
  static const EdgeInsets screenPadding = EdgeInsets.all(x2);

  /// Horizontal page gutter — 16 px each side.
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(
    horizontal: x2,
    vertical: x2,
  );

  /// Standard card inner padding — 16 px all sides.
  static const EdgeInsets cardPadding = EdgeInsets.all(x2);

  /// Compact inner padding — 12 px all sides.
  static const EdgeInsets compactPadding = EdgeInsets.all(x1_5);

  /// Button content padding — 24 px horizontal, 12 px vertical.
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: x3,
    vertical: x1_5,
  );

  /// Input field content padding — 16 px horizontal, 12 px vertical.
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: x2,
    vertical: x1_5,
  );

  // ─── SizedBox gap helpers ─────────────────────────────────────────────────

  static const Widget gap0_5 = SizedBox(height: x0_5, width: x0_5);
  static const Widget gap1   = SizedBox(height: x1,   width: x1);
  static const Widget gap1_5 = SizedBox(height: x1_5, width: x1_5);
  static const Widget gap2   = SizedBox(height: x2,   width: x2);
  static const Widget gap3   = SizedBox(height: x3,   width: x3);
  static const Widget gap4   = SizedBox(height: x4,   width: x4);
  static const Widget gap5   = SizedBox(height: x5,   width: x5);
  static const Widget gap6   = SizedBox(height: x6,   width: x6);

  static const Widget gapH0_5 = SizedBox(width: x0_5);
  static const Widget gapH1   = SizedBox(width: x1);
  static const Widget gapH1_5 = SizedBox(width: x1_5);
  static const Widget gapH2   = SizedBox(width: x2);
  static const Widget gapH3   = SizedBox(width: x3);
  static const Widget gapH4   = SizedBox(width: x4);

  static const Widget gapV0_5 = SizedBox(height: x0_5);
  static const Widget gapV1   = SizedBox(height: x1);
  static const Widget gapV1_5 = SizedBox(height: x1_5);
  static const Widget gapV2   = SizedBox(height: x2);
  static const Widget gapV3   = SizedBox(height: x3);
  static const Widget gapV4   = SizedBox(height: x4);
  static const Widget gapV5   = SizedBox(height: x5);
  static const Widget gapV6   = SizedBox(height: x6);
}
