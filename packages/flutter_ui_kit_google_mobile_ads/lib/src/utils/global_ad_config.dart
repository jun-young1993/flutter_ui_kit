import 'package:flutter/foundation.dart';

class GlobalAdConfig {
  // 싱글톤 패턴 적용
  static final GlobalAdConfig _instance = GlobalAdConfig._internal();
  factory GlobalAdConfig() => _instance;
  GlobalAdConfig._internal();

  // 광고 표시 여부를 결정하는 전역 스위치
  final ValueNotifier<bool> isShowAds = ValueNotifier<bool>(true);

  // 전역적으로 광고 끄기/켜기 함수
  void setAdVisibility(bool visible) {
    isShowAds.value = visible;
  }
}