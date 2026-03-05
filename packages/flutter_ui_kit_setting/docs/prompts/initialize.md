You are a senior Flutter plugin architect.

Design a Flutter plugin named `flutter_ui_kit_setting`.

The plugin must provide a reusable UI kit for application settings screens.

Analyze requirements step-by-step and design a clean architecture suitable for pub.dev distribution.

------------------------------------------------

PLUGIN NAME
flutter_ui_kit_setting

------------------------------------------------

CORE COMPONENTS

1. Setting Button Widget

Create a reusable widget:

SettingGearButton()

Features
- gear icon button
- customizable icon size
- customizable color
- onPressed → navigate to SettingScreen
- optional tooltip
- optional animation

------------------------------------------------

2. Setting Screen Component

Create:

SettingScreen()

Features
- modular settings architecture
- section based layout
- customizable menu items

OPTIONS

2-1 App Version Display

Widget:
SettingAppVersionTile()

Features
- display app version
- automatically fetch version using package_info_plus
- optional label customization

Example
App Version: 1.0.0

------------------------------------------------

2-2 Developer Email

Widget:
SettingDeveloperEmailTile()

Features
- show developer email
- tap → open email composer
- configurable subject/body

Email sending should support:

url_launcher → mailto:

------------------------------------------------

3. Custom Setting Menu Extension

The plugin must allow developers to inject custom settings.

Example

SettingScreen(
  sections: [
    SettingSection(
      title: "General",
      items: [
        SettingTile(...)
      ]
    )
  ]
)

Allow:

SettingTile
SwitchTile
NavigationTile
CustomWidgetTile

------------------------------------------------

4. Theme Integration

Plugin must support integration with another plugin:

flutter_ui_kit_theme

Provide widget:

SettingThemeToggleTile()

Features
- Light / Dark toggle
- System theme option
- animated switch
- automatically update UI

Example

SettingThemeToggleTile(
  themeController: ThemeController
)

------------------------------------------------

ARCHITECTURE REQUIREMENTS

Use clean architecture.

Provide folder structure:

lib/
  flutter_ui_kit_setting.dart
  widgets/
  screens/
  tiles/
  sections/
  models/
  services/

------------------------------------------------

CODE REQUIREMENTS

Provide example code for:

1. Gear button usage
2. Setting screen usage
3. Custom menu injection
4. Theme toggle integration
5. Email sending implementation

------------------------------------------------

UX REQUIREMENTS

Design must follow modern mobile UI patterns:

- minimal design
- proper spacing
- section grouping
- platform adaptive (Android/iOS)

------------------------------------------------

OUTPUT FORMAT

1️⃣ Plugin Architecture  
2️⃣ Folder Structure  
3️⃣ Widget API Design  
4️⃣ Example Implementation Code  
5️⃣ Example App Usage

Think step-by-step before generating the architecture.