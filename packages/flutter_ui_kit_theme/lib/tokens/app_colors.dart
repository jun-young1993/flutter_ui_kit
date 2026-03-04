import 'package:flutter/material.dart';

/// Primitive color palette — the raw ink values of the design system.
///
/// IMPORTANT: These values must NOT be used directly inside widgets.
/// Always consume color through [ColorScheme] (via [Theme.of(context)])
/// or semantic design tokens. This class exists purely as the source of
/// truth for the color definitions used to build [ColorScheme] instances.
abstract final class AppColors {
  AppColors._();

  // ─────────────────────────────────────────────
  // Violet / Primary brand palette
  // ─────────────────────────────────────────────

  static const Color violet50  = Color(0xFFF0EFFE);
  static const Color violet100 = Color(0xFFE4E1FD);
  static const Color violet200 = Color(0xFFCCC6FB);
  static const Color violet300 = Color(0xFFADA4F8);
  static const Color violet400 = Color(0xFF8E84F5);
  /// Brand primary — #6C63FF
  static const Color violet500 = Color(0xFF6C63FF);
  static const Color violet600 = Color(0xFF5A52D5);
  static const Color violet700 = Color(0xFF4840AB);
  static const Color violet800 = Color(0xFF362F82);
  static const Color violet900 = Color(0xFF241E58);
  static const Color violet950 = Color(0xFF120F30);

  // ─────────────────────────────────────────────
  // Emerald / Brand B palette
  // ─────────────────────────────────────────────

  static const Color emerald50  = Color(0xFFE8FFF2);
  static const Color emerald100 = Color(0xFFB3F5D3);
  static const Color emerald200 = Color(0xFF80EBB5);
  static const Color emerald300 = Color(0xFF4DD898);
  static const Color emerald400 = Color(0xFF26C97E);
  /// Emerald primary
  static const Color emerald500 = Color(0xFF00C853);
  static const Color emerald600 = Color(0xFF00A843);
  static const Color emerald700 = Color(0xFF008833);
  static const Color emerald800 = Color(0xFF006824);
  static const Color emerald900 = Color(0xFF004815);

  // ─────────────────────────────────────────────
  // Neutral / Ink scale
  // ─────────────────────────────────────────────

  static const Color ink0   = Color(0xFFFFFFFF);
  static const Color ink50  = Color(0xFFF8F9FB);
  static const Color ink100 = Color(0xFFEEF0F4);
  static const Color ink200 = Color(0xFFD8DCE6);
  static const Color ink300 = Color(0xFFB4BAC8);
  static const Color ink400 = Color(0xFF8A93A8);
  static const Color ink500 = Color(0xFF606B84);
  static const Color ink600 = Color(0xFF3E4860);
  static const Color ink700 = Color(0xFF1E2740);
  /// Dark surface — #0D1F3C
  static const Color ink800 = Color(0xFF0D1F3C);
  /// Dark background — #0A0E1A
  static const Color ink900 = Color(0xFF0A0E1A);
  static const Color ink950 = Color(0xFF070B14);

  // ─────────────────────────────────────────────
  // Semantic utility colors
  // ─────────────────────────────────────────────

  static const Color red300   = Color(0xFFFF8A80);
  static const Color red400   = Color(0xFFFF5252);
  static const Color red500   = Color(0xFFE53935);
  static const Color red700   = Color(0xFFB71C1C);
  static const Color red900   = Color(0xFF4E0000);

  static const Color amber300 = Color(0xFFFFD54F);
  static const Color amber500 = Color(0xFFFFC107);

  static const Color green300 = Color(0xFF69F0AE);
  static const Color green500 = Color(0xFF00C853);

  static const Color scrim       = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);
}
