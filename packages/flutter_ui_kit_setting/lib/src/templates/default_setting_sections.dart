import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

import '../models/setting_section.dart';
import '../tiles/setting_app_homepage_tile.dart';
import '../tiles/setting_app_share_tile.dart';
import '../tiles/setting_app_store_tile.dart';
import '../tiles/setting_app_version_tile.dart';
import '../tiles/setting_brand_toggle_tile.dart';
import '../tiles/setting_developer_email_tile.dart';
import '../tiles/setting_theme_toggle_tile.dart';
import '../tiles/setting_tile.dart';

/// 자주 사용되는 설정 섹션 목록을 반환하는 템플릿 함수.
///
/// 파라미터가 `null`이면 해당 타일/섹션은 자동으로 제외된다.
/// 스프레드 연산자로 커스텀 섹션과 조합해 사용한다.
///
/// ```dart
/// SettingScreen(
///   sections: [
///     ...buildDefaultSettingSections(
///       themeMode: _themeMode,
///       onThemeModeChanged: (m) => setState(() => _themeMode = m),
///       developerEmail: 'dev@example.com',
///       shareText: 'https://example.com/app',
///       appStoreUrl: 'https://apps.apple.com/app/id000000000',
///     ),
///     // 커스텀 섹션 추가
///     SettingSection(title: 'Custom', items: [...]),
///   ],
/// )
/// ```
List<SettingSection> buildDefaultSettingSections({
  // ── Appearance ─────────────────────────────────────────────
  /// 제공하면 테마 토글 타일이 표시된다.
  ThemeMode? themeMode,
  ValueChanged<ThemeMode>? onThemeModeChanged,

  /// 제공하면 브랜드 토글 타일이 표시된다.
  DsBrand? brand,
  ValueChanged<DsBrand>? onBrandChanged,

  // ── Developer ──────────────────────────────────────────────
  /// 제공하면 개발자 이메일 타일이 표시된다.
  String? developerEmail,
  String emailSubject = '',
  String emailBody = '',

  // ── App ────────────────────────────────────────────────────
  /// 제공하면 앱 공유 타일이 표시된다.
  String? shareText,

  /// 제공하면 App Store 타일이 표시된다.
  String? appStoreUrl,

  /// 제공하면 Google Play 타일이 표시된다.
  String? playStoreUrl,

  /// 제공하면 홈페이지 타일이 표시된다.
  String? homepageUrl,

  // ── About ──────────────────────────────────────────────────
  /// false로 설정하면 앱 버전 타일을 숨긴다.
  bool showAppVersion = true,
  bool showBuildNumber = true,

  /// 제공하면 앱 이름/설명 타일이 표시된다.
  String? appName,
  String? appDescription,
}) {
  final sections = <SettingSection>[];

  // ── Appearance ───────────────────────────────────────────────
  final appearanceItems = <Widget>[
    if (themeMode != null && onThemeModeChanged != null)
      SettingThemeToggleTile(
        themeMode: themeMode,
        onChanged: onThemeModeChanged,
      ),
    if (brand != null && onBrandChanged != null)
      SettingBrandToggleTile(
        brand: brand,
        onChanged: onBrandChanged,
      ),
  ];
  if (appearanceItems.isNotEmpty) {
    sections.add(SettingSection(title: 'Appearance', items: appearanceItems));
  }

  // ── Developer ────────────────────────────────────────────────
  if (developerEmail != null) {
    sections.add(SettingSection(
      title: 'Developer',
      items: [
        SettingDeveloperEmailTile(
          email: developerEmail,
          subject: emailSubject,
          body: emailBody,
        ),
      ],
    ));
  }

  // ── App ──────────────────────────────────────────────────────
  final appItems = <Widget>[
    if (shareText != null) SettingAppShareTile(shareText: shareText),
    if (appStoreUrl != null)
      SettingAppStoreTile(storeUrl: appStoreUrl, label: 'App Store'),
    if (playStoreUrl != null)
      SettingAppStoreTile(storeUrl: playStoreUrl, label: 'Google Play'),
    if (homepageUrl != null) SettingAppHomepageTile(homepageUrl: homepageUrl),
  ];
  if (appItems.isNotEmpty) {
    sections.add(SettingSection(title: 'App', items: appItems));
  }

  // ── About ────────────────────────────────────────────────────
  final aboutItems = <Widget>[
    if (showAppVersion)
      SettingAppVersionTile(showBuildNumber: showBuildNumber),
    if (appName != null)
      SettingTile(label: appName, subtitle: appDescription),
  ];
  if (aboutItems.isNotEmpty) {
    sections.add(SettingSection(title: 'About', items: aboutItems));
  }

  return sections;
}
