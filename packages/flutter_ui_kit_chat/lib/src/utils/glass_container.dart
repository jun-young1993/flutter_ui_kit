import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/chat_performance_mode.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.blurSigma = 12,
    this.opacity = 0.7,
    this.borderGradient,
    this.enablePerformanceMode = false,
    this.performanceMode = ChatPerformanceMode.off,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.padding,
    this.margin,
    this.backgroundGradient,
    this.boxShadow,
  });

  final Widget child;
  final double blurSigma;
  final double opacity;
  final Gradient? borderGradient;
  final bool enablePerformanceMode;
  final ChatPerformanceMode performanceMode;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Gradient? backgroundGradient;
  final List<BoxShadow>? boxShadow;

  bool get _shouldDisableBlur {
    if (!enablePerformanceMode) return false;
    return performanceMode == ChatPerformanceMode.medium ||
        performanceMode == ChatPerformanceMode.high;
  }

  @override
  Widget build(BuildContext context) {
    final Widget panel = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: backgroundGradient ??
            const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0x66FFFFFF), Color(0x33FFFFFF)],
            ),
        border: Border.all(
          width: 1,
          color: Colors.white.withValues(alpha: 0.18),
        ),
        boxShadow: boxShadow,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8),
        child: child,
      ),
    );

    final Widget clipped = ClipRRect(
      borderRadius: borderRadius,
      child: Opacity(
        opacity: opacity.clamp(0, 1),
        child: _shouldDisableBlur
            ? panel
            : BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
                child: panel,
              ),
      ),
    );

    final Widget withBorder = borderGradient == null
        ? clipped
        : DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: borderGradient,
            ),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: clipped,
            ),
          );

    return Container(
      margin: margin,
      child: withBorder,
    );
  }
}
