import 'package:flutter/foundation.dart';

import 'chat_author.dart';
import 'chat_message_status.dart';

@immutable
class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.author,
    required this.text,
    required this.sentAt,
    this.status = ChatMessageStatus.sent,
    this.reactions = const <String, int>{},
    this.replyToMessageId,
    this.metadata = const <String, Object?>{},
  });

  final String id;
  final ChatAuthor author;
  final String text;
  final DateTime sentAt;
  final ChatMessageStatus status;
  final Map<String, int> reactions;
  final String? replyToMessageId;
  final Map<String, Object?> metadata;

  ChatMessage copyWith({
    String? id,
    ChatAuthor? author,
    String? text,
    DateTime? sentAt,
    ChatMessageStatus? status,
    Map<String, int>? reactions,
    String? replyToMessageId,
    Map<String, Object?>? metadata,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      author: author ?? this.author,
      text: text ?? this.text,
      sentAt: sentAt ?? this.sentAt,
      status: status ?? this.status,
      reactions: reactions ?? this.reactions,
      replyToMessageId: replyToMessageId ?? this.replyToMessageId,
      metadata: metadata ?? this.metadata,
    );
  }
}
