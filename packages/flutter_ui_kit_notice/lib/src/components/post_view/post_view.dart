import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_l10n/flutter_ui_kit_l10n.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

import '../../models/notice_comment.dart';
import '../../models/notice_post.dart';
import '../comment_widget/comment_widget.dart';
import '../glass_card/glass_card.dart';
import '../glass_tag/glass_tag.dart';

/// A scrollable full-post view for a [NoticePost].
///
/// Renders the post header (title, author, date, view count), body, and
/// an optional comment section. Each comment is rendered via [commentBuilder]
/// or falls back to [CommentWidget].
///
/// ```dart
/// PostView(
///   post: selectedPost,
///   comments: comments,
/// )
/// ```
class PostView extends StatelessWidget {
  const PostView({
    super.key,
    required this.post,
    this.comments = const [],
    this.commentBuilder,
    this.padding,
  });

  final NoticePost post;
  final List<NoticeComment> comments;

  /// Custom builder for each comment. Falls back to [CommentWidget].
  final Widget Function(NoticeComment comment)? commentBuilder;

  /// Outer padding. Defaults to [AppSpacing.pagePadding].
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: padding ?? AppSpacing.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PostHeader(post: post, cs: cs, tt: tt),
          AppSpacing.gapV2,
          _PostBody(post: post, cs: cs, tt: tt),
          if (comments.isNotEmpty) ...[
            AppSpacing.gapV3,
            Builder(
              builder: (context) {
                final l10n = Localizations.of<UiKitLocalizations>(context, UiKitLocalizations) ?? UiKitLocalizationsEn();
                return Text(
                  l10n.noticeCommentsCount(comments.length),
                  style: tt.titleSmall?.copyWith(color: cs.onSurface),
                );
              },
            ),
            AppSpacing.gapV1,
            ...comments.map(
              (c) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.x1),
                child: commentBuilder?.call(c) ?? CommentWidget(comment: c),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({
    required this.post,
    required this.cs,
    required this.tt,
  });

  final NoticePost post;
  final ColorScheme cs;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TagRow(post: post, cs: cs),
          AppSpacing.gapV1_5,
          Text(
            post.title,
            style: tt.headlineSmall?.copyWith(color: cs.onSurface),
          ),
          AppSpacing.gapV1,
          Row(
            children: [
              Text(
                post.author,
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
              AppSpacing.gapH1,
              Text(
                _formatDate(post.createdAt),
                style: tt.bodySmall?.copyWith(color: cs.outlineVariant),
              ),
              const Spacer(),
              Icon(Icons.visibility_outlined, size: 14, color: cs.outlineVariant),
              AppSpacing.gapH0_5,
              Text(
                '${post.viewCount}',
                style: tt.labelSmall?.copyWith(color: cs.outlineVariant),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) =>
      '${date.year}.${_pad(date.month)}.${_pad(date.day)}';

  String _pad(int n) => n.toString().padLeft(2, '0');
}

class _PostBody extends StatelessWidget {
  const _PostBody({
    required this.post,
    required this.cs,
    required this.tt,
  });

  final NoticePost post;
  final ColorScheme cs;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Text(
        post.body ?? '',
        style: tt.bodyMedium?.copyWith(color: cs.onSurface, height: 1.7),
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

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.x0_5),
      child: Row(children: tags),
    );
  }
}
