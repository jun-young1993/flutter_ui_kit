import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/ds_brand_toggle.dart';

/// Persists [ThemeMode] and [DsBrand] across app restarts using
/// [SharedPreferences].
///
/// ─────────────────────────────────────────────
/// Quick start
/// ─────────────────────────────────────────────
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   final ctrl = DsThemeController();
///   await ctrl.init();
///   runApp(MyApp(controller: ctrl));
/// }
///
/// class MyApp extends StatelessWidget {
///   const MyApp({super.key, required this.controller});
///   final DsThemeController controller;
///
///   @override
///   Widget build(BuildContext context) {
///     return ListenableBuilder(
///       listenable: controller,
///       builder: (_, __) => MaterialApp(
///         theme: controller.lightTheme,
///         darkTheme: controller.darkTheme,
///         themeMode: controller.themeMode,
///         home: Scaffold(
///           appBar: AppBar(
///             actions: [
///               DsBrandToggle(
///                 brand: controller.brand,
///                 onChanged: controller.setBrand,
///               ),
///               DsThemeToggle(
///                 themeMode: controller.themeMode,
///                 onChanged: controller.setThemeMode,
///               ),
///             ],
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```
class DsThemeController extends ChangeNotifier {
  DsThemeController({
    ThemeMode defaultThemeMode = ThemeMode.system,
    DsBrand defaultBrand = DsBrand.violet,
  })  : _themeMode = defaultThemeMode,
        _brand = defaultBrand;

  // ─── Storage keys ──────────────────────────────────────────────────────────

  static const _kThemeModeKey = 'ds_theme_mode';
  static const _kBrandKey = 'ds_brand';

  // ─── State ─────────────────────────────────────────────────────────────────

  ThemeMode _themeMode;
  DsBrand _brand;

  /// The currently active [ThemeMode].
  ThemeMode get themeMode => _themeMode;

  /// The currently active [DsBrand].
  DsBrand get brand => _brand;

  /// Convenience getter — the light [ThemeData] for the active brand.
  ThemeData get lightTheme => _brand.lightTheme();

  /// Convenience getter — the dark [ThemeData] for the active brand.
  ThemeData get darkTheme => _brand.darkTheme();

  // ─── Initialisation ────────────────────────────────────────────────────────

  /// Loads persisted values from [SharedPreferences].
  ///
  /// Call once at app startup **after** [WidgetsFlutterBinding.ensureInitialized].
  /// If no saved values exist, the defaults passed to the constructor are kept.
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();

    final modeIndex = prefs.getInt(_kThemeModeKey);
    if (modeIndex != null && modeIndex < ThemeMode.values.length) {
      _themeMode = ThemeMode.values[modeIndex];
    }

    final brandIndex = prefs.getInt(_kBrandKey);
    if (brandIndex != null && brandIndex < DsBrand.values.length) {
      _brand = DsBrand.values[brandIndex];
    }

    notifyListeners();
  }

  // ─── Mutators ──────────────────────────────────────────────────────────────

  /// Updates the [ThemeMode] and persists the choice.
  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
    _persist();
  }

  /// Updates the [DsBrand] and persists the choice.
  void setBrand(DsBrand brand) {
    if (_brand == brand) return;
    _brand = brand;
    notifyListeners();
    _persist();
  }

  // ─── Persistence ───────────────────────────────────────────────────────────

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.setInt(_kThemeModeKey, _themeMode.index),
      prefs.setInt(_kBrandKey, _brand.index),
    ]);
  }
}
