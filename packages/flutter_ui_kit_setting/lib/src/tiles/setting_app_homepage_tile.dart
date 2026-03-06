import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show LaunchMode, launchUrl;

import 'setting_external_link_tile.dart';

/// 앱 홈페이지로 이동하는 타일.
///
/// 탭하면 [homepageUrl]을 외부 브라우저로 연다.
///
/// ```dart
/// SettingAppHomepageTile(homepageUrl: 'https://example.com')
/// SettingAppHomepageTile(
///   label: '공식 홈페이지',
///   homepageUrl: 'https://example.com',
///   leading: Icon(Icons.language_rounded),
/// )
/// ```
class SettingAppHomepageTile extends StatelessWidget {
  const SettingAppHomepageTile({
    super.key,
    required this.homepageUrl,
    this.label = 'Homepage',
    this.leading,
  });

  /// 연결할 홈페이지 URL.
  final String homepageUrl;

  final String label;
  final Widget? leading;

  Future<void> _launch() async {
    await launchUrl(
      Uri.parse(homepageUrl),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingExternalLinkTile(
      label: label,
      subtitle: homepageUrl,
      defaultIcon: Icons.language_rounded,
      leading: leading,
      onTap: _launch,
    );
  }
}
