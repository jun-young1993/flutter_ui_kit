import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_widget/flutter_ui_kit_widget.dart';

import '../brand/brand_a_theme.dart';
import '../brand/brand_b_theme.dart';

/// Brand identity used by [DsBrandToggle].
///
/// Each value maps to a distinct color palette and [ThemeData] pair:
/// - [violet] → [BrandATheme] (violet-500 seed, `#6C63FF`)
/// - [emerald] → [BrandBTheme] (emerald-500 seed, `#00C853`)
enum DsBrand {
  violet('Violet'),
  emerald('Emerald');

  const DsBrand(this.label);

  /// Human-readable brand name.
  final String label;

  /// Returns the light [ThemeData] for this brand.
  ThemeData lightTheme() => switch (this) {
        DsBrand.violet => BrandATheme.light(),
        DsBrand.emerald => BrandBTheme.light(),
      };

  /// Returns the dark [ThemeData] for this brand.
  ThemeData darkTheme() => switch (this) {
        DsBrand.violet => BrandATheme.dark(),
        DsBrand.emerald => BrandBTheme.dark(),
      };

  /// The other brand — used to compute the next value on toggle.
  DsBrand get next => switch (this) {
        DsBrand.violet => DsBrand.emerald,
        DsBrand.emerald => DsBrand.violet,
      };

  /// Descriptive icon that represents each brand visually.
  IconData get icon => switch (this) {
        DsBrand.violet => Icons.diamond_rounded,
        DsBrand.emerald => Icons.eco_rounded,
      };
}

/// A single-button brand toggle that flips between [DsBrand.violet] and
/// [DsBrand.emerald].
///
/// ```
/// Violet (◆) ⇄ Emerald (🌿)
/// ```
///
/// The icon swaps with the same **rotate + scale + fade** animation as
/// [DsThemeToggle]. The icon color reflects the *active* brand's primary
/// via `colorScheme.primary`, so the button is always in sync with the
/// current theme.
///
/// ─────────────────────────────────────────────
/// Usage (StatefulWidget)
/// ─────────────────────────────────────────────
/// ```dart
/// class _RootState extends State<Root> {
///   DsBrand _brand = DsBrand.violet;
///   ThemeMode _mode = ThemeMode.system;
///
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       theme:     _brand.lightTheme(),
///       darkTheme: _brand.darkTheme(),
///       themeMode: _mode,
///       home: Scaffold(
///         appBar: AppBar(
///           actions: [
///             DsBrandToggle(
///               brand: _brand,
///               onChanged: (b) => setState(() => _brand = b),
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
/// final brand = ValueNotifier(DsBrand.violet);
///
/// // In build:
/// ValueListenableBuilder<DsBrand>(
///   valueListenable: brand,
///   builder: (_, b, __) => DsBrandToggle(
///     brand: b,
///     onChanged: (next) => brand.value = next,
///   ),
/// )
/// ```
class DsBrandToggle extends StatelessWidget {
  const DsBrandToggle({
    super.key,
    required this.brand,
    required this.onChanged,
    this.sizedBoxDimension = 48,
    this.iconSize = 22,
  });

  /// The currently active brand.
  final DsBrand brand;

  /// Called with the other [DsBrand] when the user taps the button.
  final ValueChanged<DsBrand> onChanged;

  /// The size of the square tap target. Defaults to 48.
  final double sizedBoxDimension;

  /// The size of the icon. Defaults to 22.
  final double iconSize;

  // ─── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return DsIconToggle(
      icon: brand.icon,
      iconKey: ValueKey(brand),
      onTap: () => onChanged(brand.next),
      semanticLabel: '${brand.label} is active. Tap to switch to ${brand.next.label}.',
      tooltipMessage: brand.label,
      sizedBoxDimension: sizedBoxDimension,
      iconSize: iconSize,
    );
  }
}
