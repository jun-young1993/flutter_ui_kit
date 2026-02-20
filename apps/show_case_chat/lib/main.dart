import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_chat/flutter_ui_kit_chat.dart';

void main() {
  runApp(const ShowcaseApp());
}

class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[ChatTheme.dark()],
      ),
      home: const ShowcaseHome(),
    );
  }
}

class ShowcaseHome extends StatefulWidget {
  const ShowcaseHome({super.key});

  @override
  State<ShowcaseHome> createState() => _ShowcaseHomeState();
}

class _ShowcaseHomeState extends State<ShowcaseHome> {
  late final ChatInputController _controller = ChatInputController();
  final List<ChatMessage> _messages = <ChatMessage>[
    ChatMessage(
      id: '1',
      author: const ChatAuthor(id: 'assistant', displayName: 'Aiko'),
      text: 'Welcome to flutter_ui_kit_chat showcase.',
      sentAt: DateTime.now().subtract(const Duration(minutes: 4)),
      status: ChatMessageStatus.read,
    ),
    ChatMessage(
      id: '2',
      author: const ChatAuthor(
        id: 'you',
        displayName: 'You',
        role: ChatAuthorRole.currentUser,
      ),
      text: 'Looks premium. Can we customize builders?',
      sentAt: DateTime.now().subtract(const Duration(minutes: 3)),
      status: ChatMessageStatus.read,
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _send(String text) async {
    if (text.trim().isEmpty) return;
    setState(() {
      _messages.add(
        ChatMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          author: const ChatAuthor(
            id: 'you',
            displayName: 'You',
            role: ChatAuthorRole.currentUser,
          ),
          text: text.trim(),
          sentAt: DateTime.now(),
          status: ChatMessageStatus.sent,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatScaffold(
        messages: _messages,
        inputController: _controller,
        onSendPressed: _send,
        groupMessages: true,
        performanceMode: ChatPerformanceMode.low,
        showTypingIndicator: false,
      ),
    );
  }
}
