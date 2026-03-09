// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ui_kit_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class UiKitLocalizationsKo extends UiKitLocalizations {
  UiKitLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get ok => '확인';

  @override
  String get cancel => '취소';

  @override
  String get confirm => '확인';

  @override
  String get save => '저장';

  @override
  String get delete => '삭제';

  @override
  String get edit => '편집';

  @override
  String get close => '닫기';

  @override
  String get back => '뒤로';

  @override
  String get next => '다음';

  @override
  String get done => '완료';

  @override
  String get loading => '로딩 중...';

  @override
  String get error => '오류가 발생했습니다';

  @override
  String errorWithContext(String context) => '$context 오류가 발생했습니다';

  @override
  String get retry => '다시 시도';

  @override
  String get search => '검색';

  @override
  String get addItem => '항목 추가';

  @override
  String get settings => '설정';

  @override
  String get settingsLanguage => '언어';

  @override
  String get settingsTheme => '테마';

  @override
  String get settingsAccount => '계정';

  @override
  String get settingsNotifications => '알림';

  @override
  String get settingsProfile => '프로필';

  @override
  String get settingsLogout => '로그아웃';
}
