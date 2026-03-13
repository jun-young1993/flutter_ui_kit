# flutter_ui_kit_theme

Material 3 기반 다중 브랜드 디자인 시스템 패키지. 디자인 토큰, 테마 빌더, 브랜드 전환, 반응형 스케일을 포함한다.

## Features

- **Material 3** `useMaterial3: true` 기반 완전한 ThemeData 구성
- **다중 브랜드**: Violet(Brand A) / Emerald(Brand B) 전환 지원
- **디자인 토큰**: 색상, 간격, 경모, 타이포그래피, 모션, 반응형 스케일을 상수로 제공
- **DsThemeController**: ThemeMode + DsBrand + Locale 상태 관리 (SharedPreferences 영속성)
- **즉시 사용 가능한 위젯**: `DsButton`, `DsCard`, `DsSurface`, `DsThemeToggle`, `DsBrandToggle`
- 상태 관리 라이브러리 **불필요** — ChangeNotifier만 사용

## Getting started

```yaml
dependencies:
  flutter_ui_kit_theme: ^0.1.16
```

## Usage

### 1. 기본 테마 적용

```dart
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

MaterialApp(
  theme:     BrandATheme.light(),
  darkTheme: BrandATheme.dark(),
  themeMode: ThemeMode.system,
)
```

### 2. DsThemeController로 동적 전환

`DsThemeController`는 테마 모드(light/dark/system), 브랜드(Violet/Emerald), 로케일을 관리하며 선택 내용을 SharedPreferences에 저장한다.

```dart
final controller = DsThemeController();

// DsThemeBuilder로 래핑하면 변경 시 자동 리빌드
DsThemeBuilder(
  controller: controller,
  builder: (context, themeMode, brand, locale) {
    return MaterialApp(
      theme:     brand.lightTheme(),
      darkTheme: brand.darkTheme(),
      themeMode: themeMode,
      locale:    locale,
    );
  },
)
```

### 3. 브랜드 전환

```dart
// DsBrand enum 사용
DsBrand brand = DsBrand.violet; // or DsBrand.emerald

MaterialApp(
  theme:     brand.lightTheme(),
  darkTheme: brand.darkTheme(),
  themeMode: themeMode,
  home: Scaffold(
    appBar: AppBar(
      actions: [
        DsBrandToggle(
          brand: brand,
          onChanged: (b) => setState(() => brand = b),
        ),
        DsThemeToggle(
          mode: themeMode,
          onChanged: (m) => setState(() => themeMode = m),
        ),
      ],
    ),
  ),
)
```

### 4. 위젯에서 토큰 사용

하드코딩 없이 토큰 상수를 사용한다.

```dart
// 간격
AppSpacing.x2           // 16.0
AppSpacing.paddingH3    // EdgeInsets.symmetric(horizontal: 24)
AppSpacing.gapV2        // SizedBox(height: 16)

// 경모
AppRadius.card          // 의미론적 상수
AppRadius.button

// 모션
AppMotion.medium        // Duration(milliseconds: 240)
AppMotion.easeOut       // Curves.easeOut

// 반응형
AppScale.sectionPadding(context)  // 기기 크기에 따른 패딩 값
AppBreakpoints.isTablet(context)  // 768px 이상 여부
```

### 5. DsButton / DsCard / DsSurface

```dart
// 버튼 — filled / outlined / ghost 변형
DsButton(
  label: '확인',
  onPressed: () {},
  variant: DsButtonVariant.filled,  // 기본값
)

DsButton(
  label: '로딩 중',
  onPressed: null,
  loading: true,
  expanded: true,  // 가로 full-width
)

// 카드 (탭 가능한 DsSurface)
DsCard(
  level: SurfaceLevel.low,
  onTap: () {},
  child: Column(children: [
    Text('Title', style: Theme.of(context).textTheme.titleMedium),
    AppSpacing.gapV2,
    DsButton(label: 'Action', onPressed: () {}),
  ]),
)

// 표면 레벨 컨테이너 (lowest / low / mid / high / highest)
DsSurface(
  level: SurfaceLevel.mid,
  child: Padding(
    padding: AppSpacing.paddingAll2,
    child: Text('Content'),
  ),
)
```

## API Reference

### 디자인 토큰

| 클래스 | 내용 |
|---|---|
| `AppColors` | Violet / Emerald / Ink 팔레트 |
| `AppSpacing` | x0_5(4px) ~ x6(48px), EdgeInsets/SizedBox 헬퍼 |
| `AppRadius` | xs ~ xxl, 의미론적 상수 (card, button, chip 등) |
| `AppTypography` | `textTheme()` — M3 타입 스케일 |
| `AppMotion` | instant ~ slow Duration, Curve 프리셋 |
| `AppScale` | `sectionPadding()`, `gap()`, `chipSpacing()` 반응형 값 |
| `AppBreakpoints` | wide=600, tablet=768, `isTablet()` |

### 테마

| 클래스 | 내용 |
|---|---|
| `BrandATheme` | Violet 브랜드 — `light()` / `dark()` |
| `BrandBTheme` | Emerald 브랜드 — `light()` / `dark()` |
| `BaseTheme` | ColorScheme을 받아 완전한 ThemeData 생성 |

### 컨트롤러 / 위젯

| 클래스 | 내용 |
|---|---|
| `DsThemeController` | ThemeMode + DsBrand + Locale 관리 (ChangeNotifier) |
| `DsThemeBuilder` | 컨트롤러 변경 시 builder 콜백 호출 |
| `DsThemeToggle` | Light/Dark/System 순환 아이콘 버튼 |
| `DsBrandToggle` | Violet/Emerald 전환 버튼 |
| `DsButton` | filled / outlined / ghost 버튼 |
| `DsSurface` | SurfaceLevel 기반 배경 컨테이너 |
| `DsCard` | DsSurface + InkWell 조합 카드 |

## Additional information

- 이슈 및 기여: [GitHub](https://github.com/junyoung-jamong/flutter_ui_kit)
- flutter_ui_kit_setting 패키지와 함께 사용하면 설정 화면 UI도 즉시 구성 가능
