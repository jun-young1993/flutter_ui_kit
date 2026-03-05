import 'package:flutter/material.dart';

/// 기본 설정 타일.
///
/// 레이블과 선택적 서브타이틀, leading/trailing 위젯,
/// 탭 콜백을 지원하는 범용 타일이다.
class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.label,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  final String label;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

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
      trailing: trailing,
      onTap: onTap,
    );
  }
}
