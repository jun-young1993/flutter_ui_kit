import 'package:flutter/material.dart';

/// 커스텀 위젯을 섹션 아이템으로 삽입하기 위한 래퍼 타일.
class CustomWidgetTile extends StatelessWidget {
  const CustomWidgetTile({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
