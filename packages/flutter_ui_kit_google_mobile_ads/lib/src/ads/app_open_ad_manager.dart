import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../utils/global_ad_config.dart';

/// App Open 광고 싱글턴 매니저.
///
/// - [configure] 호출 시 광고 ID 설정 + 라이프사이클 감지가 자동으로 시작된다.
/// - 앱 포그라운드 복귀 시 자동으로 광고를 표시한다.
/// - 광고는 로드 후 4시간이 지나면 만료 처리되어 재로드된다.
/// - 이미 광고가 표시 중이면 중복 노출하지 않는다.
class AppOpenAdManager with WidgetsBindingObserver {
  AppOpenAdManager._();
  static final AppOpenAdManager instance = AppOpenAdManager._();

  AppOpenAd? _ad;
  bool _isShowingAd = false;
  DateTime? _loadTime;
  bool _isConfigured = false;

  String? _androidAdUnitId;
  String? _iosAdUnitId;

  /// 플랫폼별 광고 ID를 설정하고 라이프사이클 감지를 시작한다.
  /// 앱 시작 시 한 번 호출해야 한다.
  void configure({
    required String androidId,
    required String iosId,
  }) {
    _androidAdUnitId = androidId;
    _iosAdUnitId = iosId;

    if (!_isConfigured) {
      _isConfigured = true;
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      showAdIfAvailable();
    }
  }

  String get _adUnitId {
    if (kDebugMode) {
      // Google 공식 테스트 ID
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/9257395921'
          : 'ca-app-pub-3940256099942544/5575463023';
    }
    assert(
      _androidAdUnitId != null && _iosAdUnitId != null,
      'AppOpenAdManager.configure()를 먼저 호출하세요.',
    );
    return Platform.isAndroid ? _androidAdUnitId! : _iosAdUnitId!;
  }

  bool get _isAdAvailable =>
      _ad != null &&
          _loadTime != null &&
          DateTime.now().difference(_loadTime!) < const Duration(hours: 4);

  /// 광고를 로드한다. 이미 유효한 광고가 있으면 무시한다.
  void loadAd() {
    if (_isAdAvailable) return;

    AppOpenAd.load(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _ad = ad;
          _loadTime = DateTime.now();
        },
        onAdFailedToLoad: (e) {
          // 실패는 조용히 처리 — 다음 포그라운드 시 재시도
          debugPrint('[flutter_ui_kit][app_open_ad_manager][FailedToLoad] $e');
        },
      ),
    );
  }

  /// 유효한 광고가 있으면 표시한다.
  /// 광고가 없거나 만료됐으면 새로 로드하고 이번 기회는 넘어간다.
  void showAdIfAvailable() {
    if (_isShowingAd) return;
    if (!GlobalAdConfig().isShowAds.value) return;

    if (!_isAdAvailable) {
      loadAd();
      return;
    }

    _ad!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (_) => _isShowingAd = true,
      onAdFailedToShowFullScreenContent: (ad, _) {
        _isShowingAd = false;
        ad.dispose();
        _ad = null;
        loadAd();
      },
      onAdDismissedFullScreenContent: (ad) {
        _isShowingAd = false;
        ad.dispose();
        _ad = null;
        loadAd(); // 다음 포그라운드를 위해 미리 로드
      },
    );

    _ad!.show();
  }
}
