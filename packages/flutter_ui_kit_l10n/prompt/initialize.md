### Role

You are a senior Flutter architect who designs scalable monorepo architectures for multi-app ecosystems.

### Goal

Design a **Flutter localization (l10n) system** that works in a **monorepo environment** and can be reused across multiple Flutter apps.

The system must support:

* shared localization package
* per-app localization override
* custom keywords per app
* easy language expansion
* clean architecture for long-term maintenance

### Context

The project uses a **Flutter monorepo** managed with **Melos**.

Example repository structure:

```
flutter_workspace
│
├ melos.yaml
│
├ packages
│   ├ flutter_ui_kit_theme
│   ├ flutter_ui_kit_widgets
│   └ flutter_ui_kit_l10n
│
└ apps
    ├ dayly
    └ another_app
```

The localization system should be implemented as a reusable package:

```
packages/flutter_ui_kit_l10n
```

This package will provide **shared translations** used by multiple apps.

---

### Requirements

#### 1. Shared localization package

The shared localization package should contain common UI translations used across apps.

Example:

```
packages/flutter_ui_kit_l10n
│
├ lib
│   ├ flutter_ui_kit_l10n.dart
│   └ generated
│
├ l10n
│   ├ core_en.arb
│   ├ core_ko.arb
│   └ core_ja.arb
│
└ l10n.yaml
```

The package must use the **Flutter official localization system**:

```
flutter gen-l10n
```

---

#### 2. Language extensibility

The system must allow adding new languages easily.

Example:

```
core_en.arb
core_ko.arb
core_ja.arb
core_es.arb
core_fr.arb
```

Adding a new language file should automatically extend the localization system.

---

#### 3. App-specific localization override

Each app must be able to **override shared translations**.

Example:

Shared translation:

```
settings = "Settings"
```

But in a specific app:

```
settings = "App Settings"
```

Apps should be able to define their own localization files:

```
apps/dayly/l10n
   app_en.arb
   app_ko.arb
```

Localization resolution strategy:

1. App translation (highest priority)
2. Shared package translation (fallback)

---

#### 4. Custom keyword support per app

Different apps may use different terminology.

Example:

Shared key:

```
addItem
```

App A:

```
addDday
```

App B:

```
addTask
```

The architecture must support **feature-based or namespace-based ARB structures**.

Example:

```
core_en.arb
settings_en.arb
ads_en.arb
dday_en.arb
```

---

#### 5. Monorepo compatibility

The system must work smoothly with **Melos**.

Example command:

```
melos bootstrap
```

Dependencies should resolve correctly between:

```
apps/*
packages/*
```

---

#### 6. Flutter integration

Provide a full example for:

MaterialApp configuration

Example:

```
MaterialApp(
  localizationsDelegates: ...,
  supportedLocales: ...
)
```

Usage example:

```
L10n.of(context).settings
```

---

### Expected Output

Provide a **complete architectural guide** including:

1. Recommended folder structure
2. pubspec.yaml configuration
3. l10n.yaml configuration
4. ARB file strategy
5. code generation workflow
6. localization fallback strategy
7. per-app override implementation
8. language expansion strategy
9. example Flutter usage code
10. maintenance strategy for large multi-app projects

The design should be **scalable, maintainable, and suitable for production Flutter monorepos**.
