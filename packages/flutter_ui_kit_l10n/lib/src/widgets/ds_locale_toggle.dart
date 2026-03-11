import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_widget/flutter_ui_kit_widget.dart';

import '../generated/ui_kit_localizations.dart';

/// AppBar 액션으로 쓰기 좋은 콤팩트 로케일 토글 버튼.
///
/// 현재 로케일의 언어 코드 약자(EN / KO / JA)를 원형 버튼에 표시하며,
/// 탭할 때마다 다음 로케일로 순환한다.
///
/// [DsThemeToggle]과 동일한 [DsTextToggle] 기반으로 구현되므로
/// **rotate + scale + fade** 애니메이션이 동일하게 적용된다.
///
/// ─────────────────────────────────────────────
/// Usage (minimal — caller owns the state)
/// ─────────────────────────────────────────────
/// ```dart
/// DsLocaleToggle(
///   currentLocale: _locale,
///   onChanged: (locale) => setState(() => _locale = locale),
/// )
/// ```
///
/// ─────────────────────────────────────────────
/// Usage with a ValueNotifier
/// ─────────────────────────────────────────────
/// ```dart
/// final localeNotifier = ValueNotifier(const Locale('ko'));
///
/// ValueListenableBuilder<Locale>(
///   valueListenable: localeNotifier,
///   builder: (_, locale, __) => DsLocaleToggle(
///     currentLocale: locale,
///     onChanged: (l) => localeNotifier.value = l,
///   ),
/// )
/// ```
class DsLocaleToggle extends StatelessWidget {
  const DsLocaleToggle({
    super.key,
    required this.currentLocale,
    required this.onChanged,
    this.supportedLocales,
    this.sizedBoxDimension = 48,
    this.fontSize = 12,
  });

  /// 현재 활성 로케일.
  final Locale currentLocale;

  /// 탭 시 다음 [Locale]을 전달하는 콜백.
  final ValueChanged<Locale> onChanged;

  /// 순환할 로케일 목록. null이면 [UiKitLocalizations.supportedLocales]를 사용.
  final List<Locale>? supportedLocales;

  /// 탭 영역(정사각형)의 한 변 크기. 기본값 48.
  final double sizedBoxDimension;

  /// 언어 코드 텍스트 크기. 기본값 12.
  final double fontSize;

  // ─── Cycle ────────────────────────────────────────────────────────────────

  List<Locale> get _locales =>
      supportedLocales ?? UiKitLocalizations.supportedLocales;

  Locale get _next {
    final locales = _locales;
    final idx = locales.indexWhere(
      (l) => l.languageCode == currentLocale.languageCode,
    );
    return locales[(idx + 1) % locales.length];
  }

  // ─── Labels ───────────────────────────────────────────────────────────────

  String get _label => currentLocale.languageCode.toUpperCase();
  String get _nextLabel => _next.languageCode.toUpperCase();

  // ─── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return DsTextToggle(
      label: _label,
      labelKey: ValueKey(currentLocale.languageCode),
      onTap: () => onChanged(_next),
      semanticLabel: '$_label is active. Tap to switch to $_nextLabel.',
      tooltipMessage: _label,
      sizedBoxDimension: sizedBoxDimension,
      fontSize: fontSize,
    );
  }
}
