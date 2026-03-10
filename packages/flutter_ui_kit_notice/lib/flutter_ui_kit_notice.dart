/// Flutter UI Kit — Glassmorphism Notice Board UI Kit.
///
/// Provides reusable glassmorphism components for forum, community, and
/// notice board use cases. All tokens (colors, spacing, radius, typography)
/// are sourced from `flutter_ui_kit_theme`.
///
/// ```dart
/// import 'package:flutter_ui_kit_notice/flutter_ui_kit_notice.dart';
/// ```
library;

// ── Models ───────────────────────────────────────────────────────────────────
export 'src/models/notice_comment.dart';
export 'src/models/notice_post.dart';

// ── Glass UI components ───────────────────────────────────────────────────────
export 'src/components/glass_card/glass_card.dart';
export 'src/components/glass_tag/glass_tag.dart';

// ── Board components ─────────────────────────────────────────────────────────
export 'src/components/board_item/board_item.dart';
export 'src/components/board_list/board_list.dart';
export 'src/components/comment_widget/comment_widget.dart';
export 'src/components/post_view/post_view.dart';
