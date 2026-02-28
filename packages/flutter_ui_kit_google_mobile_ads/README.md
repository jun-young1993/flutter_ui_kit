──---─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
AppOpenAdManager 사용 방법                                                                                                                                      
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
1. 초기 설정 (앱 시작 시 1회)                                                                                                                                   
   Update available! Run: brew                    
   main() 또는 앱 초기화 단계에서 configure를 호출하여 플랫폼별 광고 ID를 설정합니다.
```dart
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await MobileAds.instance.initialize();

    AppOpenAdManager.instance.configure(
      androidId: 'ca-app-pub-xxxx/xxxx', // Android 광고 단위 ID
      iosId: 'ca-app-pub-xxxx/xxxx',     // iOS 광고 단위 ID
    );

    // 콜드 스타트 시 광고 미리 로드
    AppOpenAdManager.instance.loadAd();

    runApp(const MyApp());
}
```

2. 포그라운드 복귀 시 광고 표시

3. AppLifecycleState를 감지하여 포그라운드 복귀 시 광고를 표시합니다.
```dart
class MyApp extends StatefulWidget {
const MyApp({super.key});

    @override
    State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
@override
void initState() {
super.initState();
WidgetsBinding.instance.addObserver(this);
}

    @override
    void dispose() {
      WidgetsBinding.instance.removeObserver(this);
      super.dispose();
    }

    @override
    void didChangeAppLifecycleState(AppLifecycleState state) {
      if (state == AppLifecycleState.resumed) {
        AppOpenAdManager.instance.showAdIfAvailable();
      }
    }

    @override
    Widget build(BuildContext context) {
      return const MaterialApp(home: HomeScreen());
    }
}
```
주요 동작

┌───────────────────────────────┬─────────────────────────────────────────────┐
│            메서드             │                    설명                     │
├───────────────────────────────┼─────────────────────────────────────────────┤
│ configure(androidId:, iosId:) │ 플랫폼별 광고 ID 설정 (필수, 1회)           │
├───────────────────────────────┼─────────────────────────────────────────────┤
│ loadAd()                      │ 광고 미리 로드 (유효한 광고가 있으면 무시)  │
├───────────────────────────────┼─────────────────────────────────────────────┤
│ showAdIfAvailable()           │ 유효한 광고가 있으면 표시, 없으면 새로 로드 │
└───────────────────────────────┴─────────────────────────────────────────────┘

참고 사항

- 디버그 모드에서는 configure에 설정한 ID와 관계없이 Google 공식 테스트 ID가 자동으로 사용됩니다.
- 광고는 로드 후 4시간이 지나면 만료 처리되어 자동으로 재로드됩니다.
- 광고가 이미 표시 중이면 중복 노출되지 않습니다.
