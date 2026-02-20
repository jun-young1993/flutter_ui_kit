import 'package:flutter/material.dart';

import '../../models/chat_message.dart';
import '../../models/chat_message_grouping.dart';
import '../../models/chat_performance_mode.dart';
import '../../theme/chat_theme.dart';
import '../../tokens/chat_spacing.dart';
import '../animations/chat_motion.dart';
import '../components/chat_bubble.dart';
import '../components/typing_indicator.dart';
import '../presentation/chat_builders.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({
    super.key,
    required this.messages,
    this.scrollController,
    this.bubbleBuilder = kDefaultChatBubbleBuilder,
    this.avatarBuilder = kDefaultChatAvatarBuilder,
    this.dateSeparatorBuilder = kDefaultDateSeparatorBuilder,
    this.messageStatusBuilder,
    this.reactionOverlayBuilder,
    this.typingIndicatorBuilder,
    this.longPressActionSheetBuilder,
    this.onSwipeToReply,
    this.motion = const ChatMotionData(),
    this.groupingRule = const MessageGroupingRule(),
    this.performanceMode = ChatPerformanceMode.off,
    this.showDateSeparators = true,
    this.showTypingIndicator = false,
    this.padding = const EdgeInsets.all(ChatSpacing.x2),
    this.itemExtentBuilder,
    this.physics,
    this.reverse = false,
  });

  final List<ChatMessage> messages;
  final ScrollController? scrollController;
  final ChatBubbleBuilder bubbleBuilder;
  final ChatAvatarBuilder avatarBuilder;
  final DateSeparatorBuilder dateSeparatorBuilder;
  final MessageStatusBuilder? messageStatusBuilder;
  final ReactionOverlayBuilder? reactionOverlayBuilder;
  final TypingIndicatorBuilder? typingIndicatorBuilder;
  final LongPressActionSheetBuilder? longPressActionSheetBuilder;
  final SwipeToReplyCallback? onSwipeToReply;
  final MessageGroupingRule groupingRule;
  final ChatMotionData motion;
  final ChatPerformanceMode performanceMode;
  final bool showDateSeparators;
  final bool showTypingIndicator;
  final EdgeInsetsGeometry padding;
  final ChatItemExtentBuilder? itemExtentBuilder;
  final ScrollPhysics? physics;
  final bool reverse;

  MessageGroupPosition _groupPositionFor(int index) {
    if (!groupingRule.enabled) return MessageGroupPosition.single;
    final ChatMessage current = messages[index];

    bool withPrevious = false;
    if (index > 0) {
      final ChatMessage previous = messages[index - 1];
      withPrevious = previous.author.id == current.author.id &&
          current.sentAt.difference(previous.sentAt).abs() <= groupingRule.maxGap;
    }

    bool withNext = false;
    if (index < messages.length - 1) {
      final ChatMessage next = messages[index + 1];
      withNext = next.author.id == current.author.id &&
          next.sentAt.difference(current.sentAt).abs() <= groupingRule.maxGap;
    }

    if (!withPrevious && !withNext) return MessageGroupPosition.single;
    if (!withPrevious && withNext) return MessageGroupPosition.first;
    if (withPrevious && withNext) return MessageGroupPosition.middle;
    return MessageGroupPosition.last;
  }

  bool _isDateBoundary(int index) {
    if (!showDateSeparators || index == 0) return index == 0;
    final DateTime prev = messages[index - 1].sentAt;
    final DateTime current = messages[index].sentAt;
    return prev.year != current.year ||
        prev.month != current.month ||
        prev.day != current.day;
  }

  @override
  Widget build(BuildContext context) {
    final ChatTheme theme = ChatTheme.resolve(context);
    final int extraRows = showTypingIndicator ? 1 : 0;

    return ListView.builder(
      controller: scrollController,
      reverse: reverse,
      physics: physics ??
          (motion.enableSmoothScroll
              ? const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())
              : const ClampingScrollPhysics()),
      padding: padding,
      itemCount: messages.length + extraRows,
      itemBuilder: (BuildContext context, int index) {
        if (index >= messages.length) {
          return typingIndicatorBuilder?.call(context) ?? const TypingIndicator();
        }
        final ChatMessage message = messages[index];
        final MessageGroupPosition groupPosition = _groupPositionFor(index);
        final bool isBoundary = _isDateBoundary(index);

        Widget content = _MessageRow(
          key: ValueKey<String>('chat_message_${message.id}'),
          message: message,
          groupPosition: groupPosition,
          bubbleBuilder: bubbleBuilder,
          avatarBuilder: avatarBuilder,
          reactionOverlayBuilder: reactionOverlayBuilder,
          messageStatusBuilder: messageStatusBuilder,
          longPressActionSheetBuilder: longPressActionSheetBuilder,
          onSwipeToReply: onSwipeToReply,
          motion: motion,
          duration: theme.animationDurations.medium,
        );

        if (!motion.enableMessageEntry) {
          if (itemExtentBuilder != null) {
            final double? itemExtent = itemExtentBuilder!(index, message);
            if (itemExtent != null) {
              content = SizedBox(height: itemExtent, child: content);
            }
          }
          return _wrapDate(content, context, isBoundary, message.sentAt);
        }

        content = TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: theme.animationDurations.medium,
          curve: motion.curve,
          builder: (BuildContext context, double t, Widget? child) {
            return Opacity(
              opacity: t,
              child: Transform.translate(
                offset: Offset(0, (1 - t) * 20),
                child: child,
              ),
            );
          },
          child: content,
        );
        if (itemExtentBuilder != null) {
          final double? itemExtent = itemExtentBuilder!(index, message);
          if (itemExtent != null) {
            content = SizedBox(height: itemExtent, child: content);
          }
        }
        return _wrapDate(content, context, isBoundary, message.sentAt);
      },
    );
  }

  Widget _wrapDate(
    Widget child,
    BuildContext context,
    bool isBoundary,
    DateTime sentAt,
  ) {
    if (!isBoundary) return child;
    return Column(
      children: <Widget>[
        dateSeparatorBuilder(context, sentAt),
        child,
      ],
    );
  }
}

