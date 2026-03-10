/// An immutable data model representing a single comment on a notice post.
class NoticeComment {
  const NoticeComment({
    required this.id,
    required this.author,
    required this.body,
    required this.createdAt,
  });

  final String id;
  final String author;
  final String body;
  final DateTime createdAt;

  NoticeComment copyWith({
    String? id,
    String? author,
    String? body,
    DateTime? createdAt,
  }) {
    return NoticeComment(
      id: id ?? this.id,
      author: author ?? this.author,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
