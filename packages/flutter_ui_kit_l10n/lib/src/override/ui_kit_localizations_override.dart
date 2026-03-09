import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../generated/ui_kit_localizations.dart';

// ignore_for_file: type=lint

/// A [LocalizationsDelegate] that supports app-level overrides on top of the
/// shared [UiKitLocalizations].
///
/// Apps can pass an [overrideFactory] to replace specific strings or provide
/// entirely custom implementations per locale.
///
/// ## Usage — override specific strings
///
/// ```dart
/// // 1. Extend the locale-specific class and override individual getters.
/// class DaylyLocalizationsEn extends UiKitLocalizationsEn {
///   @override
///   String get settings => 'App Settings';
///
///   // App-specific (app's own l10n handles these via AppLocalizations)
/// }
///
/// // 2. Pass the override factory to the delegate.
/// MaterialApp(
///   localizationsDelegates: [
///     UiKitLocalizationsOverrideDelegate(
///       overrideFactory: (locale) => switch (locale.languageCode) {
///         'en' => DaylyLocalizationsEn(),
///         'ko' => DaylyLocalizationsKo(),
///         _ => null, // fall back to default UiKitLocalizations
///       },
///     ),
///     GlobalMaterialLocalizations.delegate,
///     GlobalCupertinoLocalizations.delegate,
///     GlobalWidgetsLocalizations.delegate,
///   ],
///   supportedLocales: UiKitLocalizations.supportedLocales,
/// )
/// ```
///
/// ## Localization resolution priority
///
/// 1. App override (returned by [overrideFactory]) — highest priority
/// 2. Shared [UiKitLocalizations] — fallback
class UiKitLocalizationsOverrideDelegate
    extends LocalizationsDelegate<UiKitLocalizations> {
  /// Creates a delegate that applies app-level overrides before falling back
  /// to the shared [UiKitLocalizations].
  ///
  /// [overrideFactory] receives the requested [Locale] and should return an
  /// [UiKitLocalizations] subclass, or `null` to use the default.
  const UiKitLocalizationsOverrideDelegate({
    required this.overrideFactory,
  });

  /// Factory function that returns an app-specific [UiKitLocalizations]
  /// instance for the given [Locale], or `null` to use the shared default.
  final UiKitLocalizations? Function(Locale locale) overrideFactory;

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'ko'].contains(locale.languageCode);

  @override
  Future<UiKitLocalizations> load(Locale locale) {
    final override = overrideFactory(locale);
    if (override != null) return SynchronousFuture<UiKitLocalizations>(override);
    return SynchronousFuture<UiKitLocalizations>(
        lookupUiKitLocalizations(locale));
  }

  @override
  bool shouldReload(UiKitLocalizationsOverrideDelegate old) => false;

  @override
  String toString() => 'UiKitLocalizationsOverrideDelegate';
}
