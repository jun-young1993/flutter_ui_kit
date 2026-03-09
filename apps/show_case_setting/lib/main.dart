import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_l10n/flutter_ui_kit_l10n.dart';
import 'package:flutter_ui_kit_setting/flutter_ui_kit_setting.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final controller = DsThemeController();
  await controller.init();
  runApp(ShowCaseApp(controller: controller));
}

class ShowCaseApp extends StatelessWidget {
  const ShowCaseApp({super.key, required this.controller});

  final DsThemeController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, __) => MaterialApp(
        title: 'flutter_ui_kit_setting',
        debugShowCheckedModeBanner: false,
        theme: controller.lightTheme,
        darkTheme: controller.darkTheme,
        themeMode: controller.themeMode,
        locale: controller.locale,
        localizationsDelegates: UiKitLocalizations.localizationsDelegates,
        supportedLocales: UiKitLocalizations.supportedLocales,
        home: HomePage(controller: controller),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.controller});

  final DsThemeController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_ui_kit_setting'),
        centerTitle: false,
        actions: [
          SettingGearButton(
            animate: true,
            onPressed: () => _openSettings(context),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.settings_outlined,
              size: 72,
              color: theme.colorScheme.primary.withValues(alpha: 0.8),
            ),
            const SizedBox(height: 24),
            Text(
              'Setting UI Kit',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '설정 화면 UI 컴포넌트 쇼케이스',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 40),
            FilledButton.icon(
              onPressed: () => _openSettings(context),
              icon: const Icon(Icons.settings_rounded),
              label: const Text('설정 화면 열기'),
            ),
          ],
        ),
      ),
    );
  }

  void _openSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _SampleSettingScreen(controller: controller),
      ),
    );
  }
}

class _SampleSettingScreen extends StatefulWidget {
  const _SampleSettingScreen({required this.controller});

  final DsThemeController controller;

  @override
  State<_SampleSettingScreen> createState() => _SampleSettingScreenState();
}

class _SampleSettingScreenState extends State<_SampleSettingScreen> {
  bool _notifications = true;
  bool _analytics = false;

  DsThemeController get _ctrl => widget.controller;

  @override
  Widget build(BuildContext context) {
    final l10n = UiKitLocalizations.of(context);

    return ListenableBuilder(
      listenable: _ctrl,
      builder: (_, __) => SettingScreen(
        title: l10n.settings,
        sections: [
          // ── 일반 ───────────────────────────────────────────────
          SettingSection(
            title: 'General',
            items: [
              NavigationTile(
                label: 'Privacy Policy',
                leading: const Icon(Icons.privacy_tip_outlined),
                onTap: () {},
              ),
              NavigationTile(
                label: 'Terms of Service',
                leading: const Icon(Icons.description_outlined),
                onTap: () {},
              ),
              NavigationTile(
                label: 'Open Source Licenses',
                leading: const Icon(Icons.code_rounded),
                onTap: () {},
              ),
            ],
          ),

          // ── 언어 ───────────────────────────────────────────────
          SettingSection(
            title: l10n.settingsLanguage,
            items: [
              UiKitLocaleToggle(
                currentLocale: _ctrl.locale,
                onLocaleChanged: _ctrl.setLocale,
                label: l10n.settingsLanguage,
              ),
            ],
          ),

          // ── 알림 ───────────────────────────────────────────────
          SettingSection(
            title: l10n.settingsNotifications,
            items: [
              SwitchTile(
                label: 'Push Notifications',
                subtitle: '새 알림을 받습니다',
                leading: const Icon(Icons.notifications_outlined),
                value: _notifications,
                onChanged: (v) => setState(() => _notifications = v),
              ),
              SwitchTile(
                label: 'Analytics',
                subtitle: '앱 개선을 위한 사용 데이터 수집',
                leading: const Icon(Icons.bar_chart_rounded),
                value: _analytics,
                onChanged: (v) => setState(() => _analytics = v),
              ),
            ],
          ),

          // ── 기본 템플릿 섹션 (Appearance / Developer / App / About)
          ...buildDefaultSettingSections(
            themeMode: _ctrl.themeMode,
            onThemeModeChanged: _ctrl.setThemeMode,
            brand: _ctrl.brand,
            onBrandChanged: _ctrl.setBrand,
            developerEmail: 'dev@example.com',
            emailSubject: '[flutter_ui_kit_setting] Questions',
            shareText: 'https://pub.dev/packages/flutter_ui_kit_setting',
            appStoreUrl: 'https://apps.apple.com/app/id000000000',
            playStoreUrl:
                'https://play.google.com/store/apps/details?id=com.example.app',
            homepageUrl: 'https://juny.blog',
            showBuildNumber: true,
            appName: 'flutter_ui_kit_setting',
            appDescription: 'pub.dev 배포 설정 UI 패키지',
          ),
        ],
      ),
    );
  }
}
