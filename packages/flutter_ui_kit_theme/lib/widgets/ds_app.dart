import 'package:flutter/material.dart';

import '../controller/ds_theme_controller.dart';

/// Rebuilds its [builder] whenever the [DsThemeController] changes.
///
/// This is a thin wrapper around [ListenableBuilder] that passes the
/// resolved theme data to the builder callback, so consumers don't need
/// to wire [ListenableBuilder] manually.
///
/// ```dart
/// DsThemeBuilder(
///   controller: controller,
///   builder: (light, dark, mode) => MaterialApp(
///     theme: light,
///     darkTheme: dark,
///     themeMode: mode,
///     home: const MyHomePage(),
///   ),
/// )
/// ```
class DsThemeBuilder extends StatelessWidget {
  const DsThemeBuilder({
    super.key,
    required this.controller,
    required this.builder,
  });

  final DsThemeController controller;

  /// Called whenever [controller] notifies.
  final Widget Function(
    ThemeData lightTheme,
    ThemeData darkTheme,
    ThemeMode themeMode,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, __) => builder(
        controller.lightTheme,
        controller.darkTheme,
        controller.themeMode,
      ),
    );
  }
}
