import 'package:flutter/material.dart';

import '../../controllers/chat_input_controller.dart';
import '../../theme/chat_theme.dart';
import '../../tokens/chat_spacing.dart';
import '../../utils/glass_container.dart';
import '../animations/chat_motion.dart';

typedef SendMessageCallback = Future<void> Function(String text);

class ChatInputBar extends StatelessWidget {
  const ChatInputBar({
    super.key,
    required this.controller,
    required this.onSendPressed,
    this.motion = const ChatMotionData(),
    this.placeholder = 'Type a message',
    this.trailing,
  });

  final ChatInputController controller;
  final SendMessageCallback onSendPressed;
  final ChatMotionData motion;
  final String placeholder;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final ChatTheme theme = ChatTheme.resolve(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? _) {
        final bool canSend = controller.hasText && !controller.isSending;
        final Widget sendButton = IconButton(
          onPressed: canSend
              ? () async {
                  controller.setSending(true);
                  try {
                    await onSendPressed(controller.text.trim());
                    controller.clear();
                  } finally {
                    controller.setSending(false);
                  }
                }
              : null,
          icon: const Icon(Icons.send_rounded),
          tooltip: 'Send message',
        );

        return Semantics(
          textField: true,
          label: 'Chat input',
          child: GlassContainer(
            blurSigma: theme.blurSigma * 0.9,
            opacity: 0.9,
            borderRadius: theme.inputBarStyle.radius,
            backgroundGradient: theme.inputBarStyle.backgroundGradient,
            boxShadow: motion.enableInputFocusGlow && controller.focusNode.hasFocus
                ? const <BoxShadow>[
                    BoxShadow(
                      color: Color(0x4D79A4FF),
                      blurRadius: 20,
                      offset: Offset(0, 0),
                    ),
                  ]
                : theme.shadowStyle,
            padding: const EdgeInsets.symmetric(horizontal: ChatSpacing.x1),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controller.textController,
                    focusNode: controller.focusNode,
                    maxLines: 6,
                    minLines: 1,
                    style: theme.inputBarStyle.textStyle,
                    decoration: InputDecoration(
                      hintText: placeholder,
                      hintStyle: theme.inputBarStyle.hintStyle,
                      isDense: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (trailing case final Widget value) value,
                motion.enableSendButtonMicroInteraction
                    ? TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 1, end: canSend ? 1.0 : 0.92),
                        duration: theme.animationDurations.fast,
                        curve: Curves.easeOutCubic,
                        builder: (BuildContext context, double scale, Widget? child) {
                          return Transform.scale(scale: scale, child: child);
                        },
                        child: sendButton,
                      )
                    : sendButton,
              ],
            ),
          ),
        );
      },
    );
  }
}
