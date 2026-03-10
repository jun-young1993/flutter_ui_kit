# GlassBoard UI KIT (Flutter)

A premium **Glassmorphism Board UI Kit for Flutter**.

This project builds a reusable UI system for **forum, community, and content platforms** using a clean glass design.

The focus is:

* extremely clean UI
* reusable Flutter widgets
* scalable architecture
* modern glassmorphism design

---

# CRITICAL RULE

The project **MUST use the `flutter_ui_kit_theme` package**.

Do NOT create a custom theme system.

All design tokens must come from:

flutter_ui_kit_theme

Import:

import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

Access theme values using:

final theme = UiKitTheme.of(context);

Never hardcode:

* colors
* spacing
* radius
* typography

Always use:

theme.colors
theme.spacing
theme.radius
theme.typography

---

# Architecture

The repository must follow a **monorepo structure**.

glass_board

packages
glass_ui_kit
glass_board_components

apps
glass_board_demo

---

# Package Responsibilities

glass_ui_kit

Reusable UI components.

Examples:

GlassCard
GlassButton
GlassInput
GlassTag
GlassModal

---

glass_board_components

Board related UI.

Examples:

BoardList
BoardItem
PostView
CommentWidget
PostEditor

---

glass_board_demo

Example application that demonstrates the UI kit.

---

# Design Style

The entire UI must follow **glassmorphism design**.

Key visual rules:

blurred backgrounds
soft translucent surfaces
subtle borders
minimal layout

Avoid heavy gradients or bright colors.

The UI must feel:

clean
modern
lightweight

---

# Glass Effect

Use Flutter widgets to create glass surfaces.

Preferred structure:

BackdropFilter
ClipRRect
DecoratedBox

Example concept:

BackdropFilter(
filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
child: Container()
)

Blur must remain subtle.

---

# Responsiveness

The UI must support:

Mobile
Tablet
Desktop
Web

Use:

LayoutBuilder
MediaQuery

---

# Animation Philosophy

Animations must be:

subtle
fast
non-distracting

Preferred widgets:

AnimatedContainer
FadeTransition
TweenAnimationBuilder
Hero

---

# Dependencies

Required

flutter_ui_kit_theme

Recommended

flutter_riverpod
flutter_hooks
google_fonts
animations

Optional

flutter_animate

---

# Deliverables

The project must produce:

1 reusable UI Kit
1 board component library
1 demo application

Focus on quality and clarity.
