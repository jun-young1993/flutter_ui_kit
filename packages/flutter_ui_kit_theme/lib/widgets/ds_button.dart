import 'package:flutter/material.dart';

/// Visual style variant for [DsButton].
enum DsButtonVariant {
  /// Primary call-to-action — maps to [FilledButton].
  filled,

  /// Secondary action with border — maps to [OutlinedButton].
  outlined,

  /// Subtle/inline action — maps to [TextButton].
  ghost,
}

/// A design-system button that wraps the M3 button family.
///
/// All color decisions are delegated to the active [ThemeData] — specifically
/// [filledButtonTheme], [outlinedButtonTheme], and [textButtonTheme] configured
/// in [BaseTheme]. No color is hardcoded here.
///
/// ```dart
/// // Primary CTA
/// DsButton(label: 'Get started', onPressed: _submit)
///
/// // Expanded width with loading state
/// DsButton(
///   label: 'Save',
///   onPressed: _save,
///   isLoading: _isSaving,
///   isExpanded: true,
/// )
///
/// // Outlined with icon
/// DsButton(
///   label: 'Share',
///   variant: DsButtonVariant.outlined,
///   icon: const Icon(Icons.share_outlined, size: 18),
///   onPressed: _share,
/// )
/// ```
class DsButton extends StatelessWidget {
  const DsButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = DsButtonVariant.filled,
    this.icon,
    this.isLoading = false,
    this.isExpanded = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final DsButtonVariant variant;

  /// Optional leading icon shown before the label.
  final Widget? icon;

  /// When `true`, replaces the label with a [CircularProgressIndicator]
  /// and disables the button.
  final bool isLoading;

  /// When `true`, the button stretches to fill available horizontal space.
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final expandedStyle = ButtonStyle(
      minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
    );

    final child = isLoading ? _loadingIndicator(cs) : _labelContent();

    return switch (variant) {
      DsButtonVariant.filled => FilledButton(
          onPressed: isLoading ? null : onPressed,
          style: isExpanded ? expandedStyle : null,
          child: child,
        ),
      DsButtonVariant.outlined => OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: isExpanded ? expandedStyle : null,
          child: child,
        ),
      DsButtonVariant.ghost => TextButton(
          onPressed: isLoading ? null : onPressed,
          style: isExpanded ? expandedStyle : null,
          child: child,
        ),
    };
  }

  Widget _labelContent() {
    if (icon == null) return Text(label);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon!,
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }

  Widget _loadingIndicator(ColorScheme cs) {
    final color = variant == DsButtonVariant.filled
        ? cs.onPrimary
        : cs.primary;

    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}
