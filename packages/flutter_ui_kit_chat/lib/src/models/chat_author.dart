import 'package:flutter/foundation.dart';

enum ChatAuthorRole { currentUser, other, system }

@immutable
class ChatAuthor {
  const ChatAuthor({
    required this.id,
    required this.displayName,
    this.avatarUrl,
    this.role = ChatAuthorRole.other,
  });

  final String id;
  final String displayName;
  final String? avatarUrl;
  final ChatAuthorRole role;

  bool get isCurrentUser => role == ChatAuthorRole.currentUser;
}
