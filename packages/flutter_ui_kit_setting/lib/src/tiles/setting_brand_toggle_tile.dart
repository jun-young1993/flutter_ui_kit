import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

/// 앱 브랜드(Violet / Emerald)를 전환하는 설정 타일.
///
/// 상태를 직접 소유하지 않으므로, 호출자가 [brand]와 [onChanged]를 관리한다.
///
/// ```dart
/// // StatefulWidget 내부
/// SettingBrandToggleTile(
///   brand: _brand,
///   onChanged: (b) => setState(() => _brand = b),
/// )
///
/// // ValueNotifier 패턴
/// final _brand = ValueNotifier(DsBrand.violet);
/// ValueListenableBuilder<DsBrand>(
///   valueListenable: _brand,
///   builder: (_, brand, __) => SettingBrandToggleTile(
///     brand: brand,
///     onChanged: (b) => _brand.value = b,
///   ),
/// )
/// ```
class SettingBrandToggleTile extends StatelessWidget {
  const SettingBrandToggleTile({
    super.key,
    required this.brand,
    required this.onChanged,
    this.label = 'Brand',
  });

  final DsBrand brand;
  final ValueChanged<DsBrand> onChanged;
  final String label;

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
          brand.icon,
          key: ValueKey(brand),
          color: theme.colorScheme.primary,
        ),
      ),
      title: Text(label, style: theme.textTheme.bodyLarge),
      trailing: Semantics(
        button: true,
        label: '${brand.label}. Tap to switch to ${brand.next.label}.',
        excludeSemantics: true,
        child: GestureDetector(
          onTap: () => onChanged(brand.next),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              brand.label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
      onTap: () => onChanged(brand.next),
    );
  }
}
