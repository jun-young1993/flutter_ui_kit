import 'package:flutter/material.dart';

import '../services/email_service.dart';

/// 개발자 이메일을 표시하고, 탭하면 이메일 앱을 여는 타일.
///
/// ```dart
/// SettingDeveloperEmailTile(
///   email: 'dev@example.com',
///   subject: '문의하기',
/// )
/// ```
class SettingDeveloperEmailTile extends StatelessWidget {
  const SettingDeveloperEmailTile({
    super.key,
    required this.email,
    this.label = 'Contact Developer',
    this.subject = '',
    this.body = '',
    this.leading,
  });

  final String email;
  final String label;
  final String subject;
  final String body;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: leading ?? Icon(
        Icons.mail_outline_rounded,
        color: theme.colorScheme.primary,
      ),
      title: Text(label, style: theme.textTheme.bodyLarge),
      subtitle: Text(
        email,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.primary,
        ),
      ),
      trailing: Icon(
        Icons.open_in_new_rounded,
        size: 16,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      onTap: () => EmailService.openEmailComposer(
        email: email,
        subject: subject,
        body: body,
      ),
    );
  }
}
