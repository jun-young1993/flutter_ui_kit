import 'package:flutter/material.dart';

import '../tokens/app_motion.dart';

/// A single-button theme toggle that cycles through Light → Dark → System.
///
/// Each press advances to the next [ThemeMode]:
/// ```
/// Light (☀) → Dark (☽) → System (⬡) → Light …
/// ```
///
/// The icon swaps with a **rotate + scale + fade** animation so the
/// transition feels smooth ("스르륵"). All colors come from
/// [Theme.of(context).colorScheme] — nothing is hardcoded.
///
/// ─────────────────────────────────────────────
/// Usage (minimal — caller owns the state)
/// ─────────────────────────────────────────────
/// ```dart
/// class _RootState extends State<Root> {
///   ThemeMode _mode = ThemeMode.system;
///
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       theme:     BrandATheme.light(),
///       darkTheme: BrandATheme.dark(),
///       themeMode: _mode,
///       home: Scaffold(
///         appBar: AppBar(
///           actions: [
///             DsThemeToggle(
///               themeMode: _mode,
///               onChanged: (m) => setState(() => _mode = m),
///             ),
///             const SizedBox(width: 8),
///           ],
///         ),
///       ),
///     );
///   }
/// }
/// ```
///
/// ─────────────────────────────────────────────
/// Usage with a ValueNotifier (no StatefulWidget needed)
/// ─────────────────────────────────────────────
/// ```dart
/// final themeMode = ValueNotifier(ThemeMode.system);
///
/// // In build:
/// ValueListenableBuilder<ThemeMode>(
///   valueListenable: themeMode,
///   builder: (_, mode, __) => DsThemeToggle(
///     themeMode: mode,
///     onChanged: (m) => themeMode.value = m,
///   ),
/// )
/// ```
class DsThemeToggle extends StatelessWidget {
  const DsThemeToggle({
    super.key,
    required this.themeMode,
    required this.onChanged,
  });

  /// The currently active theme mode.
  final ThemeMode themeMode;

  /// Called with the next [ThemeMode] when the user taps the button.
  final ValueChanged<ThemeMode> onChanged;

  // ─── Cycle order ──────────────────────────────────────────────────────────

  ThemeMode get _next => switch (themeMode) {
        ThemeMode.light  => ThemeMode.dark,
        ThemeMode.dark   => ThemeMode.system,
        ThemeMode.system => ThemeMode.light,
      };

  // ─── Icon mapping ─────────────────────────────────────────────────────────

  IconData get _icon => switch (themeMode) {
        ThemeMode.light  => Icons.wb_sunny_rounded,
        ThemeMode.dark   => Icons.nightlight_rounded,
        ThemeMode.system => Icons.brightness_auto_rounded,
      };

  // ─── Accessibility labels ─────────────────────────────────────────────────

  String get _currentLabel => switch (themeMode) {
        ThemeMode.light  => '라이트 모드',
        ThemeMode.dark   => '다크 모드',
        ThemeMode.system => '시스템 기본값',
      };

  String get _nextLabel => switch (_next) {
        ThemeMode.light  => '라이트 모드',
        ThemeMode.dark   => '다크 모드',
        ThemeMode.system => '시스템 기본값',
      };

  // ─── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: '$_currentLabel 활성화됨. 탭하면 $_nextLabel(으)로 전환.',
      excludeSemantics: true,
      child: Tooltip(
        message: _currentLabel,
        child: Material(
          color: cs.surfaceContainerHigh,
          shape: const StadiumBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => onChanged(_next),
            customBorder: const StadiumBorder(),
            child: SizedBox.square(
              dimension: 48,
              child: AnimatedSwitcher(
                duration: AppMotion.standard,
                switchInCurve: AppMotion.emphasizedDecel,
                switchOutCurve: AppMotion.emphasizedAccel,
                transitionBuilder: _buildTransition,
                child: Icon(
                  _icon,
                  // ValueKey forces AnimatedSwitcher to treat each mode as
                  // a distinct child, triggering the transition animation.
                  key: ValueKey(themeMode),
                  color: cs.primary,
                  size: 22,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ─── Transition ───────────────────────────────────────────────────────────

  /// Incoming icon: fades in + scales up + rotates from 90° to 0°.
  /// Outgoing icon: fades out + scales down + rotates from 0° to 90°.
  ///
  /// Static reference ensures [AnimatedSwitcher] never sees a changed
  /// [transitionBuilder] and avoids unnecessary rebuilds.
  static Widget _buildTransition(Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
      child: RotationTransition(
        turns: Tween<double>(begin: 0.25, end: 0.0).animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    );
  }
}
