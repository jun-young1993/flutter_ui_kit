# flutter_ui_kit_setting

Flutter 앱에 설정 화면을 빠르게 추가할 수 있는 UI 키트. 타일 조합 방식으로 앱 버전 표시, 테마/브랜드 전환, 이메일 문의, 앱 공유, 스토어 링크 등 자주 쓰이는 설정 항목을 즉시 구성할 수 있다.

## Features

- **조합 가능한 타일**: 레이블, 스위치, 네비게이션 등 목적별 타일 위젯 제공
- **앱 정보 타일**: 버전/빌드번호 자동 조회 (`package_info_plus`)
- **테마/브랜드 전환 타일**: `flutter_ui_kit_theme`의 `DsThemeToggle` / `DsBrandToggle` 내장
- **외부 연동 타일**: 이메일 작성, 앱 공유, App Store/홈페이지 URL 열기
- **템플릿 함수**: `buildDefaultSettingSections()`로 자주 쓰는 섹션 일괄 생성
- **SettingGearButton**: 설정 진입점 기어 아이콘 버튼 (애니메이션 옵션)

## Getting started

```yaml
dependencies:
  flutter_ui_kit_setting: ^0.1.16
```

`flutter_ui_kit_theme` 패키지를 함께 사용한다. 앱에 `DsThemeController`가 설정되어 있으면 테마/브랜드 전환 타일을 바로 연결할 수 있다.

## Usage

### 1. SettingScreen — 전체 설정 화면

```dart
import 'package:flutter_ui_kit_setting/flutter_ui_kit_setting.dart';

SettingScreen(
  sections: [
    SettingSection(
      title: '일반',
      items: [
        SettingThemeToggleTile(controller: themeController),
        SettingBrandToggleTile(controller: themeController),
      ],
    ),
    SettingSection(
      title: '앱 정보',
      items: [
        SettingAppVersionTile(),
        SettingDeveloperEmailTile(email: 'hello@example.com'),
      ],
    ),
  ],
)
```

### 2. 템플릿으로 빠르게 구성

자주 쓰이는 섹션 조합을 한 번에 생성한다.

```dart
SettingScreen(
  sections: buildDefaultSettingSections(
    controller: themeController,
    developerEmail: 'hello@example.com',
    appStoreUrl: 'https://apps.apple.com/...',
    homepageUrl: 'https://example.com',
    shareText: '이 앱을 추천합니다!',
  ),
)
```

### 3. 개별 타일 사용

각 타일을 직접 조합하거나 기존 ListView에 삽입할 수 있다.

```dart
// 기본 탭 타일
SettingTile(
  label: '언어',
  subtitle: '한국어',
  leading: Icon(Icons.language),
  onTap: () { /* 언어 선택 */ },
)

// 스위치 타일
SwitchTile(
  label: '알림',
  value: notificationsEnabled,
  onChanged: (v) => setState(() => notificationsEnabled = v),
)

// 다음 화면으로 이동 (trailing에 chevron 자동 표시)
NavigationTile(
  label: '개인정보 처리방침',
  onTap: () => Navigator.push(context, ...),
)

// 앱 버전 자동 표시
SettingAppVersionTile()

// 테마 모드 순환 (Light → Dark → System)
SettingThemeToggleTile(controller: themeController)

// 브랜드 전환 (Violet ↔ Emerald)
SettingBrandToggleTile(controller: themeController)

// 이메일 문의
SettingDeveloperEmailTile(
  email: 'support@example.com',
  subject: '문의하기',    // 선택
  body: '앱 버전: ...',  // 선택
)

// 앱 공유
SettingAppShareTile(shareText: '이 앱을 추천합니다!')

// 스토어 링크
SettingAppStoreTile(storeUrl: 'https://apps.apple.com/...')

// 홈페이지
SettingAppHomepageTile(homepageUrl: 'https://example.com')

// 커스텀 위젯 삽입
CustomWidgetTile(child: MyCustomWidget())
```

### 4. SettingGearButton — 설정 진입점 버튼

```dart
// AppBar action에 배치
AppBar(
  actions: [
    SettingGearButton(
      onTap: () => Navigator.push(context, ...),
      animate: true,  // 탭 시 회전 애니메이션
    ),
  ],
)
```

## API Reference

### 화면 / 구조

| 클래스 | 설명 |
|---|---|
| `SettingScreen` | 섹션 목록을 받아 스크롤 가능한 설정 화면 렌더링 |
| `SettingSection` | 섹션 데이터 모델 (title, items) |
| `SettingSectionWidget` | SettingSection을 카드로 렌더링 |

### 타일

| 클래스 | 설명 |
|---|---|
| `SettingTile` | 기본 타일 (label, subtitle, leading, trailing, onTap) |
| `SwitchTile` | 토글 스위치 포함 타일 |
| `NavigationTile` | trailing에 chevron 아이콘 자동 표시 |
| `CustomWidgetTile` | 임의 위젯을 타일 영역에 삽입 |
| `SettingAppVersionTile` | 앱 버전/빌드번호 비동기 표시 |
| `SettingThemeToggleTile` | Light / Dark / System 순환 전환 |
| `SettingBrandToggleTile` | Violet / Emerald 브랜드 전환 |
| `SettingDeveloperEmailTile` | 이메일 표시 및 메일 앱 실행 |
| `SettingAppShareTile` | 텍스트 공유 시트 실행 |
| `SettingAppStoreTile` | App Store / Play Store URL 열기 |
| `SettingAppHomepageTile` | 홈페이지 URL 열기 |

### 위젯 / 토큰 / 템플릿

| 항목 | 설명 |
|---|---|
| `SettingGearButton` | 설정 진입 기어 버튼 (animate 옵션) |
| `SettingSpacing` | x1=8, x2=16, x3=24, x4=32 |
| `SettingRadius` | sm=8, md=12, lg=16 |
| `buildDefaultSettingSections()` | 자주 쓰는 섹션 조합을 List<SettingSection>으로 반환 |

## Additional information

- `flutter_ui_kit_theme`의 `DsThemeController` 없이도 각 타일을 독립적으로 사용 가능
- 이슈 및 기여: [GitHub](https://github.com/junyoung-jamong/flutter_ui_kit)
