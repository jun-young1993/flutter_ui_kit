import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

import '../../models/notice_comment.dart';
import '../glass_card/glass_card.dart';

/// A glassmorphism card displaying a single [NoticeComment].
///
/// Shows an avatar with the author's initial, the author name, relative
/// timestamp, and the comment body.
///
/// ```dart
/// CommentWidget(comment: noticeComment)
/// ```
class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.comment,
  });

  final NoticeComment comment;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    final initial =
        comment.author.isNotEmpty ? comment.author[0].toUpperCase() : '?';

    return GlassCard(
      padding: AppSpacing.compactPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: cs.primary.withValues(alpha: 0.2),
            child: Text(
              initial,
              style: tt.labelSmall?.copyWith(color: cs.primary),
            ),
          ),
          AppSpacing.gapH1_5,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.author,
                      style: tt.labelMedium?.copyWith(color: cs.onSurface),
                    ),
                    AppSpacing.gapH1,
                    Text(
                      _formatDate(comment.createdAt),
                      style: tt.labelSmall?.copyWith(color: cs.outlineVariant),
                    ),
                  ],
                ),
                AppSpacing.gapV0_5,
                Text(
                  comment.body,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 60) return '${diff.inMinutes}분 전';
    if (diff.inHours < 24) return '${diff.inHours}시간 전';
    return '${date.year}.${_pad(date.month)}.${_pad(date.day)}';
  }

  String _pad(int n) => n.toString().padLeft(2, '0');
}
