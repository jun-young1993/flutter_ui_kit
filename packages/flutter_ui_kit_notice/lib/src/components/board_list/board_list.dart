import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

import '../../models/notice_post.dart';
import '../board_item/board_item.dart';

/// A scrollable list of [BoardItem] cards, sorted so pinned posts appear first.
///
/// Pinned posts are automatically moved to the top of the list.
///
/// ```dart
/// BoardList(
///   posts: posts,
///   onTapPost: (post) => navigateToDetail(post),
/// )
/// ```
class BoardList extends StatelessWidget {
  const BoardList({
    super.key,
    required this.posts,
    this.onTapPost,
    this.emptyWidget,
    this.padding,
    this.animateItems = false,
  });

  final List<NoticePost> posts;
  final void Function(NoticePost post)? onTapPost;

  /// Widget shown when [posts] is empty.
  final Widget? emptyWidget;

  /// Outer padding for the list. Defaults to [AppSpacing.pagePadding].
  final EdgeInsetsGeometry? padding;

  /// Passes [animate] = true to each [BoardItem].
  final bool animateItems;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    if (posts.isEmpty) {
      return emptyWidget ??
          Center(
            child: Text(
              '게시글이 없습니다.',
              style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
          );
    }

    // Pinned items first, then sorted by createdAt descending.
    final sorted = [...posts]..sort((a, b) {
        if (a.isPinned == b.isPinned) {
          return b.createdAt.compareTo(a.createdAt);
        }
        return a.isPinned ? -1 : 1;
      });

    return ListView.separated(
      padding: padding ?? AppSpacing.pagePadding,
      itemCount: sorted.length,
      separatorBuilder: (_, __) => AppSpacing.gapV1,
      itemBuilder: (context, index) {
        final post = sorted[index];
        return BoardItem(
          post: post,
          animate: animateItems,
          onTap: () => onTapPost?.call(post),
        );
      },
    );
  }
}
