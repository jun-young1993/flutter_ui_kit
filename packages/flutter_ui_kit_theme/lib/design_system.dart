/// Flutter UI Kit — Material 3 Design System
///
/// Import this single barrel to access all design tokens, themes,
/// brand overrides, and pre-built widgets.
///
/// ```dart
/// import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';
///
/// MaterialApp(
///   theme: BrandATheme.light(),
///   darkTheme: BrandATheme.dark(),
///   themeMode: ThemeMode.system,
/// )
/// ```
library;

// ── Tokens ──────────────────────────────────────────────────────────────────
export 'tokens/app_breakpoints.dart';
export 'tokens/app_colors.dart';
export 'tokens/app_motion.dart';
export 'tokens/app_radius.dart';
export 'tokens/app_scale.dart';
export 'tokens/app_spacing.dart';
export 'tokens/app_typography.dart';

// ── Theme ────────────────────────────────────────────────────────────────────
export 'theme/app_color_schemes.dart';
export 'theme/base_theme.dart';
export 'theme/dark_theme.dart';
export 'theme/light_theme.dart';

// ── Brand ────────────────────────────────────────────────────────────────────
export 'brand/brand_a_theme.dart';
export 'brand/brand_b_theme.dart';

// ── Controller ───────────────────────────────────────────────────────────────
export 'controller/ds_theme_controller.dart';

// ── Widgets ──────────────────────────────────────────────────────────────────
export 'widgets/ds_app.dart';
export 'widgets/ds_brand_toggle.dart';
export 'widgets/ds_button.dart';
export 'widgets/ds_card.dart';
export 'widgets/ds_surface.dart';
export 'widgets/ds_theme_toggle.dart';
