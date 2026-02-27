# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Flutter UI Kit 모노레포. `melos`로 워크스페이스를 관리한다. `packages/` 아래 각 패키지는 pub.dev에 개별 배포되며, `apps/` 아래는 각 패키지의 쇼케이스 앱이다. 현재 배포 패키지는 `flutter_ui_kit_chat`이며 앞으로 패키지가 추가될 예정이다.

```
packages/
  flutter_ui_kit_chat/   # pub.dev 배포 패키지 (glassmorphism chat UI kit)
  chat/                  # WIP 패키지
apps/
  show_case_chat/        # flutter_ui_kit_chat 쇼케이스 앱
```

## Common Commands

각 명령은 해당 패키지/앱 디렉터리에서 실행한다.

```bash
# 쇼케이스 앱 실행
cd apps/show_case_chat && flutter run

# 패키지 테스트 전체 실행
cd packages/flutter_ui_kit_chat && flutter test

# 단일 테스트 파일 실행
cd packages/flutter_ui_kit_chat && flutter test test/flutter_ui_kit_chat_test.dart

# 린트
cd packages/flutter_ui_kit_chat && flutter analyze

# 배포 전 dry-run 검증
cd packages/flutter_ui_kit_chat && dart pub publish --dry-run
```

## 새 패키지 추가 규칙

`packages/` 하위에 패키지를 추가할 때 기존 패키지(`flutter_ui_kit_chat`)의 구조를 기준으로 따른다.

```shell
flutter create --template=package .
```

- `pubspec.yaml`에 `resolution: workspace` 설정 (workspace 연동)
- 공개 API는 `lib/<package_name>.dart` barrel 하나로만 노출
- `lib/src/` 내부는 외부 임포트 금지 원칙 유지
- 쇼케이스 앱은 `apps/show_case_<package_name>/`에 대응 생성

## Architecture: `flutter_ui_kit_chat`

신규 패키지 설계 시 이 구조를 참고한다.

### 레이어 구조

```
lib/
  flutter_ui_kit_chat.dart     # 유일한 공개 barrel. 모든 임포트는 여기서.
  src/
    chat/
      animations/              # ChatMotionData (애니메이션 옵션 데이터 클래스)
      components/              # 개별 UI 위젯 (bubble, avatar, input bar 등)
      layout/                  # ChatScaffold, ChatMessageList (최상위 조합 위젯)
      presentation/            # 빌더 typedef + 기본 빌더 함수 (chat_builders.dart)
    controllers/               # ChatInputController (ChangeNotifier)
    models/                    # 불변 데이터 모델
    theme/                     # ChatTheme (ThemeExtension)
    tokens/                    # 디자인 토큰 (spacing, radius, durations, shadows)
    utils/                     # GlassContainer (glassmorphism 공통 유틸)
```

### 핵심 설계 원칙

- **상태 관리 무의존**: Bloc, Riverpod, Provider 없음. `ChatInputController`(ChangeNotifier)만 사용.
- **슬롯 기반 커스터마이제이션**: `ChatScaffold`와 `ChatMessageList`는 `bubbleBuilder`, `avatarBuilder`, `typingIndicatorBuilder` 등을 파라미터로 받는다. 기본 빌더는 `chat_builders.dart`에 `kDefault*` 접두사로 정의.
- **테마 주입**: `ChatTheme`은 `ThemeExtension<ChatTheme>`으로 구현. `ChatTheme.resolve(context)`로 조회하며 테마 없으면 `ChatTheme.dark()` 폴백. `ChatScaffold`는 `chatTheme` 파라미터로 오버라이드 지원.
- **퍼포먼스 모드**: `ChatPerformanceMode` (`off/low/medium/high`). `medium` 이상이면 `GlassContainer`의 `BackdropFilter` blur를 비활성화.
- **애니메이션 옵트인**: `ChatMotionData`로 메시지 진입, 전송 버튼, 포커스 글로우, 그룹 전환 등을 개별 on/off.

### 주요 모델

- `ChatMessage`: 불변. `id`, `author`, `text`, `sentAt`, `status`, `reactions`, `replyToMessageId`, `metadata`.
- `ChatAuthor`: `role == ChatAuthorRole.currentUser`이면 오른쪽 버블로 렌더링.
- `MessageGroupPosition` (`single/first/middle/last`): 동일 author의 5분 이내 연속 메시지를 그룹핑. 빌더에 전달되어 버블 모양 조정에 사용.
- `ChatMessageStatus`: `sending / sent / delivered / read / failed`

### 디자인 토큰

| 토큰 | 값 |
|---|---|
| `ChatSpacing` | x1=8, x2=16, x3=24, x4=32 |
| `ChatRadius` | sm=8, md=16, lg=24 |
| `ChatDurations` | fast=200ms, medium=240ms, slow=300ms |
| `ChatShadows` | `soft`, `glow` 프리셋 |
