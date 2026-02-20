# flutter_ui_kit_chat

Premium glassmorphism-first chat UI kit for Flutter.

`flutter_ui_kit_chat` is a publishable, backend-agnostic UI library designed for teams that need a scalable chat surface with strong customization hooks, dark-mode-first visuals, and production performance.

## Features

- Clean library architecture with `lib/src` internals and a single public barrel.
- `ChatTheme` (`ThemeExtension`) with dark/light factories and tokenized design primitives.
- Glassmorphism utility (`GlassContainer`) with configurable blur and performance fallback.
- Slot-based component customization:
  - `bubbleBuilder`
  - `avatarBuilder`
  - `reactionOverlayBuilder`
  - `longPressActionSheetBuilder`
  - `typingIndicatorBuilder`
- Builder-driven message list with grouping, date separators, swipe-to-reply hooks, and status rendering.
- Zero dependency on Bloc/Riverpod/Provider.

## Quick start

```dart
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_chat/flutter_ui_kit_chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatInputController inputController = ChatInputController();
  final List<ChatMessage> messages = <ChatMessage>[
    ChatMessage(
      id: '1',
      author: const ChatAuthor(id: 'u2', displayName: 'Alex'),
      text: 'Welcome to the premium chat kit.',
      sentAt: DateTime.now().subtract(const Duration(minutes: 3)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[ChatTheme.dark()],
      ),
      home: Scaffold(
        body: ChatScaffold(
          messages: messages,
          inputController: inputController,
          onSendPressed: (String text) async {
            setState(() {
              messages.add(
                ChatMessage(
                  id: DateTime.now().microsecondsSinceEpoch.toString(),
                  author: const ChatAuthor(
                    id: 'u1',
                    displayName: 'You',
                    role: ChatAuthorRole.currentUser,
                  ),
                  text: text,
                  sentAt: DateTime.now(),
                ),
              );
            });
          },
          groupMessages: true,
          performanceMode: ChatPerformanceMode.low,
        ),
      ),
    );
  }
}
```

## Public API

Import only:

```dart
import 'package:flutter_ui_kit_chat/flutter_ui_kit_chat.dart';
```

Everything in `lib/src` is intentionally internal and may change.

## Performance notes

- `ChatMessageList` uses lazy rendering (`ListView.builder`) and keyed message rows.
- `performanceMode` lets you degrade expensive blur paths for lower-end devices.
- Animation features are opt-in via `ChatMotionData`.
- Message rendering is builder-driven and scoped to avoid whole-list rebuilds.

## Run showcase app

This package is a UI library, so run it through the monorepo showcase app:

```bash
cd apps/show_case
flutter pub get
flutter run
```

If you run from the repository root:

```bash
flutter pub get apps/show_case
flutter run -t apps/show_case/lib/main.dart
```
