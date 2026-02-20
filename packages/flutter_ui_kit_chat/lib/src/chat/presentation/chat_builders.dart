import 'package:flutter/widgets.dart';

import '../../models/chat_message.dart';
import '../../models/chat_message_grouping.dart';
import '../components/chat_avatar.dart';
import '../components/chat_bubble.dart';
import '../components/date_separator.dart';

typedef ChatBubbleBuilder = Widget Function(
  BuildContext context,
  ChatMessage message,
  MessageGroupPosition groupPosition,
);

typedef ChatAvatarBuilder = Widget Function(
  BuildContext context,
  ChatMessage message,
  MessageGroupPosition groupPosition,
);

typedef DateSeparatorBuilder = Widget Function(
  BuildContext context,
  DateTime date,
);

typedef MessageStatusBuilder = Widget Function(
  BuildContext context,
  ChatMessage message,
);

typedef ReactionOverlayBuilder = Widget Function(
  BuildContext context,
  ChatMessage message,
);

typedef LongPressActionSheetBuilder = Future<void> Function(
  BuildContext context,
  ChatMessage message,
);

typedef SwipeToReplyCallback = void Function(ChatMessage message);

typedef ChatItemExtentBuilder = double? Function(int index, ChatMessage message);

typedef TypingIndicatorBuilder = Widget Function(BuildContext context);

Widget kDefaultChatBubbleBuilder(
  BuildContext context,
  ChatMessage message,
  MessageGroupPosition groupPosition,
) {
  return ChatBubble(message, groupPosition);
}

Widget kDefaultChatAvatarBuilder(
  BuildContext context,
  ChatMessage message,
  MessageGroupPosition groupPosition,
) {
  return ChatAvatar(
    message: message,
    groupPosition: groupPosition,
  );
}

Widget kDefaultDateSeparatorBuilder(BuildContext context, DateTime date) {
  return DateSeparator(date: date);
}
