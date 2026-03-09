# Flutter UI KIT L10n

Shared localization package for Flutter UI Kit monorepo.

Provides `UiKitLocalizations` — a set of common UI translations (en, ko, ja)
reusable across multiple Flutter apps.

## Quick start

```dart
import 'package:flutter_ui_kit_l10n/flutter_ui_kit_l10n.dart';

MaterialApp(
  localizationsDelegates: [
    UiKitLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: UiKitLocalizations.supportedLocales,
)

// In widgets:
final l10n = UiKitLocalizations.of(context);
Text(l10n.settings);
```

## Current locale

```dart
// Get current locale from context
final locale = Localizations.localeOf(context);
print(locale.languageCode); // "en", "ko", "ja"

// Get localised strings for the current locale
final l10n = UiKitLocalizations.of(context);
Text(l10n.settingsLanguage); // "Language" / "언어" / "言語"
```

## Change locale at runtime

Use a `ValueNotifier<Locale>` to manage the locale state and wrap
`MaterialApp` with `ValueListenableBuilder`:

```dart
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _localeNotifier = ValueNotifier(const Locale('en'));

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: _localeNotifier,
      builder: (_, locale, __) => MaterialApp(
        locale: locale,
        localizationsDelegates: [
          UiKitLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: UiKitLocalizations.supportedLocales,
        home: HomeScreen(localeNotifier: _localeNotifier),
      ),
    );
  }
}
```

### UiKitLocaleToggle

A ready-made toggle button that cycles through supported locales on each tap.
It displays the current locale code (e.g. **EN** → **KO** → **JA** → **EN**).

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.localeNotifier});

  final ValueNotifier<Locale> localeNotifier;

  @override
  Widget build(BuildContext context) {
    final l10n = UiKitLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
        actions: [
          // Tap to cycle: EN → KO → JA → EN ...
          UiKitLocaleToggle(
            currentLocale: currentLocale,
            onLocaleChanged: (locale) => localeNotifier.value = locale,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${l10n.settingsLanguage}: ${currentLocale.languageCode}'),
            Text(l10n.settingsTheme),
            Text(l10n.settingsAccount),
          ],
        ),
      ),
    );
  }
}
```

## App-level override

Use `UiKitLocalizationsOverrideDelegate` instead of `UiKitLocalizations.delegate`
when you need to customise individual strings per app:

```dart
// 1. Extend and override specific getters
class MyAppLocalizationsEn extends UiKitLocalizationsEn {
  @override
  String get settings => 'App Settings';

  @override
  String get addItem => 'Add D-Day';
}

// 2. Pass the override delegate
MaterialApp(
  localizationsDelegates: [
    UiKitLocalizationsOverrideDelegate(
      overrideFactory: (locale) => switch (locale.languageCode) {
        'en' => MyAppLocalizationsEn(),
        'ko' => MyAppLocalizationsKo(),
        _ => null, // falls back to shared default
      },
    ),
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: UiKitLocalizations.supportedLocales,
)
```

## Supported locales

| Code | Language |
|------|----------|
| `en` | English  |
| `ko` | Korean   |
| `ja` | Japanese |
