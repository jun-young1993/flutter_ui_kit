/// An immutable data model representing a single notice board post.
class NoticePost {
  const NoticePost({
    required this.id,
    required this.title,
    required this.author,
    required this.createdAt,
    this.category,
    this.body,
    this.viewCount = 0,
    this.commentCount = 0,
    this.isPinned = false,
    this.isNew = false,
  });

  final String id;
  final String title;
  final String author;
  final DateTime createdAt;

  /// Optional category label (e.g. '공지', '이벤트', '자유').
  final String? category;

  /// Full body text. `null` when rendering in list mode.
  final String? body;

  final int viewCount;
  final int commentCount;

  /// Pinned posts are displayed at the top of [BoardList].
  final bool isPinned;

  /// Marks posts created within the last 24 hours.
  final bool isNew;

  NoticePost copyWith({
    String? id,
    String? title,
    String? author,
    DateTime? createdAt,
    String? category,
    String? body,
    int? viewCount,
    int? commentCount,
    bool? isPinned,
    bool? isNew,
  }) {
    return NoticePost(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      createdAt: createdAt ?? this.createdAt,
      category: category ?? this.category,
      body: body ?? this.body,
      viewCount: viewCount ?? this.viewCount,
      commentCount: commentCount ?? this.commentCount,
      isPinned: isPinned ?? this.isPinned,
      isNew: isNew ?? this.isNew,
    );
  }
}
