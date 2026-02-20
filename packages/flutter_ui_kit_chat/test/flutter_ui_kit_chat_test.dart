import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit_chat/flutter_ui_kit_chat.dart';

void main() {
  testWidgets('ChatScaffold renders and sends message', (WidgetTester tester) async {
    final ChatInputController controller = ChatInputController();
    final List<ChatMessage> messages = <ChatMessage>[
      ChatMessage(
        id: '1',
        author: const ChatAuthor(id: 'other', displayName: 'Alex'),
        text: 'Hello',
        sentAt: DateTime(2026, 2, 20, 10, 30),
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark().copyWith(
          extensions: <ThemeExtension<dynamic>>[ChatTheme.dark()],
        ),
        home: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return ChatScaffold(
              messages: messages,
              inputController: controller,
              onSendPressed: (String text) async {
                setState(() {
                  messages.add(
                    ChatMessage(
                      id: '2',
                      author: const ChatAuthor(
                        id: 'me',
                        displayName: 'Me',
                        role: ChatAuthorRole.currentUser,
                      ),
                      text: text,
                      sentAt: DateTime(2026, 2, 20, 10, 31),
                    ),
                  );
                });
              },
            );
          },
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Ship it');
    await tester.tap(find.byIcon(Icons.send_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Ship it'), findsOneWidget);
    controller.dispose();
  });

  testWidgets('DateSeparator is visible for boundary days', (WidgetTester tester) async {
    final List<ChatMessage> messages = <ChatMessage>[
      ChatMessage(
        id: '1',
        author: const ChatAuthor(id: 'a', displayName: 'A'),
        text: 'Day 1',
        sentAt: DateTime(2026, 2, 19, 23, 50),
      ),
      ChatMessage(
        id: '2',
        author: const ChatAuthor(id: 'a', displayName: 'A'),
        text: 'Day 2',
        sentAt: DateTime(2026, 2, 20, 0, 5),
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark().copyWith(
          extensions: <ThemeExtension<dynamic>>[ChatTheme.dark()],
        ),
        home: ChatMessageList(messages: messages),
      ),
    );

    expect(find.byType(DateSeparator), findsWidgets);
  });
}
