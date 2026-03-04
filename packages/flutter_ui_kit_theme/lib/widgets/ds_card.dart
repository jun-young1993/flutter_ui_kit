import 'package:flutter/material.dart';

import '../tokens/app_radius.dart';
import '../tokens/app_spacing.dart';
import 'ds_surface.dart';

/// A tappable card built on the design system's surface token system.
///
/// [DsCard] composes [DsSurface] with [InkWell] so it correctly:
/// - Sources its background from [ColorScheme] (via [SurfaceLevel])
/// - Uses token-based padding and border radius
/// - Provides ink ripple feedback anchored to the correct clip boundary
///
/// Do NOT set a background color on a Card manually — always let the
/// surface level drive the color.
///
/// ```dart
/// DsCard(
///   level: SurfaceLevel.low,
///   onTap: () => ...,
///   child: Column(
///     crossAxisAlignment: CrossAxisAlignment.start,
///     children: [
///       Text('Title', style: Theme.of(context).textTheme.titleMedium),
///       AppSpacing.gapV2,
///       Text('Subtitle', style: Theme.of(context).textTheme.bodyMedium),
///     ],
///   ),
/// )
/// ```
class DsCard extends StatelessWidget {
  const DsCard({
    super.key,
    required this.child,
    this.level = SurfaceLevel.low,
    this.padding = AppSpacing.cardPadding,
    this.borderRadius,
    this.shadow,
    this.border,
    this.onTap,
    this.onLongPress,
  });

  final Widget child;

  /// Surface tier — determines background color from [ColorScheme].
  final SurfaceLevel level;

  /// Inner padding. Defaults to [AppSpacing.cardPadding] (16 px all sides).
  final EdgeInsetsGeometry padding;

  /// Defaults to [AppRadius.card].
  final BorderRadius? borderRadius;

  /// Optional shadow. Sourced from [ColorScheme.shadow] in the consuming widget.
  final List<BoxShadow>? shadow;

  /// Optional border.
  final BoxBorder? border;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? AppRadius.card;

    return ClipRRect(
      borderRadius: radius,
      child: DsSurface(
        level: level,
        borderRadius: radius,
        shadow: shadow,
        border: border,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            borderRadius: radius,
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    );
  }
}
