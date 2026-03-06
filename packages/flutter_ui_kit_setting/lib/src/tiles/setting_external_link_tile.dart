import 'package:flutter/material.dart';

/// 외부 링크(공유, 스토어 등)용 공통 내부 타일 위젯.
///
/// [SettingAppShareTile], [SettingAppStoreTile] 등이 내부적으로 사용한다.
/// 이 위젯은 공개 API가 아니므로 barrel에서 export하지 않는다.
class SettingExternalLinkTile extends StatelessWidget {
  const SettingExternalLinkTile({
    super.key,
    required this.label,
    required this.subtitle,
    required this.defaultIcon,
    required this.onTap,
    this.leading,
  });

  final String label;
  final String subtitle;
  final IconData defaultIcon;
  final VoidCallback onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: leading ??
          Icon(
            defaultIcon,
            color: theme.colorScheme.primary,
          ),
      title: Text(label, style: theme.textTheme.bodyLarge),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.primary,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(
        Icons.open_in_new_rounded,
        size: 16,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      onTap: onTap,
    );
  }
}
