import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';
import 'package:flutter_ui_kit_notice/flutter_ui_kit_notice.dart';
import 'package:flutter_ui_kit_l10n/flutter_ui_kit_l10n.dart';

import 'data/sample_data.dart';
import 'screens/post_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final controller = DsThemeController();
  await controller.init();
  runApp(MyApp(themeController: controller));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.themeController});

  final DsThemeController themeController;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = UiKitLocalizations.supportedLocales.first;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.themeController,
      builder: (_, __) => MaterialApp(
        title: 'Notice UI Kit',
        theme: widget.themeController.lightTheme,
        darkTheme: widget.themeController.darkTheme,
        themeMode: widget.themeController.themeMode,
        locale: _locale,
        localizationsDelegates: UiKitLocalizations.localizationsDelegates,
        supportedLocales: UiKitLocalizations.supportedLocales,
        home: BoardScreen(
          themeController: widget.themeController,
          currentLocale: _locale,
          onLocaleChanged: (locale) => setState(() => _locale = locale),
        ),
      ),
    );
  }
}

class BoardScreen extends StatelessWidget {
  const BoardScreen({
    super.key,
    required this.themeController,
    required this.currentLocale,
    required this.onLocaleChanged,
  });

  final DsThemeController themeController;
  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항'),
        actions: [
          DsBrandToggle(
            brand: themeController.brand,
            onChanged: themeController.setBrand,
          ),
          DsThemeToggle(
            themeMode: themeController.themeMode,
            onChanged: themeController.setThemeMode,
          ),
          DsLocaleToggle(
            currentLocale: currentLocale,
            onChanged: onLocaleChanged,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BoardList(
        posts: samplePosts,
        animateItems: true,
        onTapPost: (post) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PostDetailScreen(
                post: post,
                comments: sampleComments[post.id] ?? [],
              ),
            ),
          );
        },
      ),
    );
  }
}
