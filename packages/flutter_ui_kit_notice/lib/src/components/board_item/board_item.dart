import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_l10n/flutter_ui_kit_l10n.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

import '../../models/notice_post.dart';
import '../glass_card/glass_card.dart';
import '../glass_tag/glass_tag.dart';

/// A single glassmorphism card representing one [NoticePost] in a board list.
///
/// Displays title, author, date, view count, and comment count.
/// Pinned posts and category tags are shown at the top.
///
/// ```dart
/// BoardItem(
///   post: noticePost,
///   onTap: () => navigateToDetail(post),
/// )
/// ```
class BoardItem extends StatelessWidget {
  const BoardItem({
    super.key,
    required this.post,
    this.onTap,
    this.animate = false,
  });

  final NoticePost post;
  final VoidCallback? onTap;

  /// Fades the item in when first built.
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return GlassCard(
      onTap: onTap,
      animate: animate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TagRow(post: post, cs: cs),
          AppSpacing.gapV1,
          Text(
            post.title,
            style: tt.titleSmall?.copyWith(color: cs.onSurface),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          AppSpacing.gapV1,
          _MetaRow(post: post, cs: cs, tt: tt),
        ],
      ),
    );
  }
}

class _TagRow extends StatelessWidget {
  const _TagRow({required this.post, required this.cs});

  final NoticePost post;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    final l10n = Localizations.of<UiKitLocalizations>(context, UiKitLocalizations) ?? UiKitLocalizationsEn();
    final tags = <Widget>[];

    if (post.isPinned) {
      tags.addAll([GlassTag(label: l10n.noticePinned, color: cs.primary), AppSpacing.gapH1]);
    }
    if (post.category != null) {
      tags.addAll([GlassTag(label: post.category!), AppSpacing.gapH1]);
    }
    if (post.isNew) {
      tags.add(GlassTag(label: 'NEW', color: cs.error));
    }

    if (tags.isEmpty) return const SizedBox.shrink();

    return Row(children: tags);
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({
    required this.post,
    required this.cs,
    required this.tt,
  });

  final NoticePost post;
  final ColorScheme cs;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    final secondary = tt.bodySmall?.copyWith(color: cs.onSurfaceVariant);
    final muted = tt.labelSmall?.copyWith(color: cs.outlineVariant);

    return Row(
      children: [
        Text(post.author, style: secondary),
        AppSpacing.gapH1,
        Text('·', style: muted),
        AppSpacing.gapH1,
        Text(_formatDate(context, post.createdAt), style: secondary),
        const Spacer(),
        Icon(Icons.visibility_outlined, size: 14, color: cs.outlineVariant),
        AppSpacing.gapH0_5,
        Text('${post.viewCount}', style: muted),
        AppSpacing.gapH1,
        Icon(Icons.chat_bubble_outline, size: 14, color: cs.outlineVariant),
        AppSpacing.gapH0_5,
        Text('${post.commentCount}', style: muted),
      ],
    );
  }

  String _formatDate(BuildContext context, DateTime date) {
    final l10n = Localizations.of<UiKitLocalizations>(context, UiKitLocalizations) ?? UiKitLocalizationsEn();
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 60) return l10n.minutesAgo(diff.inMinutes);
    if (diff.inHours < 24) return l10n.hoursAgo(diff.inHours);
    return '${date.year}.${_pad(date.month)}.${_pad(date.day)}';
  }

  String _pad(int n) => n.toString().padLeft(2, '0');
}
