import 'package:flutter/material.dart';

import '../models/setting_section.dart';
import '../tokens/setting_radius.dart';
import '../tokens/setting_spacing.dart';

/// [SettingSection]을 카드 형태로 렌더링하는 위젯.
class SettingSectionWidget extends StatelessWidget {
  const SettingSectionWidget({super.key, required this.section});

  final SettingSection section;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (section.title != null) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(
              SettingSpacing.x2,
              SettingSpacing.x2,
              SettingSpacing.x2,
              SettingSpacing.x1,
            ),
            child: Text(
              section.title!.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
        Card(
          margin: const EdgeInsets.symmetric(horizontal: SettingSpacing.x2),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SettingRadius.lg),
            side: BorderSide(
              color: theme.colorScheme.outlineVariant,
              width: 0.5,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              for (int i = 0; i < section.items.length; i++) ...[
                section.items[i],
                if (i < section.items.length - 1)
                  Divider(
                    height: 1,
                    indent: SettingSpacing.x2,
                    endIndent: SettingSpacing.x2,
                    color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
              ],
            ],
          ),
        ),
        const SizedBox(height: SettingSpacing.x2),
      ],
    );
  }
}
