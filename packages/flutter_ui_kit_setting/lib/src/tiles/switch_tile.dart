import 'package:flutter/material.dart';

/// 토글 스위치가 있는 설정 타일.
class SwitchTile extends StatelessWidget {
  const SwitchTile({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.leading,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? subtitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      title: Text(label, style: theme.textTheme.bodyLarge),
      subtitle: subtitle != null
          ? Text(subtitle!, style: theme.textTheme.bodySmall)
          : null,
      secondary: leading,
      value: value,
      onChanged: onChanged,
    );
  }
}
