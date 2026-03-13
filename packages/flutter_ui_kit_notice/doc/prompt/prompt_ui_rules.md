# UI Rules

All UI must follow **Glassmorphism principles**.

---

# Layout Rules

Always prefer:

simple layout
clear spacing
minimal hierarchy

Avoid:

nested containers
complex decorations
heavy shadows

---

# Spacing Rules

Spacing must always use theme values.

Example:

theme.spacing.xs
theme.spacing.sm
theme.spacing.md
theme.spacing.lg

Never hardcode numbers like:

8
12
16
24

---

# Radius Rules

Always use theme radius.

Example:

theme.radius.sm
theme.radius.md
theme.radius.lg

Do not define custom border radius.

---

# Color Rules

All colors must come from:

theme.colors

Examples:

theme.colors.primary
theme.colors.surface
theme.colors.textPrimary
theme.colors.textSecondary

Never use:

Color(0xFFxxxxxx)

---

# Glass Surface Rules

Every glass container must include:

blur
translucent background
soft border

Example structure:

ClipRRect
BackdropFilter
DecoratedBox

---

# Shadow Rules

Shadows must remain **soft and minimal**.

Avoid:

large drop shadows
multiple shadow layers

---

# Typography Rules

Typography must come from theme.

Example:

theme.typography.title
theme.typography.body
theme.typography.caption

Never use custom font sizes.

---

# Dark Mode

Dark mode is the **default design mode**.

UI must look clean on dark backgrounds.

Avoid bright surfaces.

---

# Interaction Rules

Hover and press effects should include:

subtle scale
soft glow
opacity change

Never use dramatic animations.
