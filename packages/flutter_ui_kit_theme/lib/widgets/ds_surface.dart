import 'package:flutter/material.dart';

import '../tokens/app_radius.dart';

/// Defines the elevation tier of an [DsSurface] container.
///
/// Maps directly to the Material 3 surface container roles:
/// https://m3.material.io/styles/color/the-color-system/color-roles
enum SurfaceLevel {
  /// [ColorScheme.surfaceContainerLowest] — deepest recessed areas.
  lowest,

  /// [ColorScheme.surfaceContainerLow] — card backgrounds, list tiles.
  low,

  /// [ColorScheme.surfaceContainer] — navigation bars, sidebars.
  base,

  /// [ColorScheme.surfaceContainerHigh] — dialogs, popovers.
  high,

  /// [ColorScheme.surfaceContainerHighest] — input fills, tooltips.
  highest,
}

/// A container that adopts a [ColorScheme] surface level as its background.
///
/// This is the foundational surface primitive of the design system.
/// All layouts and card-like components should be built on top of [DsSurface]
/// rather than hardcoding colors.
///
/// The color is sourced exclusively from [Theme.of(context).colorScheme] —
/// no color is ever hardcoded.
///
/// ```dart
/// DsSurface(
///   level: SurfaceLevel.low,
///   borderRadius: AppRadius.card,
///   padding: AppSpacing.cardPadding,
///   child: Text('Hello'),
/// )
/// ```
class DsSurface extends StatelessWidget {
  const DsSurface({
    super.key,
    required this.child,
    this.level = SurfaceLevel.base,
    this.padding,
    this.borderRadius,
    this.border,
    this.shadow,
  });

  final Widget child;

  /// Which M3 surface container tier to use as the background color.
  final SurfaceLevel level;

  /// Inner padding. When `null`, no padding is applied.
  final EdgeInsetsGeometry? padding;

  /// Override the default border radius. Defaults to [AppRadius.card].
  final BorderRadius? borderRadius;

  /// Optional border drawn on top of the surface.
  final BoxBorder? border;

  /// Optional box shadow. Prefer using [ColorScheme.shadow] for the color.
  final List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final color = switch (level) {
      SurfaceLevel.lowest  => cs.surfaceContainerLowest,
      SurfaceLevel.low     => cs.surfaceContainerLow,
      SurfaceLevel.base    => cs.surfaceContainer,
      SurfaceLevel.high    => cs.surfaceContainerHigh,
      SurfaceLevel.highest => cs.surfaceContainerHighest,
    };

    Widget content = padding != null
        ? Padding(padding: padding!, child: child)
        : child;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? AppRadius.card,
        border: border,
        boxShadow: shadow,
      ),
      child: content,
    );
  }
}
