import 'package:flutter/material.dart';

import '../../controllers/chat_input_controller.dart';
import '../../models/chat_message.dart';
import '../../models/chat_message_grouping.dart';
import '../../models/chat_performance_mode.dart';
import '../../theme/chat_theme.dart';
import '../../tokens/chat_spacing.dart';
import '../animations/chat_motion.dart';
import '../components/chat_input_bar.dart';
import '../components/scroll_to_bottom_button.dart';
import '../presentation/chat_builders.dart';
import 'chat_message_list.dart';

class ChatScaffold extends StatefulWidget {
  const ChatScaffold({
    super.key,
    required this.messages,
    required this.inputController,
    required this.onSendPressed,
    this.onSwipeToReply,
    this.bubbleBuilder = kDefaultChatBubbleBuilder,
    this.avatarBuilder = kDefaultChatAvatarBuilder,
    this.dateSeparatorBuilder = kDefaultDateSeparatorBuilder,
    this.messageStatusBuilder,
    this.reactionOverlayBuilder,
    this.typingIndicatorBuilder,
    this.longPressActionSheetBuilder,
    this.groupMessages = true,
    this.performanceMode = ChatPerformanceMode.off,
    this.motion = const ChatMotionData(),
    this.chatTheme,
    this.showTypingIndicator = false,
    this.listPadding = const EdgeInsets.all(ChatSpacing.x2),
    this.inputPlaceholder = 'Type a message',
  });

  final List<ChatMessage> messages;
  final ChatInputController inputController;
  final SendMessageCallback onSendPressed;
  final SwipeToReplyCallback? onSwipeToReply;
  final ChatBubbleBuilder bubbleBuilder;
  final ChatAvatarBuilder avatarBuilder;
  final DateSeparatorBuilder dateSeparatorBuilder;
  final MessageStatusBuilder? messageStatusBuilder;
  final ReactionOverlayBuilder? reactionOverlayBuilder;
  final TypingIndicatorBuilder? typingIndicatorBuilder;
  final LongPressActionSheetBuilder? longPressActionSheetBuilder;
  final bool groupMessages;
  final ChatPerformanceMode performanceMode;
  final ChatMotionData motion;
  final ChatTheme? chatTheme;
  final bool showTypingIndicator;
  final EdgeInsets listPadding;
  final String inputPlaceholder;

  @override
  State<ChatScaffold> createState() => _ChatScaffoldState();
}

class _ChatScaffoldState extends State<ChatScaffold> {
  late final ScrollController _scrollController = ScrollController()
    ..addListener(_onScroll);
  bool _showScrollToBottom = false;

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final bool shouldShow =
        _scrollController.position.pixels <
        _scrollController.position.maxScrollExtent - 280;
    if (_showScrollToBottom == shouldShow) return;
    setState(() => _showScrollToBottom = shouldShow);
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: ChatTheme.resolve(context).animationDurations.medium,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void didUpdateWidget(covariant ChatScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.messages.length != widget.messages.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ChatTheme effectiveTheme =
        widget.chatTheme ?? ChatTheme.resolve(context);
    return Theme(
      data: Theme.of(
        context,
      ).copyWith(extensions: <ThemeExtension<dynamic>>[effectiveTheme]),
      child: Builder(
        builder: (BuildContext context) {
          return Material(
            color: Colors.transparent,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: effectiveTheme.backgroundGradient,
              ),
              child: SafeArea(
                bottom: true,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          ChatMessageList(
                            messages: widget.messages,
                            scrollController: _scrollController,
                            bubbleBuilder: widget.bubbleBuilder,
                            avatarBuilder: widget.avatarBuilder,
                            dateSeparatorBuilder: widget.dateSeparatorBuilder,
                            messageStatusBuilder: widget.messageStatusBuilder,
                            reactionOverlayBuilder:
                                widget.reactionOverlayBuilder,
                            typingIndicatorBuilder:
                                widget.typingIndicatorBuilder,
                            longPressActionSheetBuilder:
                                widget.longPressActionSheetBuilder,
                            onSwipeToReply: widget.onSwipeToReply,
                            groupingRule: MessageGroupingRule(
                              enabled: widget.groupMessages,
                            ),
                            performanceMode: widget.performanceMode,
                            motion: widget.motion,
                            showTypingIndicator: widget.showTypingIndicator,
                            padding: widget.listPadding,
                          ),
                          ScrollToBottomButton(
                            visible: _showScrollToBottom,
                            onPressed: _scrollToBottom,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        ChatSpacing.x2,
                        ChatSpacing.x1,
                        ChatSpacing.x2,
                        ChatSpacing.x2,
                      ),
                      child: ChatInputBar(
                        controller: widget.inputController,
                        onSendPressed: (String text) async {
                          await widget.onSendPressed(
                            widget.inputController.text,
                          );
                          _scrollToBottom();
                        },
                        motion: widget.motion,
                        placeholder: widget.inputPlaceholder,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
