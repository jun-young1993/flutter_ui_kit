import 'package:flutter/widgets.dart';

class ChatInputController extends ChangeNotifier {
  ChatInputController({
    TextEditingController? textController,
    FocusNode? focusNode,
  })  : _textController = textController ?? TextEditingController(),
        _focusNode = focusNode ?? FocusNode() {
    _textController.addListener(_onTextChanged);
  }

  final TextEditingController _textController;
  final FocusNode _focusNode;
  bool _isSending = false;

  TextEditingController get textController => _textController;
  FocusNode get focusNode => _focusNode;
  bool get isSending => _isSending;
  String get text => _textController.text;
  bool get hasText => _textController.text.trim().isNotEmpty;

  void setSending(bool isSending) {
    if (_isSending == isSending) return;
    _isSending = isSending;
    notifyListeners();
  }

  void clear() {
    _textController.clear();
    notifyListeners();
  }

  void focus() => _focusNode.requestFocus();

  void unfocus() => _focusNode.unfocus();

  void _onTextChanged() => notifyListeners();

  @override
  void dispose() {
    _textController
      ..removeListener(_onTextChanged)
      ..dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
