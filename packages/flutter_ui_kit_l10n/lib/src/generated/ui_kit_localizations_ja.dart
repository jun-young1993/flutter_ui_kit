// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ui_kit_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class UiKitLocalizationsJa extends UiKitLocalizations {
  UiKitLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get confirm => '確認';

  @override
  String get save => '保存';

  @override
  String get delete => '削除';

  @override
  String get edit => '編集';

  @override
  String get close => '閉じる';

  @override
  String get back => '戻る';

  @override
  String get next => '次へ';

  @override
  String get done => '完了';

  @override
  String get loading => '読み込み中...';

  @override
  String get error => 'エラーが発生しました';

  @override
  String errorWithContext(String context) => '${context}エラーが発生しました';

  @override
  String get retry => '再試行';

  @override
  String get search => '検索';

  @override
  String get addItem => 'アイテムを追加';

  @override
  String get settings => '設定';

  @override
  String get settingsLanguage => '言語';

  @override
  String get settingsTheme => 'テーマ';

  @override
  String get settingsAccount => 'アカウント';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsProfile => 'プロフィール';

  @override
  String get settingsLogout => 'ログアウト';
}
