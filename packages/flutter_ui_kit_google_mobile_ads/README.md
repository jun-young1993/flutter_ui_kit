# flutter_ui_kit_google_mobile_ads

Google Mobile Ads(AdMob)를 Flutter 앱에 간편하게 통합하는 패키지입니다.
배너 광고(`BannerAdWidget`)와 앱 오픈 광고(`AppOpenAdManager`)를 제공하며,
전역 광고 ON/OFF 스위치(`GlobalAdConfig`)로 프리미엄 사용자에게 광고를 손쉽게 숨길 수 있습니다.

## Features

- **BannerAdWidget** — 배너 광고 위젯. 전역 스위치에 실시간 반응.
- **AppOpenAdManager** — 앱 오픈 광고 싱글턴. 콜드 스타트 및 포그라운드 복귀 시 자동 표시.
  - 마지막 표시로부터 **1시간 쿨다운** (연속 노출 방지, AdMob 정책 준수)
  - 로드 후 **4시간 만료** 시 자동 재로드
  - 이미 표시 중이면 중복 노출 없음
- **GlobalAdConfig** — 전역 광고 ON/OFF. 프리미엄 결제 완료 시 광고를 즉시 숨기는 데 활용.
- **디버그 모드 자동 테스트 ID** — `kDebugMode`일 때 Google 공식 테스트 광고 ID 자동 적용.

## Getting started

### 1. 의존성 추가

```yaml
dependencies:
  flutter_ui_kit_google_mobile_ads: ^0.1.14
```

### 2. Android 설정

`android/app/src/main/AndroidManifest.xml`의 `<application>` 태그 안에 AdMob 앱 ID를 추가합니다.

```xml
<meta-data
    android:name="com.google.android.gms.ads.APPLICATION_ID"
    android:value="ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy"/>
```

### 3. iOS 설정

`ios/Runner/Info.plist`에 AdMob 앱 ID를 추가합니다.

```xml
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy</string>
```

---

## Usage

### 초기화

앱 시작 시 `GlobalAdConfig().initialize()`를 호출해 AdMob SDK를 초기화합니다.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalAdConfig().initialize();
  runApp(const MyApp());
}
```

---

### BannerAdWidget

플랫폼별 광고 단위 ID를 넘기면 됩니다.
`GlobalAdConfig().isShowAds`를 실시간으로 감시하므로 전역 스위치가 꺼지면 위젯이 즉시 사라집니다.

```dart
BannerAdWidget(
  androidId: 'ca-app-pub-xxxx/xxxx',
  iosId: 'ca-app-pub-xxxx/xxxx',
)
```

---

### AppOpenAdManager

#### 앱 시작 시 1회 설정

`configure()`를 호출하면 내부에서 `WidgetsBindingObserver`가 자동으로 등록되어
포그라운드 복귀를 감지합니다.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalAdConfig().initialize();

  AppOpenAdManager.instance.configure(
    androidId: 'ca-app-pub-xxxx/xxxx',
    iosId: 'ca-app-pub-xxxx/xxxx',
  );

  // 콜드 스타트 광고 미리 로드
  AppOpenAdManager.instance.loadAd();

  runApp(const MyApp());
}
```

이후 포그라운드 복귀 시 광고는 자동으로 표시됩니다.
마지막 표시로부터 1시간이 지나지 않았으면 자동으로 건너뜁니다.

#### 쿨다운 시간 조정 (선택)

```dart
// 기본값 1시간. 필요 시 변경 가능.
AppOpenAdManager.instance.cooldown = const Duration(minutes: 30);
```

---

### GlobalAdConfig — 광고 전역 ON/OFF

```dart
// 프리미엄 결제 완료 시 광고 숨기기
GlobalAdConfig().setAdVisibility(false);

// 광고 다시 표시
GlobalAdConfig().setAdVisibility(true);
```

`BannerAdWidget`과 `AppOpenAdManager` 모두 이 스위치를 참조하므로
한 번만 호출하면 앱 전체에 적용됩니다.

---

## API Reference

### `GlobalAdConfig`

| 멤버 | 설명 |
|------|------|
| `initialize()` | AdMob SDK 초기화 (`MobileAds.instance.initialize()` 래퍼) |
| `isShowAds` | `ValueNotifier<bool>` — 전역 광고 표시 여부 |
| `setAdVisibility(bool)` | 광고 표시 여부 변경 |

### `BannerAdWidget`

| 파라미터 | 타입 | 설명 |
|----------|------|------|
| `androidId` | `String` | Android 배너 광고 단위 ID |
| `iosId` | `String` | iOS 배너 광고 단위 ID |

### `AppOpenAdManager`

| 멤버 | 설명 |
|------|------|
| `configure(androidId:, iosId:)` | 광고 ID 설정 + 라이프사이클 감지 시작 (앱당 1회) |
| `loadAd()` | 광고 미리 로드. 유효한 광고가 있으면 무시 |
| `showAdIfAvailable()` | 조건을 충족하면 광고 표시. 그렇지 않으면 새로 로드 |
| `cooldown` | 광고 재표시 최소 간격 (기본 `Duration(hours: 1)`) |

---

## Notes

- **디버그 모드**: `kDebugMode`가 `true`이면 `configure`에 설정한 ID와 무관하게 Google 공식 테스트 ID가 자동 적용됩니다.
- **광고 만료**: 로드된 앱 오픈 광고는 4시간 후 만료되며 자동으로 재로드됩니다.
- **쿨다운 범위**: 쿨다운은 세션 내 메모리에만 유지됩니다. 앱을 완전히 종료 후 재시작하면 콜드 스타트 광고가 표시되며, 이는 AdMob App Open Ad의 의도된 동작입니다.
