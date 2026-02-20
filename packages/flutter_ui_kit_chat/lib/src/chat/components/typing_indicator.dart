import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/chat_theme.dart';
import '../../tokens/chat_spacing.dart';
import '../../utils/glass_container.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key, this.label = 'Typing...'});

  final String label;

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ChatTheme theme = ChatTheme.resolve(context);
    return Semantics(
      liveRegion: true,
      label: widget.label,
      child: GlassContainer(
        blurSigma: theme.blurSigma * 0.65,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ChatSpacing.x1,
            vertical: ChatSpacing.x1 / 2,
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: List<Widget>.generate(3, (int index) {
                  final double phase =
                      ((_controller.value + (index * 0.2)) % 1.0) * 3.14159 * 2;
                  final double opacity =
                      0.35 + (0.65 * (0.5 + 0.5 * math.sin(phase)));
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: CircleAvatar(
                      radius: 3.5,
                      backgroundColor: Colors.white.withValues(alpha: opacity),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
