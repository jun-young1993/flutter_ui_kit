import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../tokens/chat_durations.dart';
import '../tokens/chat_radius.dart';
import '../tokens/chat_shadows.dart';

@immutable
class ChatBubbleStyle {
  const ChatBubbleStyle({
    required this.gradient,
    required this.borderColor,
    required this.textStyle,
    required this.radius,
    this.opacity = 0.72,
  });

  final Gradient gradient;
  final Color borderColor;
  final TextStyle textStyle;
  final BorderRadius radius;
  final double opacity;

  ChatBubbleStyle copyWith({
    Gradient? gradient,
    Color? borderColor,
    TextStyle? textStyle,
    BorderRadius? radius,
    double? opacity,
  }) {
    return ChatBubbleStyle(
      gradient: gradient ?? this.gradient,
      borderColor: borderColor ?? this.borderColor,
      textStyle: textStyle ?? this.textStyle,
      radius: radius ?? this.radius,
      opacity: opacity ?? this.opacity,
    );
  }
}

@immutable
class ChatInputBarStyle {
  const ChatInputBarStyle({
    required this.backgroundGradient,
    required this.borderColor,
    required this.textStyle,
    required this.hintStyle,
    required this.radius,
  });

  final Gradient backgroundGradient;
  final Color borderColor;
  final TextStyle textStyle;
  final TextStyle hintStyle;
  final BorderRadius radius;

  ChatInputBarStyle copyWith({
    Gradient? backgroundGradient,
    Color? borderColor,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    BorderRadius? radius,
  }) {
    return ChatInputBarStyle(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      borderColor: borderColor ?? this.borderColor,
      textStyle: textStyle ?? this.textStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      radius: radius ?? this.radius,
    );
  }
}

@immutable
class ChatTypography {
  const ChatTypography({
    required this.message,
    required this.timestamp,
    required this.input,
  });

  final TextStyle message;
  final TextStyle timestamp;
  final TextStyle input;

  ChatTypography copyWith({
    TextStyle? message,
    TextStyle? timestamp,
    TextStyle? input,
  }) {
    return ChatTypography(
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      input: input ?? this.input,
    );
  }
}

@immutable
class ChatTheme extends ThemeExtension<ChatTheme> {
  const ChatTheme({
    required this.blurSigma,
    required this.bubbleOpacity,
    required this.backgroundGradient,
    required this.incomingBubbleStyle,
    required this.outgoingBubbleStyle,
    required this.inputBarStyle,
    required this.shadowStyle,
    required this.animationDurations,
    required this.typography,
  });

  final double blurSigma;
  final double bubbleOpacity;
  final Gradient backgroundGradient;
  final ChatBubbleStyle incomingBubbleStyle;
  final ChatBubbleStyle outgoingBubbleStyle;
  final ChatInputBarStyle inputBarStyle;
  final List<BoxShadow> shadowStyle;
  final ChatDurations animationDurations;
  final ChatTypography typography;

