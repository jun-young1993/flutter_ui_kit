import 'package:flutter/animation.dart';

/// Motion tokens — durations and easing curves aligned with Material 3.
///
/// Follow M3's motion guidelines:
/// - Use [emphasized] for elements that move within the screen.
/// - Use [emphasizedDecel] for elements entering the screen (expand, appear).
/// - Use [emphasizedAccel] for elements exiting the screen (collapse, disappear).
///
/// Usage:
/// ```dart
/// AnimatedContainer(
///   duration: AppMotion.moderate,
///   curve: AppMotion.emphasized,
/// )
/// ```
abstract final class AppMotion {
  AppMotion._();

  // ─── Durations ────────────────────────────────────────────────────────────

  /// No animation — immediate state change.
  static const Duration instant    = Duration(milliseconds: 0);

  /// Micro-interaction feedback (e.g., button press ripple).
  static const Duration micro      = Duration(milliseconds: 100);

  /// Fast UI response (e.g., tooltip, icon swap).
  static const Duration fast       = Duration(milliseconds: 150);

  /// Standard short transition (e.g., chip select, toggle).
  static const Duration moderate   = Duration(milliseconds: 250);

  /// Default transition (e.g., card expand, dialog open).
  static const Duration standard   = Duration(milliseconds: 300);

  /// Deliberate/emphasis transition (e.g., hero, FAB morph).
  static const Duration deliberate = Duration(milliseconds: 400);

  /// Slow feedback (e.g., skeleton shimmer, staggered list).
  static const Duration slow       = Duration(milliseconds: 500);

  /// Full-screen page transition.
  static const Duration page       = Duration(milliseconds: 350);

  // ─── Easing curves (Material 3) ───────────────────────────────────────────

  /// M3 Standard — for elements moving within screen bounds.
  static const Curve emphasized       = Curves.easeInOutCubicEmphasized;

  /// M3 Standard decelerate — for elements entering the screen.
  static const Curve emphasizedDecel  = Curves.easeOutCubic;

  /// M3 Standard accelerate — for elements exiting the screen.
  static const Curve emphasizedAccel  = Curves.easeInCubic;

  /// Spring-like overshoot — for playful, expressive moments.
  static const Curve spring           = Curves.elasticOut;

  static const Curve linear           = Curves.linear;
  static const Curve easeIn           = Curves.easeIn;
  static const Curve easeOut          = Curves.easeOut;
  static const Curve easeInOut        = Curves.easeInOut;
}
