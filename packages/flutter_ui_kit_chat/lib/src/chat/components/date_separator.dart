import 'package:flutter/material.dart';

import '../../theme/chat_theme.dart';
import '../../tokens/chat_radius.dart';
import '../../tokens/chat_spacing.dart';
import '../../utils/glass_container.dart';

class DateSeparator extends StatelessWidget {
  const DateSeparator({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final ChatTheme chatTheme = ChatTheme.resolve(context);
    final String label =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ChatSpacing.x2),
        child: GlassContainer(
          blurSigma: chatTheme.blurSigma * 0.65,
          opacity: 0.85,
          borderRadius: const BorderRadius.all(Radius.circular(ChatRadius.sm)),
          child: Text(
            label,
            style: chatTheme.typography.timestamp,
            textDirection: Directionality.of(context),
          ),
        ),
      ),
    );
  }
}
