import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

/// A glassmorphism container that blurs the content behind it.
///
/// Every glass surface includes:
/// - [BackdropFilter] blur
/// - Translucent background from [ColorScheme.surfaceContainer]
/// - Soft border from [ColorScheme.outlineVariant]
///
/// ```dart
/// GlassCard(
///   onTap: () {},
///   child: Text('Hello'),
/// )
/// ```
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.animate = false,
    this.blur = 20.0,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  /// Fades the card in when first built.
  final bool animate;

  /// Blur sigma applied to the backdrop. Defaults to 20.
  final double blur;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final card = ClipRRect(
      borderRadius: AppRadius.card,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: cs.surfaceContainer.withValues(alpha: 0.6),
            borderRadius: AppRadius.card,
            border: Border.all(
              color: cs.outlineVariant.withValues(alpha: 0.35),
            ),
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap,
              borderRadius: AppRadius.card,
              child: Padding(
                padding: padding ?? AppSpacing.cardPadding,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );

    if (!animate) return card;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) => Opacity(opacity: value, child: child),
      child: card,
    );
  }
}
