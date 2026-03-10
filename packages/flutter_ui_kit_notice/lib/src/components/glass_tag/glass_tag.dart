import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

/// A pill-shaped glassmorphism tag for categories, statuses, or labels.
///
/// ```dart
/// GlassTag(label: '공지')
/// GlassTag(label: 'NEW', color: Theme.of(context).colorScheme.error)
/// ```
class GlassTag extends StatelessWidget {
  const GlassTag({
    super.key,
    required this.label,
    this.color,
  });

  final String label;

  /// Tint color for the tag background and text. Defaults to [ColorScheme.primary].
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final tagColor = color ?? cs.primary;

    return ClipRRect(
      borderRadius: AppRadius.chip,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: tagColor.withValues(alpha: 0.15),
            borderRadius: AppRadius.chip,
            border: Border.all(
              color: tagColor.withValues(alpha: 0.35),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.x1_5,
              vertical: AppSpacing.x0_5,
            ),
            child: Text(
              label,
              style: tt.labelSmall?.copyWith(color: tagColor),
            ),
          ),
        ),
      ),
    );
  }
}
