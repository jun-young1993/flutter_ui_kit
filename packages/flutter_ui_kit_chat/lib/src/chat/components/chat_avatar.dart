import 'package:flutter/material.dart';

import '../../models/chat_message.dart';
import '../../models/chat_message_grouping.dart';

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({
    super.key,
    required this.message,
    required this.groupPosition,
    this.size = 30,
  });

  final ChatMessage message;
  final MessageGroupPosition groupPosition;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (message.author.isCurrentUser) return SizedBox(width: size, height: size);
    final bool hideForGrouped = groupPosition == MessageGroupPosition.middle ||
        groupPosition == MessageGroupPosition.first;
    if (hideForGrouped) return SizedBox(width: size, height: size);

    return Semantics(
      label: '${message.author.displayName} avatar',
      child: CircleAvatar(
        radius: size / 2,
        backgroundImage:
            message.author.avatarUrl == null ? null : NetworkImage(message.author.avatarUrl!),
        child: message.author.avatarUrl == null
            ? Text(message.author.displayName.substring(0, 1).toUpperCase())
            : null,
      ),
    );
  }
}
