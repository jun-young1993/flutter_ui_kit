import 'package:flutter/widgets.dart';

/// 설정 화면의 섹션 하나를 표현하는 데이터 모델.
///
/// [title]은 섹션 헤더 텍스트이며 생략 가능하다.
/// [items]는 해당 섹션에 표시할 위젯 목록이다.
class SettingSection {
  const SettingSection({
    this.title,
    required this.items,
  });

  final String? title;
  final List<Widget> items;
}
