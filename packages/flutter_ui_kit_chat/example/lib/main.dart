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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        extensions: <ThemeExtension<dynamic>>[ChatTheme.dark()],
      ),
      home: const ChatShowcaseScreen(),
    );
  }
}

class ChatShowcaseScreen extends StatefulWidget {
  const ChatShowcaseScreen({super.key});

  @override
  State<ChatShowcaseScreen> createState() => _ChatShowcaseScreenState();
}

class _ChatShowcaseScreenState extends State<ChatShowcaseScreen> {
  late final ChatInputController _inputController = ChatInputController();

  final List<ChatMessage> _messages = <ChatMessage>[
    ChatMessage(
      id: 'msg_1',
      author: const ChatAuthor(id: 'assistant', displayName: 'Aiko'),
      text: 'This package is optimized for premium production chat surfaces.',
      sentAt: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    ChatMessage(
      id: 'msg_2',
      author: const ChatAuthor(
        id: 'you',
        displayName: 'You',
        role: ChatAuthorRole.currentUser,
      ),
      text: 'Looks great. Can we customize reactions and long-press actions?',
      sentAt: DateTime.now().subtract(const Duration(minutes: 4)),
      status: ChatMessageStatus.read,
    ),
  ];

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String text) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    setState(() {
      _messages.add(
        ChatMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          author: const ChatAuthor(
            id: 'you',
            displayName: 'You',
            role: ChatAuthorRole.currentUser,
          ),
          text: text,
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
        inputController: _inputController,
        onSendPressed: _sendMessage,
        showTypingIndicator: true,
        groupMessages: true,
        onSwipeToReply: (ChatMessage message) {
          _inputController.textController.text = '@${message.author.displayName} ';
          _inputController.focus();
        },
        longPressActionSheetBuilder: (BuildContext context, ChatMessage message) async {
          await showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SafeArea(
                child: ListTile(
                  title: const Text('Copy message'),
                  onTap: () => Navigator.of(context).pop(),
                ),
              );
            },
          );
        },
        reactionOverlayBuilder: (BuildContext context, ChatMessage message) {
          return const DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xCC1A2236),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text('👍 2', style: TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }
}
