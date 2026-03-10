import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_ui_kit_notice/flutter_ui_kit_notice.dart';

void main() {
  group('NoticePost', () {
    test('copyWith overrides only specified fields', () {
      final post = NoticePost(
        id: '1',
        title: 'Hello',
        author: 'Alice',
        createdAt: DateTime(2025),
        viewCount: 10,
      );

      final updated = post.copyWith(viewCount: 99);
      expect(updated.viewCount, 99);
      expect(updated.title, 'Hello');
      expect(updated.isPinned, false);
    });
  });

  group('NoticeComment', () {
    test('copyWith overrides only specified fields', () {
      final comment = NoticeComment(
        id: 'c1',
        author: 'Bob',
        body: 'Nice post!',
        createdAt: DateTime(2025),
      );

      final updated = comment.copyWith(body: 'Updated!');
      expect(updated.body, 'Updated!');
      expect(updated.author, 'Bob');
    });
  });
}
