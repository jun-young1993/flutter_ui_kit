import 'package:flutter/foundation.dart';

enum MessageGroupPosition {
  single,
  first,
  middle,
  last,
}

@immutable
class MessageGroupingRule {
  const MessageGroupingRule({
    this.enabled = true,
    this.maxGap = const Duration(minutes: 5),
  });

  final bool enabled;
  final Duration maxGap;
}
