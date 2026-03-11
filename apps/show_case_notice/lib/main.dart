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

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.themeController});

  final DsThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (_, __) => MaterialApp(
        title: 'Notice UI Kit',
        theme: themeController.lightTheme,
        darkTheme: themeController.darkTheme,
        themeMode: themeController.themeMode,
        localizationsDelegates: UiKitLocalizations.localizationsDelegates,
        supportedLocales: UiKitLocalizations.supportedLocales,
        home: BoardScreen(themeController: themeController),
      ),
    );
  }
}

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key, required this.themeController});

  final DsThemeController themeController;

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
