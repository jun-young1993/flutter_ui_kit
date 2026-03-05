import 'package:flutter/material.dart';

/// 앱 테마(Light / Dark / System)를 전환하는 설정 타일.
///
/// 상태를 직접 소유하지 않으므로, 호출자가 [themeMode]와 [onChanged]를 관리한다.
///
/// ```dart
/// // StatefulWidget 내부
/// SettingThemeToggleTile(
///   themeMode: _themeMode,
///   onChanged: (mode) => setState(() => _themeMode = mode),
/// )
///
/// // ValueNotifier 패턴
/// final _themeMode = ValueNotifier(ThemeMode.system);
/// ValueListenableBuilder<ThemeMode>(
///   valueListenable: _themeMode,
///   builder: (_, mode, __) => SettingThemeToggleTile(
///     themeMode: mode,
///     onChanged: (m) => _themeMode.value = m,
///   ),
/// )
/// ```
class SettingThemeToggleTile extends StatelessWidget {
  const SettingThemeToggleTile({
    super.key,
    required this.themeMode,
    required this.onChanged,
    this.label = 'Theme',
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onChanged;
  final String label;

  ThemeMode get _next => switch (themeMode) {
        ThemeMode.light => ThemeMode.dark,
        ThemeMode.dark => ThemeMode.system,
        ThemeMode.system => ThemeMode.light,
      };

  IconData get _icon => switch (themeMode) {
        ThemeMode.light => Icons.wb_sunny_rounded,
        ThemeMode.dark => Icons.nightlight_rounded,
        ThemeMode.system => Icons.brightness_auto_rounded,
      };

  String get _modeLabel => switch (themeMode) {
        ThemeMode.light => 'Light',
        ThemeMode.dark => 'Dark',
        ThemeMode.system => 'System',
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
          key: ValueKey(themeMode),
          color: theme.colorScheme.primary,
        ),
      ),
      title: Text(label, style: theme.textTheme.bodyLarge),
      trailing: Semantics(
        button: true,
        label: '$_modeLabel. Tap to switch to ${_next.name}.',
        excludeSemantics: true,
        child: GestureDetector(
          onTap: () => onChanged(_next),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _modeLabel,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
      onTap: () => onChanged(_next),
    );
  }
}
