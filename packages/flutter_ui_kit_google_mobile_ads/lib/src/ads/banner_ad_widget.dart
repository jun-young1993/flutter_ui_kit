import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../utils/global_ad_config.dart';

class BannerAdWidget extends StatefulWidget {
  final String androidId;
  final String iosId;
  const BannerAdWidget({super.key, required this.androidId, required this.iosId});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    // 초기 로드 시 표시 상태 확인 후 로드
    if (GlobalAdConfig().isShowAds.value) {
      _loadAd();
    }
  }

  void _loadAd() {
    BannerAd(
      adUnitId: _getAdUnitId(),
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(() {
          _bannerAd = ad as BannerAd;
          _isAdLoaded = true;
        }),
        onAdFailedToLoad: (ad, error) => ad.dispose(),
      ),
    ).load();
  }

  String _getAdUnitId() {
    if (Platform.isAndroid) {
      if(kDebugMode){
        return 'ca-app-pub-3940256099942544/6300978111'; // Android 테스트 배너
      }
      return widget.androidId;
    } else {
      if(kDebugMode){
        return 'ca-app-pub-3940256099942544/2934735716'; // iOS 테스트 배너
      }
      return widget.iosId;
      
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ValueListenableBuilder를 통해 전역 상태 변화를 실시간 감시
    return ValueListenableBuilder<bool>(
      valueListenable: GlobalAdConfig().isShowAds,
      builder: (context, isShow, child) {
        if (!isShow || !_isAdLoaded || _bannerAd == null) {
          return const SizedBox.shrink();
        }

        return SafeArea(
          top: false,
          child: SizedBox(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          ),
        );
      },
    );
  }
}