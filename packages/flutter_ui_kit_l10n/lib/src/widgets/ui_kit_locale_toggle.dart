import 'package:flutter/material.dart';

import '../generated/ui_kit_localizations.dart';

/// 앱 로케일을 전환하는 설정 타일.
///
/// [SettingThemeToggleTile] / [SettingBrandToggleTile]과 동일한 디자인.
/// 상태를 직접 소유하지 않으므로, 호출자가 [currentLocale]과 [onLocaleChanged]를 관리한다.
///
/// ```dart
/// UiKitLocaleToggle(
///   currentLocale: _locale,
///   onLocaleChanged: (locale) => setState(() => _locale = locale),
/// )
/// ```
class UiKitLocaleToggle extends StatelessWidget {
  const UiKitLocaleToggle({
    super.key,
    required this.currentLocale,
    required this.onLocaleChanged,
    this.supportedLocales,
    this.label = 'Language',
  });

  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;
  final List<Locale>? supportedLocales;
  final String label;

  List<Locale> get _locales =>
      supportedLocales ?? UiKitLocalizations.supportedLocales;

  Locale get _next {
    final locales = _locales;
    final currentIndex = locales.indexWhere(
      (l) => l.languageCode == currentLocale.languageCode,
    );
    final nextIndex = (currentIndex + 1) % locales.length;
    return locales[nextIndex];
  }

  String get _localeLabel => switch (currentLocale.languageCode) {
        'ko' => '한국어',
        'ja' => '日本語',
        'en' => 'English',
        _ => currentLocale.languageCode.toUpperCase(),
      };

  IconData get _icon => switch (currentLocale.languageCode) {
        'ko' => Icons.translate_rounded,
        'ja' => Icons.translate_rounded,
        _ => Icons.language_rounded,
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: AnimatedSwitcher(
        duration: const Duration(milliseconds: 240),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: Tween<double>(begin: 0.6, end: 1.0).animate(animation),
          child: RotationTransition(
            turns: Tween<double>(begin: 0.25, end: 0.0).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          ),
        ),
        child: Icon(
          _icon,
          key: ValueKey(currentLocale.languageCode),
          color: theme.colorScheme.primary,
        ),
      ),
      title: Text(label, style: theme.textTheme.bodyLarge),
      trailing: Semantics(
        button: true,
        label: '$_localeLabel. Tap to switch to ${_next.languageCode}.',
        excludeSemantics: true,
        child: GestureDetector(
          onTap: () => onLocaleChanged(_next),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _localeLabel,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
      onTap: () => onLocaleChanged(_next),
    );
  }
}
