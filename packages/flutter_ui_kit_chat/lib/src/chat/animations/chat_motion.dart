import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

import '../../tokens/chat_durations.dart';

@immutable
class ChatMotionData {
  const ChatMotionData({
    this.enableMessageEntry = true,
    this.enableSendButtonMicroInteraction = true,
    this.enableInputFocusGlow = true,
    this.enableGroupTransitions = true,
    this.enableSmoothScroll = true,
    this.curve = Curves.easeOutCubic,
    this.entryOffsetY = 0.06,
  });

  final bool enableMessageEntry;
  final bool enableSendButtonMicroInteraction;
  final bool enableInputFocusGlow;
  final bool enableGroupTransitions;
  final bool enableSmoothScroll;
  final Curve curve;
  final double entryOffsetY;
}

@immutable
class MessageAnimationSpec {
  const MessageAnimationSpec({
    this.motion = const ChatMotionData(),
    this.durations = const ChatDurations(),
  });

  final ChatMotionData motion;
  final ChatDurations durations;
}
