import 'package:flutter/painting.dart';

abstract final class ChatRadius {
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;

  static const Radius roundedSmall = Radius.circular(sm);
  static const Radius roundedMedium = Radius.circular(md);
  static const Radius roundedLarge = Radius.circular(lg);
}
