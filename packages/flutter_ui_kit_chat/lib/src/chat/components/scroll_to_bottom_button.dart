import 'package:flutter/material.dart';

import '../../theme/chat_theme.dart';
import '../../tokens/chat_radius.dart';
import '../../tokens/chat_spacing.dart';
import '../../utils/glass_container.dart';

class ScrollToBottomButton extends StatelessWidget {
  const ScrollToBottomButton({
    super.key,
    required this.onPressed,
    this.visible = true,
  });

  final VoidCallback onPressed;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    final ChatTheme theme = ChatTheme.resolve(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: IgnorePointer(
        ignoring: !visible,
        child: AnimatedOpacity(
          duration: theme.animationDurations.fast,
          opacity: visible ? 1 : 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: ChatSpacing.x3),
            child: GlassContainer(
              blurSigma: theme.blurSigma * 0.8,
              borderRadius:
                  const BorderRadius.all(Radius.circular(ChatRadius.md)),
              padding: EdgeInsets.zero,
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: theme.typography.timestamp.color,
                ),
                tooltip: 'Scroll to newest message',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
