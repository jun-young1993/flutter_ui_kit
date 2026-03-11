# Melos 워크스페이스 가이드

## 개요

이 모노레포는 **Melos** + **Dart Workspace** 두 가지 도구를 함께 사용한다.
패키지는 pub.dev에 배포하지 않고 **GitHub git 저장소로만 배포**한다.

| 도구 | 역할 |
|---|---|
| **Dart Workspace** (`resolution: workspace`) | 패키지 간 의존성을 로컬에서 해석. `flutter pub get` 하나로 전체 연결 |
| **Melos** | 여러 패키지에 걸친 스크립트 실행 (analyze, test, l10n 등) |

> 혼동 주의: `melos.yaml`의 `packages:` 글로브와 루트 `pubspec.yaml`의 `workspace:` 목록은 **둘 다** 유지해야 한다.

---

## 핵심 규칙

### 1. 모든 패키지/앱은 workspace에 등록

루트 `pubspec.yaml`의 `workspace:` 목록에 추가한다.
`melos.yaml`의 `packages: - apps/** - packages/**` 글로브가 있으므로 melos 쪽은 자동 포함.

### 2. 모든 패키지/앱에 `resolution: workspace` 선언

```yaml
# packages/flutter_ui_kit_foo/pubspec.yaml
name: flutter_ui_kit_foo
version: 0.1.0
resolution: workspace   # 필수
```

### 3. 내부 패키지 의존성은 버전 제약으로 — path/git 금지

workspace 안의 패키지끼리는 **버전 제약**만 쓴다.
`resolution: workspace`가 pub.dev 없이 자동으로 로컬 버전을 연결해준다.

```yaml
# 올바른 예
dependencies:
  flutter_ui_kit_theme: ^0.1.13   # workspace가 로컬 버전 사용 (pub.dev 불필요)

# 잘못된 예 — path 금지
dependencies:
  flutter_ui_kit_theme:
    path: ../flutter_ui_kit_theme

# 잘못된 예 — git 금지 (workspace 내부 패키지에)
dependencies:
  flutter_ui_kit_theme:
    git:
      url: https://github.com/jun-young1993/flutter_ui_kit.git
      path: packages/flutter_ui_kit_theme
```

### 4. dependency_overrides는 임시방편 — 쓰지 않는다

`dependency_overrides`는 workspace 규칙을 제대로 지키면 필요 없다.
쓰게 됐다면 pubspec 설정이 잘못된 신호다.

---

## 현재 패키지 버전 현황

| 패키지 | 버전 | 비고 |
|---|---|---|
| `flutter_ui_kit_chat` | 0.1.17 | git 배포 |
| `flutter_ui_kit_theme` | 0.1.13 | git 배포 |
| `flutter_ui_kit_setting` | 0.1.12+1 | git 배포 |
| `flutter_ui_kit_l10n` | 0.0.8 | git 배포 |
| `flutter_ui_kit_notice` | 0.0.6+1 | git 배포 |
| `flutter_ui_kit_widget` | 0.0.2 | WIP |
| `flutter_ui_kit_google_mobile_ads` | 0.1.14 | WIP |

---

## Melos 명령어

```bash
# 전체 의존성 설치 (루트에서 실행)
melos bootstrap

# 전체 패키지 analyze
melos analyze

# 전체 패키지 test
melos test

# l10n 전체 파이프라인 (merge + gen)
melos l10n

# l10n 단계별 실행
melos l10n:merge   # namespace ARB → 통합 ARB
melos l10n:gen     # 통합 ARB → Dart 코드
```

---

## 새 패키지 추가 체크리스트

```bash
# 1. 패키지 생성
cd packages && flutter create --template=package flutter_ui_kit_<name>
```

**`packages/flutter_ui_kit_<name>/pubspec.yaml`**
```yaml
name: flutter_ui_kit_<name>
version: 0.0.1
publish_to: none       # pub.dev 배포 안 함
resolution: workspace  # 필수

dependencies:
  flutter_ui_kit_theme: ^0.1.13  # 내부 패키지는 버전 제약으로
```

**루트 `pubspec.yaml`** — workspace 목록에 추가
```yaml
workspace:
  - packages/flutter_ui_kit_<name>
```

**쇼케이스 앱 생성 (`apps/show_case_<name>/pubspec.yaml`)**
```yaml
name: show_case_<name>
version: 1.0.0+1
publish_to: none
resolution: workspace  # 필수

dependencies:
  flutter_ui_kit_<name>: ^0.0.1
```

**루트 `pubspec.yaml`** — 앱도 workspace 목록에 추가
```yaml
workspace:
  - apps/show_case_<name>
```

---

## 로컬 개발 흐름

```
1. 패키지 코드 수정
2. 버전이 바뀌지 않아도 로컬에서 즉시 반영 (workspace가 처리)
3. 변경사항 commit → push → git 태그 생성
4. 다른 패키지에서 신버전 쓰려면: 버전 제약 업데이트 → melos bootstrap
```

---

## 배포 흐름 (git 태그 기반)

pub.dev에 배포하지 않는다. git 태그로 버전을 관리한다.

```bash
# 1. pubspec.yaml version 올리기 (예: 0.1.13 → 0.1.14)

# 2. commit & push
git add packages/flutter_ui_kit_theme/pubspec.yaml
git commit -m "chore: bump flutter_ui_kit_theme to 0.1.14"
git push

# 3. 패키지별 태그 생성 (melos 네이밍 컨벤션)
git tag flutter_ui_kit_theme-v0.1.14
git push origin flutter_ui_kit_theme-v0.1.14
```

---

## 외부 프로젝트에서 사용 (이 모노레포 밖)

이 workspace에 속하지 않은 외부 프로젝트에서는 git dep + ref 태그로 참조한다.

```yaml
# 외부 프로젝트 pubspec.yaml
dependencies:
  flutter_ui_kit_theme:
    git:
      url: https://github.com/jun-young1993/flutter_ui_kit.git
      path: packages/flutter_ui_kit_theme
      ref: flutter_ui_kit_theme-v0.1.14   # 태그로 버전 고정
```

> workspace 안의 쇼케이스 앱들은 git dep을 쓰지 않는다.
> workspace가 자동으로 로컬 버전을 연결하기 때문.