  factory ChatTheme.dark() {
    return const ChatTheme(
      blurSigma: 12,
      bubbleOpacity: 0.68,
      backgroundGradient: LinearGradient(
        colors: <Color>[Color(0xFF121827), Color(0xFF090D16)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      incomingBubbleStyle: ChatBubbleStyle(
        gradient: LinearGradient(
          colors: <Color>[Color(0x332A334A), Color(0x1F3B4158)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderColor: Color(0x337B8DB7),
        textStyle: TextStyle(
          color: Color(0xFFF4F7FF),
          letterSpacing: 0.15,
          height: 1.4,
          fontSize: 15,
        ),
        radius: BorderRadius.all(Radius.circular(ChatRadius.md)),
      ),
      outgoingBubbleStyle: ChatBubbleStyle(
        gradient: LinearGradient(
          colors: <Color>[Color(0x5C4C6DFF), Color(0x332A55E6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderColor: Color(0x6689A3FF),
        textStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          letterSpacing: 0.15,
          height: 1.4,
          fontSize: 15,
        ),
        radius: BorderRadius.all(Radius.circular(ChatRadius.md)),
      ),
      inputBarStyle: ChatInputBarStyle(
        backgroundGradient: LinearGradient(
          colors: <Color>[Color(0x332B334A), Color(0x1E2A3342)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderColor: Color(0x4D8198D6),
        textStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          letterSpacing: 0.15,
          fontSize: 15,
        ),
        hintStyle: TextStyle(
          color: Color(0x99C1CCE8),
          letterSpacing: 0.1,
          fontSize: 14,
        ),
        radius: BorderRadius.all(Radius.circular(ChatRadius.lg)),
      ),
      shadowStyle: ChatShadows.soft,
      animationDurations: ChatDurations(),
      typography: ChatTypography(
        message: TextStyle(
          color: Color(0xFFF7F8FF),
          fontSize: 15,
          letterSpacing: 0.15,
          height: 1.4,
        ),
        timestamp: TextStyle(
          color: Color(0xB3CAD4F2),
          fontSize: 11,
          letterSpacing: 0.3,
          fontFamily: 'monospace',
        ),
        input: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 15,
          letterSpacing: 0.15,
        ),
      ),
    );
  }

  factory ChatTheme.light() {
    return ChatTheme.dark().copyWith(
      blurSigma: 8,
      bubbleOpacity: 0.82,
      backgroundGradient: const LinearGradient(
        colors: <Color>[Color(0xFFF9FBFF), Color(0xFFEFF3FF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      incomingBubbleStyle: ChatTheme.dark().incomingBubbleStyle.copyWith(
        gradient: const LinearGradient(
          colors: <Color>[Color(0xCCFFFFFF), Color(0xB3EEF2FF)],
        ),
        borderColor: const Color(0x66778CB3),
        textStyle: const TextStyle(color: Color(0xFF121826)),
      ),
      outgoingBubbleStyle: ChatTheme.dark().outgoingBubbleStyle.copyWith(
        gradient: const LinearGradient(
          colors: <Color>[Color(0xCC7398FF), Color(0xB35374D1)],
        ),
      ),
      inputBarStyle: ChatTheme.dark().inputBarStyle.copyWith(
        backgroundGradient: const LinearGradient(
          colors: <Color>[Color(0xD9FFFFFF), Color(0xB3EEF2FF)],
        ),
        textStyle: const TextStyle(color: Color(0xFF121826)),
        hintStyle: const TextStyle(color: Color(0x992F3B57)),
      ),
      typography: ChatTheme.dark().typography.copyWith(
        message: const TextStyle(color: Color(0xFF101522), fontSize: 15),
        timestamp: const TextStyle(
          color: Color(0x9929364F),
          fontSize: 11,
          fontFamily: 'monospace',
        ),
        input: const TextStyle(color: Color(0xFF121826), fontSize: 15),
      ),
    );
  }

  @override
  ChatTheme copyWith({
    double? blurSigma,
    double? bubbleOpacity,
    Gradient? backgroundGradient,
    ChatBubbleStyle? incomingBubbleStyle,
    ChatBubbleStyle? outgoingBubbleStyle,
    ChatInputBarStyle? inputBarStyle,
    List<BoxShadow>? shadowStyle,
    ChatDurations? animationDurations,
    ChatTypography? typography,
  }) {
    return ChatTheme(
      blurSigma: blurSigma ?? this.blurSigma,
      bubbleOpacity: bubbleOpacity ?? this.bubbleOpacity,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      incomingBubbleStyle: incomingBubbleStyle ?? this.incomingBubbleStyle,
      outgoingBubbleStyle: outgoingBubbleStyle ?? this.outgoingBubbleStyle,
      inputBarStyle: inputBarStyle ?? this.inputBarStyle,
      shadowStyle: shadowStyle ?? this.shadowStyle,
      animationDurations: animationDurations ?? this.animationDurations,
      typography: typography ?? this.typography,
    );
  }

  @override
  ThemeExtension<ChatTheme> lerp(
    covariant ThemeExtension<ChatTheme>? other,
    double t,
  ) {
    if (other is! ChatTheme) return this;
    return ChatTheme(
      blurSigma: lerpDouble(blurSigma, other.blurSigma, t) ?? blurSigma,
      bubbleOpacity:
          lerpDouble(bubbleOpacity, other.bubbleOpacity, t) ?? bubbleOpacity,
      backgroundGradient: t < 0.5 ? backgroundGradient : other.backgroundGradient,
      incomingBubbleStyle:
          t < 0.5 ? incomingBubbleStyle : other.incomingBubbleStyle,
      outgoingBubbleStyle:
          t < 0.5 ? outgoingBubbleStyle : other.outgoingBubbleStyle,
      inputBarStyle: t < 0.5 ? inputBarStyle : other.inputBarStyle,
      shadowStyle: t < 0.5 ? shadowStyle : other.shadowStyle,
      animationDurations:
          t < 0.5 ? animationDurations : other.animationDurations,
      typography: t < 0.5 ? typography : other.typography,
    );
  }

  static ChatTheme resolve(BuildContext context) {
    return Theme.of(context).extension<ChatTheme>() ?? ChatTheme.dark();
  }
}
