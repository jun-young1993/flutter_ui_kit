import 'package:flutter/material.dart';

import '../models/setting_section.dart';
import '../sections/setting_section_widget.dart';
import '../tokens/setting_spacing.dart';

/// 설정 화면.
///
/// [sections] 리스트를 받아 섹션 단위로 구성된 설정 화면을 렌더링한다.
///
/// ```dart
/// SettingScreen(
///   title: '설정',
///   sections: [
///     SettingSection(
///       title: 'General',
///       items: [
///         SettingAppVersionTile(),
///         NavigationTile(label: 'Privacy Policy', onTap: () {}),
///       ],
///     ),
///     SettingSection(
///       title: 'Appearance',
///       items: [
///         SettingThemeToggleTile(
///           themeMode: themeMode,
///           onChanged: onThemeChanged,
///         ),
///       ],
///     ),
///   ],
/// )
/// ```
class SettingScreen extends StatelessWidget {
  const SettingScreen({
    super.key,
    required this.sections,
    this.title = 'Settings',
    this.appBar,
  });

  final List<SettingSection> sections;
  final String title;

  /// 기본 앱바를 대체할 커스텀 [PreferredSizeWidget].
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: Text(title),
            centerTitle: false,
          ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: SettingSpacing.x2,
          bottom: SettingSpacing.x4,
        ),
        children: [
          for (final section in sections)
            SettingSectionWidget(section: section),
        ],
      ),
    );
  }
}
