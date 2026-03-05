import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit_setting/flutter_ui_kit_setting.dart';

void main() {
  group('SettingSection', () {
    test('title은 선택적이다', () {
      const section = SettingSection(items: []);
      expect(section.title, isNull);
    });

    test('title과 items를 정상 저장한다', () {
      const section = SettingSection(title: 'General', items: []);
      expect(section.title, 'General');
      expect(section.items, isEmpty);
    });
  });

  group('SettingGearButton', () {
    testWidgets('onPressed 콜백이 호출된다', (tester) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              actions: [
                SettingGearButton(onPressed: () => pressed = true),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SettingGearButton));
      expect(pressed, isTrue);
    });
  });

  group('SettingTile', () {
    testWidgets('label이 렌더링된다', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SettingTile(label: 'Privacy Policy'),
          ),
        ),
      );

      expect(find.text('Privacy Policy'), findsOneWidget);
    });

    testWidgets('onTap이 호출된다', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingTile(
              label: 'Test',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SettingTile));
      expect(tapped, isTrue);
    });
  });

  group('SwitchTile', () {
    testWidgets('value가 변경되면 onChanged가 호출된다', (tester) async {
      bool? changed;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SwitchTile(
              label: 'Notifications',
              value: false,
              onChanged: (v) => changed = v,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Switch));
      expect(changed, isTrue);
    });
  });

  group('NavigationTile', () {
    testWidgets('chevron 아이콘이 표시된다', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NavigationTile(label: 'About', onTap: () {}),
          ),
        ),
      );

      expect(find.byIcon(Icons.chevron_right_rounded), findsOneWidget);
    });
  });

  group('SettingThemeToggleTile', () {
    testWidgets('탭하면 다음 ThemeMode로 변경된다', (tester) async {
      ThemeMode? changed;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingThemeToggleTile(
              themeMode: ThemeMode.light,
              onChanged: (m) => changed = m,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SettingThemeToggleTile));
      expect(changed, ThemeMode.dark);
    });
  });

  group('SettingScreen', () {
    testWidgets('섹션과 타일이 렌더링된다', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingScreen(
            title: '설정',
            sections: [
              SettingSection(
                title: 'General',
                items: [
                  SettingTile(label: 'Privacy Policy', onTap: () {}),
                  NavigationTile(label: 'Terms of Service', onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      );

      expect(find.text('설정'), findsOneWidget);
      expect(find.text('Privacy Policy'), findsOneWidget);
      expect(find.text('Terms of Service'), findsOneWidget);
    });
  });
}
