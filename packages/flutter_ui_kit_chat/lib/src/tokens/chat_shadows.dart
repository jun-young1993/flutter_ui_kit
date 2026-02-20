import 'package:flutter/material.dart';

abstract final class ChatShadows {
  static const List<BoxShadow> soft = <BoxShadow>[
    BoxShadow(
      color: Color(0x22000000),
      blurRadius: 14,
      offset: Offset(0, 8),
    ),
    BoxShadow(
      color: Color(0x12000000),
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> glow = <BoxShadow>[
    BoxShadow(
      color: Color(0x4D7D9BFF),
      blurRadius: 18,
      offset: Offset(0, 0),
    ),
  ];
}
