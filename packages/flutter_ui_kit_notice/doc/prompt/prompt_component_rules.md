# Component Rules

All UI components must follow consistent structure.

---

# Widget Guidelines

Prefer:

StatelessWidget

Use StatefulWidget only when necessary.

---

# File Structure

Each component must have its own folder.

Example:

glass_card

glass_card.dart
glass_card_style.dart

---

# Component Structure

Every component should follow:

class Widget
private style helpers
theme usage

Example:

GlassCard

GlassButton

GlassInput

---

# Theme Usage

Each widget must read theme values.

Example:

final theme = UiKitTheme.of(context);

Never store theme values globally.

---

# Parameter Rules

Components must expose only necessary parameters.

Example:

child
padding
onTap

Avoid too many parameters.

---

# Naming Rules

Widgets must follow:

Glass prefix for UI kit components.

Examples:

GlassCard
GlassButton
GlassInput
GlassTag

Board components:

BoardList
BoardItem
PostView
CommentWidget

---

# Code Complexity

Components must remain:

readable
small
reusable

Avoid widgets longer than 200 lines.

Split logic when necessary.

---

# Animation Usage

Animations must remain optional.

Expose parameters such as:

animate
hoverEffect

---

# Documentation

Each component should include example usage.

Example:

GlassCard(
child: Text("Example")
)

---

# Goal

Components should feel:

clean
consistent
predictable
