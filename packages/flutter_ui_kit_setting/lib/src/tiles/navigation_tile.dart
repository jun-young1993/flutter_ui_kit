import 'package:flutter/material.dart';

/// 다음 화면으로 이동하는 네비게이션 타일.
///
/// trailing에 기본으로 chevron 아이콘이 표시된다.
class NavigationTile extends StatelessWidget {
  const NavigationTile({
    super.key,
    required this.label,
    required this.onTap,
    this.subtitle,
    this.leading,
  });

  final String label;
  final VoidCallback onTap;
  final String? subtitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: leading,
      title: Text(label, style: theme.textTheme.bodyLarge),
      subtitle: subtitle != null
          ? Text(subtitle!, style: theme.textTheme.bodySmall)
          : null,
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      onTap: onTap,
    );
  }
}
