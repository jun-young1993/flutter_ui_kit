import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_widget/flutter_ui_kit_widget.dart';

/// A single-button theme toggle that cycles through Light → Dark → System.
///
/// Each press advances to the next [ThemeMode]:
/// ```
/// Light (☀) → Dark (☽) → System (⬡) → Light …
/// ```
///
/// The icon swaps with a **rotate + scale + fade** animation so the
/// transition feels smooth (\"스르륵\"). All colors come from
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
    this.sizedBoxDimension = 48,
    this.iconSize = 22,
  });

  /// The currently active theme mode.
  final ThemeMode themeMode;

  /// Called with the next [ThemeMode] when the user taps the button.
  final ValueChanged<ThemeMode> onChanged;

  /// The size of the square tap target. Defaults to 48.
  final double sizedBoxDimension;

  /// The size of the icon. Defaults to 22.
  final double iconSize;

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
        ThemeMode.light  => 'light',
        ThemeMode.dark   => 'dark',
        ThemeMode.system => 'system',
      };

  String get _nextLabel => switch (_next) {
        ThemeMode.light  => 'light',
        ThemeMode.dark   => 'dark',
        ThemeMode.system => 'system',
      };

  // ─── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return DsIconToggle(
      icon: _icon,
      iconKey: ValueKey(themeMode),
      onTap: () => onChanged(_next),
      semanticLabel: '$_currentLabel is active. Tap to switch to $_nextLabel.',
      tooltipMessage: _currentLabel,
      sizedBoxDimension: sizedBoxDimension,
      iconSize: iconSize,
    );
  }
}
