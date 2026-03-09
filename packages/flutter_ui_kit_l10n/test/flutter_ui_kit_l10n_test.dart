import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_ui_kit_l10n/flutter_ui_kit_l10n.dart';

void main() {
  group('UiKitLocalizationsEn', () {
    late UiKitLocalizations l10n;

    setUp(() {
      l10n = UiKitLocalizationsEn();
    });

    test('core strings', () {
      expect(l10n.ok, 'OK');
      expect(l10n.cancel, 'Cancel');
      expect(l10n.save, 'Save');
      expect(l10n.delete, 'Delete');
      expect(l10n.loading, 'Loading...');
      expect(l10n.error, 'An error occurred');
      expect(l10n.addItem, 'Add Item');
    });

    test('settings strings', () {
      expect(l10n.settings, 'Settings');
      expect(l10n.settingsLanguage, 'Language');
      expect(l10n.settingsTheme, 'Theme');
      expect(l10n.settingsLogout, 'Logout');
    });
  });

  group('UiKitLocalizationsKo', () {
    late UiKitLocalizations l10n;

    setUp(() {
      l10n = UiKitLocalizationsKo();
    });

    test('core strings', () {
      expect(l10n.ok, '확인');
      expect(l10n.cancel, '취소');
      expect(l10n.save, '저장');
      expect(l10n.delete, '삭제');
      expect(l10n.addItem, '항목 추가');
    });

    test('settings strings', () {
      expect(l10n.settings, '설정');
      expect(l10n.settingsLanguage, '언어');
      expect(l10n.settingsLogout, '로그아웃');
    });
  });

  group('UiKitLocalizationsJa', () {
    late UiKitLocalizations l10n;

    setUp(() {
      l10n = UiKitLocalizationsJa();
    });

    test('core strings', () {
      expect(l10n.ok, 'OK');
      expect(l10n.cancel, 'キャンセル');
      expect(l10n.save, '保存');
      expect(l10n.addItem, 'アイテムを追加');
    });
  });

  group('lookupUiKitLocalizations', () {
    test('returns En for en locale', () {
      final result = lookupUiKitLocalizations(const Locale('en'));
      expect(result, isA<UiKitLocalizationsEn>());
    });

    test('returns Ko for ko locale', () {
      final result = lookupUiKitLocalizations(const Locale('ko'));
      expect(result, isA<UiKitLocalizationsKo>());
    });

    test('returns Ja for ja locale', () {
      final result = lookupUiKitLocalizations(const Locale('ja'));
      expect(result, isA<UiKitLocalizationsJa>());
    });

    test('throws for unsupported locale', () {
      expect(
        () => lookupUiKitLocalizations(const Locale('fr')),
        throwsA(isA<FlutterError>()),
      );
    });
  });

  group('parameterized messages', () {
    test('errorWithContext in en', () {
      final l10n = UiKitLocalizationsEn();
      expect(l10n.errorWithContext('Server'), 'Server error occurred');
      expect(l10n.errorWithContext('Network'), 'Network error occurred');
    });

    test('errorWithContext in ko', () {
      final l10n = UiKitLocalizationsKo();
      expect(l10n.errorWithContext('서버'), '서버 오류가 발생했습니다');
      expect(l10n.errorWithContext('네트워크'), '네트워크 오류가 발생했습니다');
    });

    test('errorWithContext in ja', () {
      final l10n = UiKitLocalizationsJa();
      expect(l10n.errorWithContext('サーバー'), 'サーバーエラーが発生しました');
    });
  });

  group('app-level override', () {
    test('override replaces specific strings', () {
      final override = _TestOverrideEn();
      expect(override.settings, 'App Settings'); // overridden
      expect(override.ok, 'OK'); // inherited
      expect(override.cancel, 'Cancel'); // inherited
    });
  });
}

/// Simulates an app-level override of shared strings.
class _TestOverrideEn extends UiKitLocalizationsEn {
  @override
  String get settings => 'App Settings';
}
