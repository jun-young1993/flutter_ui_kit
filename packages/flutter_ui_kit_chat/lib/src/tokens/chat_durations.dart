import 'package:flutter/foundation.dart';

@immutable
class ChatDurations {
  const ChatDurations({
    this.fast = const Duration(milliseconds: 200),
    this.medium = const Duration(milliseconds: 240),
    this.slow = const Duration(milliseconds: 300),
  });

  final Duration fast;
  final Duration medium;
  final Duration slow;

  ChatDurations copyWith({
    Duration? fast,
    Duration? medium,
    Duration? slow,
  }) {
    return ChatDurations(
      fast: fast ?? this.fast,
      medium: medium ?? this.medium,
      slow: slow ?? this.slow,
    );
  }
}
