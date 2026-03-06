import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'setting_external_link_tile.dart';

/// 앱 공유 타일.
///
/// 탭하면 [shareText]를 시스템 공유 시트로 내보낸다.
///
/// ```dart
/// SettingAppShareTile(shareText: 'https://example.com/app')
/// SettingAppShareTile(
///   label: '앱 공유하기',
///   shareText: 'https://example.com/app',
///   leading: Icon(Icons.share),
/// )
/// ```
class SettingAppShareTile extends StatelessWidget {
  const SettingAppShareTile({
    super.key,
    required this.shareText,
    this.label = 'Share App',
    this.leading,
  });

  /// 공유할 텍스트 (앱 URL 등).
  final String shareText;

  final String label;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return SettingExternalLinkTile(
      label: label,
      subtitle: shareText,
      defaultIcon: Icons.ios_share_rounded,
      leading: leading,
      onTap: () => SharePlus.instance.share(ShareParams(text: shareText)),
    );
  }
}