class _MessageRow extends StatelessWidget {
  const _MessageRow({
    super.key,
    required this.message,
    required this.groupPosition,
    required this.bubbleBuilder,
    required this.avatarBuilder,
    required this.reactionOverlayBuilder,
    required this.messageStatusBuilder,
    required this.longPressActionSheetBuilder,
    required this.onSwipeToReply,
    required this.motion,
    required this.duration,
  });

  final ChatMessage message;
  final MessageGroupPosition groupPosition;
  final ChatBubbleBuilder bubbleBuilder;
  final ChatAvatarBuilder avatarBuilder;
  final ReactionOverlayBuilder? reactionOverlayBuilder;
  final MessageStatusBuilder? messageStatusBuilder;
  final LongPressActionSheetBuilder? longPressActionSheetBuilder;
  final SwipeToReplyCallback? onSwipeToReply;
  final ChatMotionData motion;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final Widget baseBubble = bubbleBuilder(context, message, groupPosition);
    final Widget bubble = baseBubble is ChatBubble
        ? ChatBubble(
            message,
            groupPosition,
            key: baseBubble.key,
            reactionOverlay: reactionOverlayBuilder?.call(context, message),
            statusIndicator: messageStatusBuilder?.call(context, message),
            onLongPress: longPressActionSheetBuilder == null
                ? null
                : () => longPressActionSheetBuilder!(context, message),
          )
        : baseBubble;

    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          if (!message.author.isCurrentUser) ...<Widget>[
            avatarBuilder(context, message, groupPosition),
            const SizedBox(width: ChatSpacing.x1),
          ],
          Expanded(child: bubble),
          if (message.author.isCurrentUser) ...<Widget>[
            const SizedBox(width: ChatSpacing.x1),
            avatarBuilder(context, message, groupPosition),
          ],
        ],
      ),
    );

    if (onSwipeToReply != null) {
      row = Dismissible(
        key: ValueKey<String>('reply_swipe_${message.id}'),
        direction: message.author.isCurrentUser
            ? DismissDirection.endToStart
            : DismissDirection.startToEnd,
        resizeDuration: null,
        movementDuration: duration,
        confirmDismiss: (_) async {
          onSwipeToReply!(message);
          return false;
        },
        background: const SizedBox.shrink(),
        child: row,
      );
    }

    if (!motion.enableGroupTransitions) return row;
    return AnimatedContainer(
      duration: duration,
      curve: Curves.easeOutCubic,
      child: row,
    );
  }
}
