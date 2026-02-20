import 'package:flutter/material.dart';

import '../../models/chat_message_status.dart';

class MessageStatusIndicator extends StatelessWidget {
  const MessageStatusIndicator({
    super.key,
    required this.status,
    this.color,
    this.size = 12,
  });

  final ChatMessageStatus status;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = color ?? Colors.white70;
    final IconData icon = switch (status) {
      ChatMessageStatus.sending => Icons.schedule_rounded,
      ChatMessageStatus.sent => Icons.check_rounded,
      ChatMessageStatus.delivered => Icons.done_all_rounded,
      ChatMessageStatus.read => Icons.done_all_rounded,
      ChatMessageStatus.failed => Icons.error_outline_rounded,
    };

    return Icon(
      icon,
      size: size,
      color: status == ChatMessageStatus.read
          ? const Color(0xFF9CC3FF)
          : effectiveColor,
      semanticLabel: 'Message status: $status',
    );
  }
}
