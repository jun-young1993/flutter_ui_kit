# flutter_ui_kit_notice

Premium **Glassmorphism Notice Board UI Kit** for Flutter.

포럼, 커뮤니티, 공지 게시판에 바로 사용할 수 있는 재사용 가능한 위젯 모음입니다.
모든 디자인 토큰은 [`flutter_ui_kit_theme`](../flutter_ui_kit_theme)에서 가져오며, 하드코딩된 색상·여백·폰트 크기는 없습니다.

---

## 컴포넌트 목록

| 컴포넌트 | 설명 |
|---|---|
| `GlassCard` | Glassmorphism 기반 범용 카드 컨테이너 |
| `GlassTag` | 카테고리 / 상태 표시용 pill 배지 |
| `BoardList` | `NoticePost` 목록을 렌더링하는 스크롤 리스트 |
| `BoardItem` | 게시글 한 줄 카드 (제목, 작성자, 날짜, 조회수, 댓글 수) |
| `PostView` | 게시글 상세 뷰 (헤더 + 본문 + 댓글 목록) |
| `CommentWidget` | 댓글 한 줄 카드 (아바타, 작성자, 내용) |

---

## 설치

`pubspec.yaml`에 추가:

```yaml
dependencies:
  flutter_ui_kit_notice: any
  flutter_ui_kit_theme: any   # 디자인 토큰 필수
```

---

## 빠른 시작

### 1. 테마 설정

`flutter_ui_kit_theme`의 `DarkTheme` 또는 `LightTheme`을 앱에 적용합니다.

```dart
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

MaterialApp(
  theme: LightTheme.build(),
  darkTheme: DarkTheme.build(),
  themeMode: ThemeMode.system,
  home: const MyHomePage(),
);
```

### 2. 게시글 목록 화면

```dart
import 'package:flutter_ui_kit_notice/flutter_ui_kit_notice.dart';

final posts = [
  NoticePost(
    id: '1',
    title: '서비스 점검 안내 (3/15 02:00 ~ 04:00)',
    author: '운영자',
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    category: '공지',
    isPinned: true,
    viewCount: 1240,
    commentCount: 3,
  ),
  NoticePost(
    id: '2',
    title: '3월 이벤트 참여 방법 안내',
    author: '마케팅팀',
    createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
    category: '이벤트',
    isNew: true,
    viewCount: 430,
    commentCount: 12,
  ),
];

BoardList(
  posts: posts,
  animateItems: true,
  onTapPost: (post) {
    // 상세 페이지로 이동
  },
)
```

### 3. 게시글 상세 화면

```dart
final comments = [
  NoticeComment(
    id: 'c1',
    author: '홍길동',
    body: '유익한 정보 감사합니다!',
    createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
  ),
];

PostView(
  post: selectedPost,
  comments: comments,
)
```

### 4. 개별 컴포넌트 직접 사용

```dart
// GlassCard — 커스텀 콘텐츠를 감싸는 glassmorphism 카드
GlassCard(
  onTap: () {},
  child: Text('내용'),
)

// GlassTag — 카테고리 / 상태 배지
Row(
  children: [
    GlassTag(label: '공지'),
    GlassTag(label: 'NEW', color: Theme.of(context).colorScheme.error),
  ],
)

// CommentWidget — 단독 댓글 렌더링
CommentWidget(comment: noticeComment)
```

---

## 모델

### `NoticePost`

| 필드 | 타입 | 설명 |
|---|---|---|
| `id` | `String` | 고유 식별자 |
| `title` | `String` | 게시글 제목 |
| `author` | `String` | 작성자 이름 |
| `createdAt` | `DateTime` | 작성 시각 |
| `category` | `String?` | 카테고리 레이블 (예: '공지', '이벤트') |
| `body` | `String?` | 본문 (상세 뷰에서 사용) |
| `viewCount` | `int` | 조회 수 |
| `commentCount` | `int` | 댓글 수 |
| `isPinned` | `bool` | 상단 고정 여부 |
| `isNew` | `bool` | NEW 배지 표시 여부 |

### `NoticeComment`

| 필드 | 타입 | 설명 |
|---|---|---|
| `id` | `String` | 고유 식별자 |
| `author` | `String` | 작성자 이름 |
| `body` | `String` | 댓글 내용 |
| `createdAt` | `DateTime` | 작성 시각 |

---

## 커스터마이징

### 댓글 커스텀 빌더

`PostView`의 `commentBuilder`로 댓글 위젯을 완전히 교체할 수 있습니다.

```dart
PostView(
  post: post,
  comments: comments,
  commentBuilder: (comment) => MyCustomCommentCard(comment: comment),
)
```

### GlassCard 블러 강도 조정

```dart
GlassCard(
  blur: 10.0,   // 기본값 20.0
  child: ...,
)
```

### BoardList 빈 상태 위젯 교체

```dart
BoardList(
  posts: const [],
  emptyWidget: const Center(child: Text('작성된 게시글이 없습니다.')),
)
```

---

## 디자인 규칙

- **다크 모드 기본** — 모든 컴포넌트는 dark surface에서 최적 표시되도록 설계
- **Glassmorphism** — `BackdropFilter` + 반투명 배경 + 소프트 보더
- **토큰 사용 의무** — `AppSpacing`, `AppRadius`, `colorScheme`, `textTheme` 으로만 스타일링
- **애니메이션 옵트인** — `animate: true` 파라미터로 FadeIn 전환 활성화

---

## 패키지 구조

```
lib/
  flutter_ui_kit_notice.dart        # 공개 barrel
  src/
    models/
      notice_post.dart
      notice_comment.dart
    components/
      glass_card/glass_card.dart
      glass_tag/glass_tag.dart
      board_item/board_item.dart
      board_list/board_list.dart
      comment_widget/comment_widget.dart
      post_view/post_view.dart
```
