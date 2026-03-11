import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_notice/flutter_ui_kit_notice.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({
    super.key,
    required this.post,
    required this.comments,
  });

  final NoticePost post;
  final List<NoticeComment> comments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 상세'),
      ),
      body: PostView(
        post: post,
        comments: comments,
      ),
    );
  }
}
