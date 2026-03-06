import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show LaunchMode, launchUrl;

import 'setting_external_link_tile.dart';

/// 앱스토어 / 플레이스토어로 이동하는 타일.
///
/// 탭하면 [storeUrl]을 외부 브라우저(또는 스토어 앱)로 연다.
///
/// ```dart
/// SettingAppStoreTile(storeUrl: 'https://apps.apple.com/app/id000000000')
/// SettingAppStoreTile(
///   label: '스토어 평가하기',
///   storeUrl: 'https://play.google.com/store/apps/details?id=com.example.app',
///   leading: Icon(Icons.star_outline_rounded),
/// )
/// ```
class SettingAppStoreTile extends StatelessWidget {
  const SettingAppStoreTile({
    super.key,
    required this.storeUrl,
    this.label = 'App Store',
    this.leading,
  });

  /// 연결할 스토어 URL (App Store 또는 Play Store).
  final String storeUrl;

  final String label;
  final Widget? leading;

  Future<void> _launch() async {
    await launchUrl(Uri.parse(storeUrl), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return SettingExternalLinkTile(
      label: label,
      subtitle: storeUrl,
      defaultIcon: Icons.store_rounded,
      leading: leading,
      onTap: _launch,
    );
  }
}
