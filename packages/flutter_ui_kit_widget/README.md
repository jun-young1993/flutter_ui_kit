# flutter_ui_kit_widget

`flutter_ui_kit` 에코시스템에서 공통으로 재활용하는 UI 위젯 컴포넌트 모음.

각 위젯은 특정 도메인 패키지에 종속되지 않고 순수 Flutter/Material 의존성만 가지며,
다른 `flutter_ui_kit_*` 패키지들이 이 패키지를 기반으로 UI를 구성한다.

---

## 컴포넌트

### `DsIconToggle`

아이콘 하나를 표시하고, 탭하면 상태를 전환하는 **범용 아이콘 토글 버튼**.

- `StadiumBorder` 형태의 `Material` + `InkWell` 버튼 영역
- 아이콘 교체 시 **rotate + scale + fade** 애니메이션 (`AnimatedSwitcher`)
- 색상은 모두 `colorScheme`에서 가져와 테마에 자동 동기화
- 접근성: `Semantics` + `Tooltip` 기본 포함

#### 파라미터

| 파라미터 | 타입 | 기본값 | 설명 |
|---|---|---|---|
| `icon` | `IconData` | 필수 | 현재 표시할 아이콘 |
| `onTap` | `VoidCallback` | 필수 | 탭 콜백 |
| `semanticLabel` | `String` | 필수 | 스크린리더용 레이블 |
| `tooltipMessage` | `String` | 필수 | 툴팁 메시지 |
| `iconKey` | `Key?` | `ValueKey(icon)` | 아이콘 전환 애니메이션 트리거 키 |
| `iconColor` | `Color?` | `colorScheme.primary` | 아이콘 색상 |
| `backgroundColor` | `Color?` | `colorScheme.surfaceContainerHigh` | 버튼 배경색 |
| `sizedBoxDimension` | `double` | `48` | 탭 영역 한 변 크기 |
| `iconSize` | `double` | `22` | 아이콘 크기 |

#### 사용 예시

```dart
// 직접 사용
DsIconToggle(
  icon: Icons.wb_sunny_rounded,
  iconKey: ValueKey(themeMode),
  onTap: () => setState(() => /* 상태 변경 */),
  semanticLabel: 'Light is active. Tap to switch to Dark.',
  tooltipMessage: 'light',
);

// ValueNotifier 패턴
final modeNotifier = ValueNotifier(ThemeMode.light);

ValueListenableBuilder<ThemeMode>(
  valueListenable: modeNotifier,
  builder: (_, mode, __) => DsIconToggle(
    icon: mode == ThemeMode.light
        ? Icons.wb_sunny_rounded
        : Icons.nightlight_rounded,
    iconKey: ValueKey(mode),
    onTap: () => modeNotifier.value =
        mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
    semanticLabel: '...',
    tooltipMessage: '...',
  ),
);
```

---

## 이 패키지를 사용하는 패키지

| 패키지 | 위젯 | 설명 |
|---|---|---|
| `flutter_ui_kit_theme` | `DsThemeToggle` | Light / Dark / System 전환 토글 |
| `flutter_ui_kit_theme` | `DsBrandToggle` | Violet / Emerald 브랜드 전환 토글 |

---

## 설치

`pubspec.yaml`에 추가:

```yaml
dependencies:
  flutter_ui_kit_widget: any
```

workspace 환경에서는 `resolution: workspace`와 루트 `pubspec.yaml`의 `workspace:` 목록에 경로를 추가해야 한다.

---

## 변경 이력

### 0.0.1

- `DsIconToggle` 추가
  - `flutter_ui_kit_theme`의 `DsThemeToggle`, `DsBrandToggle` 공통 로직을 추출하여 범용 컴포넌트로 분리
  - `AppMotion` 토큰 의존 없이 동일한 애니메이션 동작을 내장 상수로 구현
