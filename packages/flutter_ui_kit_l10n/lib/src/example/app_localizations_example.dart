// ignore_for_file: type=lint, unused_element
// This file is an EXAMPLE — do not include in production builds.
// Copy the patterns below into your app's own localization setup.

import 'package:flutter_ui_kit_l10n/flutter_ui_kit_l10n.dart';

// =============================================================================
// EXAMPLE 1: Overriding shared strings per app
// =============================================================================
//
// Extend the locale-specific implementation and override individual getters.
// The app does NOT need to re-declare every key — only the ones it wants
// to customise.

/// English override for the "dayly" app.
class _DaylyLocalizationsEn extends UiKitLocalizationsEn {
  // Override a shared key with app-specific wording.
  @override
  String get settings => 'App Settings';

  // Override addItem with a domain-specific label.
  @override
  String get addItem => 'Add D-Day';
}

/// Korean override for the "dayly" app.
class _DaylyLocalizationsKo extends UiKitLocalizationsKo {
  @override
  String get settings => '앱 설정';

  @override
  String get addItem => 'D-Day 추가';
}

/// Japanese override for the "dayly" app.
class _DaylyLocalizationsJa extends UiKitLocalizationsJa {
  @override
  String get settings => 'アプリ設定';

  @override
  String get addItem => 'D-Dayを追加';
}

// =============================================================================
// EXAMPLE 2: MaterialApp configuration
// =============================================================================
//
// Option A — Use the shared delegate as-is (no overrides):
//
//   MaterialApp(
//     localizationsDelegates: [
//       UiKitLocalizations.delegate,          // shared package
//       GlobalMaterialLocalizations.delegate,
//       GlobalCupertinoLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//     ],
//     supportedLocales: UiKitLocalizations.supportedLocales,
//   )
//
// Option B — Use the override delegate for app-specific strings:
//
//   MaterialApp(
//     localizationsDelegates: [
//       UiKitLocalizationsOverrideDelegate(
//         overrideFactory: (locale) => switch (locale.languageCode) {
//           'en' => _DaylyLocalizationsEn(),
//           'ko' => _DaylyLocalizationsKo(),
//           'ja' => _DaylyLocalizationsJa(),
//           _ => null, // unsupported locale → fall back to shared defaults
//         },
//       ),
//       GlobalMaterialLocalizations.delegate,
//       GlobalCupertinoLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//     ],
//     supportedLocales: UiKitLocalizations.supportedLocales,
//   )

// =============================================================================
// EXAMPLE 3: Widget usage
// =============================================================================
//
//   @override
//   Widget build(BuildContext context) {
//     final l10n = UiKitLocalizations.of(context);
//     return Column(
//       children: [
//         Text(l10n.settings),          // 'Settings' / '설정' / '設定'
//         ElevatedButton(
//           onPressed: () {},
//           child: Text(l10n.addItem),  // 'Add D-Day' (if using override)
//         ),
//       ],
//     );
//   }

// =============================================================================
// EXAMPLE 4: App-specific keywords (separate AppLocalizations)
// =============================================================================
//
// For keys that are entirely app-specific (not overriding shared keys),
// create a separate l10n setup in the app:
//
//   apps/dayly/
//     l10n/
//       app_en.arb   { "addDday": "Add D-Day", "ddayRemaining": "{n} days left" }
//       app_ko.arb   { "addDday": "D-Day 추가", "ddayRemaining": "{n}일 남음" }
//     l10n.yaml      (template-arb-file: app_en.arb, output-class: AppLocalizations)
//
// Then in widgets use both:
//
//   final kit = UiKitLocalizations.of(context); // shared strings
//   final app = AppLocalizations.of(context);   // app-specific strings
//
//   Text(kit.settings);      // from shared package
//   Text(app.addDday);       // from app's own l10n
