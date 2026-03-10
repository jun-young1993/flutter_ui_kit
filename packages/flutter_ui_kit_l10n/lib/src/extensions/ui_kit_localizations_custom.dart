import 'package:flutter/widgets.dart';

import '../generated/ui_kit_localizations.dart';

/// [UiKitLocalizations]에 프로젝트 전용 인라인 번역 기능을 추가하는 extension.
///
/// 공유 ARB 파일에 올리기 애매한 앱 고유 문자열을 한 줄로 처리할 수 있습니다.
///
/// ```dart
/// final l10n = UiKitLocalizations.of(context);
///
/// Text(
///   l10n.custom((locale) => switch (locale.languageCode) {
///     'en' => 'This alarm is important',
///     'ko' => '이 알람은 중요합니다',
///     _ => 'Unknown',
///   }),
/// )
/// ```
extension UiKitLocalizationsCustom on UiKitLocalizations {
  /// 현재 로케일을 [resolver]에 전달하고, 반환된 문자열을 그대로 사용합니다.
  ///
  /// [resolver]는 [Locale]을 받아 해당 언어의 문자열을 반환해야 합니다.
  /// `switch` expression의 와일드카드(`_`)로 폴백 언어를 지정하세요.
  /// ```dart
  /// final l10n = UiKitLocalizations.of(context);
  ///
  /// Text(
  ///   l10n.custom((locale) => switch (locale.languageCode) {
  ///     'en' => 'This alarm is important',
  ///     'ko' => '이 알람은 중요합니다',
  ///     _ => 'Unknown',
  ///   }),
  /// )
  /// ```
  String custom(String Function(Locale locale) resolver) {
    return resolver(Locale(localeName));
  }
}
