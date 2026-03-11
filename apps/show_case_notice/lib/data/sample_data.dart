import 'package:flutter_ui_kit_notice/flutter_ui_kit_notice.dart';

final samplePosts = [
  NoticePost(
    id: '1',
    title: '서비스 점검 안내 (3/15 02:00 ~ 04:00)',
    author: '운영자',
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    category: '공지',
    isPinned: true,
    viewCount: 1240,
    commentCount: 3,
    body: '''안녕하세요, 서비스 운영팀입니다.

보다 안정적인 서비스 제공을 위해 아래와 같이 시스템 점검을 진행할 예정입니다.

■ 점검 일시
2024년 3월 15일 (금) 02:00 ~ 04:00 (2시간)

■ 점검 내용
- 데이터베이스 성능 최적화
- 서버 보안 패치 적용
- 캐시 서버 업그레이드

■ 점검 중 이용 불가 서비스
- 앱 전체 서비스 (로그인 포함)

점검 시간 동안 서비스 이용에 불편을 드려 대단히 죄송합니다.
빠른 시간 내에 점검을 완료하겠습니다. 감사합니다.''',
  ),
  NoticePost(
    id: '4',
    title: '커뮤니티 이용 규칙 안내',
    author: '운영자',
    createdAt: DateTime.now().subtract(const Duration(days: 7)),
    category: '공지',
    isPinned: true,
    viewCount: 3850,
    commentCount: 0,
    body: '''건강한 커뮤니티 문화를 위해 아래 규칙을 준수해 주시기 바랍니다.

1. 타인에 대한 비방 및 욕설 금지
2. 허위 정보 유포 금지
3. 개인정보 노출 금지
4. 홍보성 게시글 작성 금지
5. 저작권 침해 콘텐츠 게시 금지

규칙 위반 시 경고 없이 계정이 정지될 수 있습니다.
더 나은 커뮤니티를 위해 협조해 주셔서 감사합니다.''',
  ),
  NoticePost(
    id: '2',
    title: '3월 이벤트: 리뷰 작성하고 커피 쿠폰 받아가세요!',
    author: '마케팅팀',
    createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
    category: '이벤트',
    isNew: true,
    viewCount: 430,
    commentCount: 12,
    body: '''안녕하세요! 3월을 맞이해 특별한 이벤트를 준비했습니다.

■ 이벤트 기간
2024년 3월 1일 ~ 3월 31일

■ 참여 방법
1. 앱 내 서비스 이용 후 리뷰 작성
2. 별점 4점 이상 + 50자 이상 리뷰 필수
3. 리뷰 작성 완료 후 자동 쿠폰 발급

■ 혜택
- 스타벅스 아메리카노 쿠폰 (선착순 500명)
- 추가로 베스트 리뷰 선정 시 상품권 1만원 증정

많은 참여 부탁드립니다!''',
  ),
  NoticePost(
    id: '5',
    title: '앱 v2.3 업데이트 — 다크모드 & 성능 개선',
    author: '개발팀',
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    category: '업데이트',
    isNew: true,
    viewCount: 892,
    commentCount: 7,
    body: '''v2.3 업데이트가 배포되었습니다.

■ 주요 변경사항

[신규 기능]
- 다크 모드 지원 (시스템 설정 연동)
- 게시글 검색 기능 추가
- 댓글 좋아요 기능 추가

[개선]
- 이미지 로딩 속도 약 40% 향상
- 스크롤 애니메이션 최적화
- 메모리 사용량 개선

[버그 수정]
- 특정 기기에서 알림이 오지 않던 문제 수정
- 댓글 작성 시 키보드가 내려가던 문제 수정

업데이트 후 불편사항이 있으시면 고객센터로 문의해 주세요.''',
  ),
  NoticePost(
    id: '3',
    title: '개인정보 처리방침 변경 안내',
    author: '법무팀',
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
    category: '안내',
    viewCount: 620,
    commentCount: 1,
    body: '''개인정보 처리방침이 아래와 같이 변경됩니다.

■ 시행일: 2024년 4월 1일

■ 주요 변경 내용
- 개인정보 보유 기간 명확화
- 제3자 제공 항목 업데이트
- 이용자 권리 행사 방법 구체화

변경된 방침은 시행일로부터 적용되며, 이전 방침은 아카이브에서 확인하실 수 있습니다.

문의사항은 privacy@example.com으로 연락해 주세요.''',
  ),
  NoticePost(
    id: '6',
    title: '자주 묻는 질문 (FAQ) 업데이트',
    author: '고객지원팀',
    createdAt: DateTime.now().subtract(const Duration(days: 14)),
    category: '자료',
    viewCount: 2130,
    commentCount: 0,
    body: '''자주 묻는 질문 목록을 업데이트했습니다.

Q. 비밀번호를 잊었어요.
A. 로그인 화면의 "비밀번호 찾기"를 통해 재설정하실 수 있습니다.

Q. 회원 탈퇴는 어떻게 하나요?
A. 설정 > 계정 > 회원 탈퇴 순서로 진행하시면 됩니다.
   탈퇴 후 30일간 데이터가 보관되며, 이후 영구 삭제됩니다.

Q. 알림이 오지 않아요.
A. 기기 설정에서 앱 알림 권한을 확인해 주세요.
   설정 > 앱 > 알림 허용

Q. 결제 취소는 어떻게 하나요?
A. 결제일로부터 7일 이내에 고객센터로 문의해 주세요.''',
  ),
];

final sampleComments = <String, List<NoticeComment>>{
  '1': [
    NoticeComment(
      id: 'c1',
      author: '홍길동',
      body: '점검 공지 감사합니다. 미리 알려주셔서 준비할 수 있었어요!',
      createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
    ),
    NoticeComment(
      id: 'c2',
      author: '김민지',
      body: '새벽 시간대라 다행이에요. 빠른 점검 부탁드립니다 :)',
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    NoticeComment(
      id: 'c3',
      author: '이준혁',
      body: '항상 서비스 개선을 위해 노력해주셔서 감사합니다.',
      createdAt: DateTime.now().subtract(const Duration(minutes: 40)),
    ),
  ],
  '2': [
    NoticeComment(
      id: 'c4',
      author: '박서연',
      body: '이벤트 참여했어요! 쿠폰 언제 발급되나요?',
      createdAt: DateTime.now().subtract(const Duration(minutes: 20)),
    ),
    NoticeComment(
      id: 'c5',
      author: '최현우',
      body: '리뷰 작성 완료했는데 쿠폰이 바로 오는 건가요?',
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
  ],
  '5': [
    NoticeComment(
      id: 'c6',
      author: '정유나',
      body: '다크모드 너무 좋아요! 눈이 편해졌어요.',
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    ),
    NoticeComment(
      id: 'c7',
      author: '강도현',
      body: '이미지 로딩이 확실히 빨라진 것 같아요. 수고하셨습니다!',
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    NoticeComment(
      id: 'c8',
      author: '윤서희',
      body: '검색 기능 기다리고 있었는데 드디어 나왔네요!',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
  ],
  '3': [
    NoticeComment(
      id: 'c9',
      author: '임태양',
      body: '개인정보 처리방침 변경 내용 잘 확인했습니다.',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ],
};
