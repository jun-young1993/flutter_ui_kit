import 'package:flutter/material.dart';

import '../../models/chat_message.dart';
import '../../models/chat_message_grouping.dart';
import '../../theme/chat_theme.dart';
import '../../tokens/chat_spacing.dart';
import '../../utils/glass_container.dart';
import 'message_status_indicator.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
    this.message,
    this.groupPosition, {
    super.key,
    this.reactionOverlay,
    this.statusIndicator,
    this.onLongPress,
  });

  final ChatMessage message;
  final MessageGroupPosition groupPosition;
  final Widget? reactionOverlay;
  final Widget? statusIndicator;
  final VoidCallback? onLongPress;

  BorderRadius _resolveRadius(ChatBubbleStyle style) {
    switch (groupPosition) {
      case MessageGroupPosition.single:
        return style.radius;
      case MessageGroupPosition.first:
        return style.radius.copyWith(
          bottomLeft: const Radius.circular(8),
          bottomRight: const Radius.circular(8),
        );
      case MessageGroupPosition.middle:
        return const BorderRadius.all(Radius.circular(8));
      case MessageGroupPosition.last:
        return style.radius.copyWith(
          topLeft: const Radius.circular(8),
          topRight: const Radius.circular(8),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ChatTheme theme = ChatTheme.resolve(context);
    final bool isCurrentUser = message.author.isCurrentUser;
    final ChatBubbleStyle style =
        isCurrentUser ? theme.outgoingBubbleStyle : theme.incomingBubbleStyle;

    return Semantics(
      label:
          '${isCurrentUser ? 'Outgoing' : 'Incoming'} message from ${message.author.displayName}',
      child: Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: ChatSpacing.x1 / 2),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: GestureDetector(
              onLongPress: onLongPress,
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  GlassContainer(
                    blurSigma: theme.blurSigma,
                    opacity: style.opacity * theme.bubbleOpacity,
                    borderRadius: _resolveRadius(style),
                    backgroundGradient: style.gradient,
                    boxShadow: theme.shadowStyle,
                    padding: const EdgeInsets.symmetric(
                      horizontal: ChatSpacing.x2,
                      vertical: ChatSpacing.x1 + 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(message.text, style: style.textStyle),
                        const SizedBox(height: ChatSpacing.x1),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '${message.sentAt.hour.toString().padLeft(2, '0')}:${message.sentAt.minute.toString().padLeft(2, '0')}',
                              style: theme.typography.timestamp,
                            ),
                            const SizedBox(width: ChatSpacing.x1),
                            statusIndicator ??
                                MessageStatusIndicator(status: message.status),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (reactionOverlay != null)
                    PositionedDirectional(
                      bottom: -16,
                      end: isCurrentUser ? 10 : null,
                      start: isCurrentUser ? null : 10,
                      child: reactionOverlay!,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
