import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_setting/flutter_ui_kit_setting.dart';

void main() {
  runApp(const ShowCaseApp());
}

class ShowCaseApp extends StatefulWidget {
  const ShowCaseApp({super.key});

  @override
  State<ShowCaseApp> createState() => _ShowCaseAppState();
}

class _ShowCaseAppState extends State<ShowCaseApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_ui_kit_setting',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: HomePage(
        themeMode: _themeMode,
        onThemeModeChanged: (mode) => setState(() => _themeMode = mode),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

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
        builder: (_) => _SampleSettingScreen(
          themeMode: themeMode,
          onThemeModeChanged: onThemeModeChanged,
        ),
      ),
    );
  }
}

class _SampleSettingScreen extends StatefulWidget {
  const _SampleSettingScreen({
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<_SampleSettingScreen> createState() => _SampleSettingScreenState();
}

class _SampleSettingScreenState extends State<_SampleSettingScreen> {
  bool _notifications = true;
  bool _analytics = false;
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return SettingScreen(
      title: '설정',
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

        // ── 알림 ───────────────────────────────────────────────
        SettingSection(
          title: 'Notifications',
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

        // ── 테마 ───────────────────────────────────────────────
        SettingSection(
          title: 'Appearance',
          items: [
            SettingThemeToggleTile(
              label: 'Theme',
              themeMode: _themeMode,
              onChanged: (mode) {
                setState(() => _themeMode = mode);
                widget.onThemeModeChanged(mode);
              },
            ),
          ],
        ),

        // ── 개발자 ─────────────────────────────────────────────
        SettingSection(
          title: 'Developer',
          items: [
            SettingDeveloperEmailTile(
              email: 'dev@example.com',
              label: 'Contact Developer',
              subject: '[flutter_ui_kit_setting] 문의',
            ),
          ],
        ),

        // ── 앱 정보 ────────────────────────────────────────────
        SettingSection(
          title: 'About',
          items: [
            SettingAppVersionTile(
              label: 'App Version',
              showBuildNumber: true,
            ),
            SettingTile(
              label: 'flutter_ui_kit_setting',
              subtitle: 'pub.dev 배포 설정 UI 패키지',
              leading: const Icon(Icons.widgets_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
