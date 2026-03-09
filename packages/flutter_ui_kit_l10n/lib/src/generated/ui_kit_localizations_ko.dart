// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ui_kit_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class UiKitLocalizationsKo extends UiKitLocalizations {
  UiKitLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get ok => '확인';

  @override
  String get cancel => '취소';

  @override
  String get confirm => '확인';

  @override
  String get save => '저장';

  @override
  String get delete => '삭제';

  @override
  String get edit => '편집';

  @override
  String get close => '닫기';

  @override
  String get back => '뒤로';

  @override
  String get next => '다음';

  @override
  String get done => '완료';

  @override
  String get loading => '로딩 중...';

  @override
  String get error => '오류가 발생했습니다';

  @override
  String errorWithContext(String context) {
    return '$context 오류가 발생했습니다';
  }

  @override
  String get retry => '다시 시도';

  @override
  String get search => '검색';

  @override
  String get addItem => '항목 추가';

  @override
  String get yes => '예';

  @override
  String get no => '아니오';

  @override
  String get submit => '제출';

  @override
  String get apply => '적용';

  @override
  String get reset => '초기화';

  @override
  String get refresh => '새로고침';

  @override
  String get share => '공유';

  @override
  String get copy => '복사';

  @override
  String get paste => '붙여넣기';

  @override
  String get undo => '실행 취소';

  @override
  String get redo => '다시 실행';

  @override
  String get selectAll => '전체 선택';

  @override
  String get select => '선택';

  @override
  String get deselect => '선택 해제';

  @override
  String get add => '추가';

  @override
  String get remove => '제거';

  @override
  String get create => '생성';

  @override
  String get update => '수정';

  @override
  String get send => '전송';

  @override
  String get upload => '업로드';

  @override
  String get download => '다운로드';

  @override
  String get open => '열기';

  @override
  String get preview => '미리보기';

  @override
  String get filter => '필터';

  @override
  String get sort => '정렬';

  @override
  String get more => '더 보기';

  @override
  String get showMore => '더 보기';

  @override
  String get showLess => '접기';

  @override
  String get seeAll => '전체 보기';

  @override
  String get viewDetails => '상세 보기';

  @override
  String get previous => '이전';

  @override
  String get skip => '건너뛰기';

  @override
  String get finish => '마침';

  @override
  String get continueAction => '계속';

  @override
  String get start => '시작';

  @override
  String get stop => '중지';

  @override
  String get pause => '일시정지';

  @override
  String get resume => '재개';

  @override
  String get enable => '활성화';

  @override
  String get disable => '비활성화';

  @override
  String get on => '켜짐';

  @override
  String get off => '꺼짐';

  @override
  String get all => '전체';

  @override
  String get none => '없음';

  @override
  String get selected => '선택됨';

  @override
  String get required => '필수';

  @override
  String get optional => '선택';

  @override
  String get details => '상세';

  @override
  String get description => '설명';

  @override
  String get title => '제목';

  @override
  String get name => '이름';

  @override
  String get date => '날짜';

  @override
  String get time => '시간';

  @override
  String get status => '상태';

  @override
  String get category => '카테고리';

  @override
  String get tags => '태그';

  @override
  String get favorite => '즐겨찾기';

  @override
  String get favorites => '즐겨찾기';

  @override
  String get bookmark => '북마크';

  @override
  String get like => '좋아요';

  @override
  String get comment => '댓글';

  @override
  String get comments => '댓글';

  @override
  String get reply => '답글';

  @override
  String get report => '신고';

  @override
  String get block => '차단';

  @override
  String get unblock => '차단 해제';

  @override
  String get mute => '음소거';

  @override
  String get unmute => '음소거 해제';

  @override
  String get pin => '고정';

  @override
  String get unpin => '고정 해제';

  @override
  String get archive => '보관';

  @override
  String get hide => '숨기기';

  @override
  String get show => '표시';

  @override
  String get expand => '펼치기';

  @override
  String get collapse => '접기';

  @override
  String get attach => '첨부';

  @override
  String get accept => '수락';

  @override
  String get decline => '거절';

  @override
  String get approve => '승인';

  @override
  String get reject => '반려';

  @override
  String get pending => '대기 중';

  @override
  String get active => '활성';

  @override
  String get inactive => '비활성';

  @override
  String get completed => '완료됨';

  @override
  String get inProgress => '진행 중';

  @override
  String get draft => '임시저장';

  @override
  String get public => '공개';

  @override
  String get private => '비공개';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 항목',
      zero: '항목 없음',
    );
    return '$_temp0';
  }

  @override
  String selectedCount(int count) {
    return '$count개 선택됨';
  }

  @override
  String get searchHint => '검색...';

  @override
  String get noResults => '검색 결과가 없습니다';

  @override
  String get noData => '데이터가 없습니다';

  @override
  String get empty => '비어 있음';

  @override
  String get success => '성공';

  @override
  String get warning => '경고';

  @override
  String get info => '정보';

  @override
  String get help => '도움말';

  @override
  String get about => '정보';

  @override
  String get version => '버전';

  @override
  String get home => '홈';

  @override
  String get notifications => '알림';

  @override
  String get messages => '메시지';

  @override
  String get profile => '프로필';

  @override
  String get camera => '카메라';

  @override
  String get gallery => '갤러리';

  @override
  String get photo => '사진';

  @override
  String get video => '동영상';

  @override
  String get file => '파일';

  @override
  String get location => '위치';

  @override
  String get contacts => '연락처';

  @override
  String get invite => '초대';

  @override
  String get join => '참여';

  @override
  String get leave => '나가기';

  @override
  String get follow => '팔로우';

  @override
  String get unfollow => '팔로우 해제';

  @override
  String get followers => '팔로워';

  @override
  String get following => '팔로잉';

  @override
  String get recent => '최근';

  @override
  String get popular => '인기';

  @override
  String get trending => '트렌딩';

  @override
  String get recommended => '추천';

  @override
  String get free => '무료';

  @override
  String get premium => '프리미엄';

  @override
  String get upgrade => '업그레이드';

  @override
  String get learnMore => '자세히 알아보기';

  @override
  String get getStarted => '시작하기';

  @override
  String get tryAgain => '다시 시도';

  @override
  String get goBack => '돌아가기';

  @override
  String get settings => '설정';

  @override
  String get settingsLanguage => '언어';

  @override
  String get settingsTheme => '테마';

  @override
  String get settingsAccount => '계정';

  @override
  String get settingsNotifications => '알림';

  @override
  String get settingsProfile => '프로필';

  @override
  String get settingsLogout => '로그아웃';

  @override
  String get settingsGeneral => '일반';

  @override
  String get settingsAppearance => '외관';

  @override
  String get settingsDarkMode => '다크 모드';

  @override
  String get settingsLightMode => '라이트 모드';

  @override
  String get settingsSystemDefault => '시스템 기본값';

  @override
  String get settingsPrivacy => '개인정보';

  @override
  String get settingsSecurity => '보안';

  @override
  String get settingsHelp => '도움말';

  @override
  String get settingsAbout => '정보';

  @override
  String get settingsVersion => '버전';

  @override
  String get settingsSound => '소리';

  @override
  String get settingsVibration => '진동';

  @override
  String get settingsStorage => '저장소';

  @override
  String get settingsCache => '캐시';

  @override
  String get settingsClearCache => '캐시 삭제';

  @override
  String get settingsDeleteAccount => '계정 삭제';

  @override
  String get settingsFeedback => '피드백';

  @override
  String get settingsRateApp => '앱 평가';

  @override
  String get settingsTermsOfService => '이용약관';

  @override
  String get settingsPrivacyPolicy => '개인정보 처리방침';

  @override
  String get settingsContactUs => '문의하기';

  @override
  String get settingsDisplay => '디스플레이';

  @override
  String get settingsFontSize => '글꼴 크기';

  @override
  String get settingsAutoUpdate => '자동 업데이트';

  @override
  String get settingsDataUsage => '데이터 사용량';

  @override
  String get settingsBackup => '백업';

  @override
  String get settingsRestore => '복원';

  @override
  String get settingsResetAll => '모든 설정 초기화';

  @override
  String get settingsAccessibility => '접근성';

  @override
  String get settingsDoNotDisturb => '방해 금지';

  @override
  String get settingsLocationServices => '위치 서비스';

  @override
  String get settingsPermissions => '권한';

  @override
  String get settingsLicenses => '라이선스';

  @override
  String get settingsChangePassword => '비밀번호 변경';

  @override
  String get settingsTwoFactor => '2단계 인증';

  @override
  String get settingsBiometrics => '생체 인증 로그인';

  @override
  String get settingsAutoLock => '자동 잠금';

  @override
  String get areYouSure => '정말요?';

  @override
  String get deleteConfirmTitle => '삭제';

  @override
  String get deleteConfirmMessage => '정말 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.';

  @override
  String get unsavedChanges => '저장되지 않은 변경사항이 있습니다';

  @override
  String get unsavedChangesMessage => '나가기 전에 변경사항을 저장하시겠습니까?';

  @override
  String get discardChanges => '변경사항 버리기';

  @override
  String get saveChanges => '변경사항 저장';

  @override
  String get copiedToClipboard => '클립보드에 복사됨';

  @override
  String get noInternetConnection => '인터넷 연결 없음';

  @override
  String get checkConnection => '인터넷 연결을 확인하고 다시 시도해 주세요.';

  @override
  String get tryAgainLater => '나중에 다시 시도해 주세요';

  @override
  String get somethingWentWrong => '문제가 발생했습니다';

  @override
  String get permissionDenied => '권한이 거부되었습니다';

  @override
  String get accessDenied => '접근이 거부되었습니다';

  @override
  String get notFound => '찾을 수 없음';

  @override
  String get pageNotFound => '페이지를 찾을 수 없습니다';

  @override
  String get comingSoon => '곧 출시 예정';

  @override
  String get underMaintenance => '점검 중';

  @override
  String get updateAvailable => '업데이트 가능';

  @override
  String get updateNow => '지금 업데이트';

  @override
  String get later => '나중에';

  @override
  String get welcomeBack => '다시 오신 것을 환영합니다';

  @override
  String get welcome => '환영합니다';

  @override
  String get goodbye => '안녕히 가세요';

  @override
  String get thankYou => '감사합니다';

  @override
  String get congratulations => '축하합니다!';

  @override
  String get savedSuccessfully => '저장되었습니다';

  @override
  String get deletedSuccessfully => '삭제되었습니다';

  @override
  String get updatedSuccessfully => '수정되었습니다';

  @override
  String get sentSuccessfully => '전송되었습니다';

  @override
  String get uploadedSuccessfully => '업로드되었습니다';

  @override
  String get downloadComplete => '다운로드 완료';

  @override
  String get operationFailed => '작업에 실패했습니다';

  @override
  String get sessionExpired => '세션이 만료되었습니다';

  @override
  String get sessionExpiredMessage => '세션이 만료되었습니다. 다시 로그인해 주세요.';

  @override
  String get timeout => '요청 시간이 초과되었습니다';

  @override
  String get serverError => '서버 오류';

  @override
  String get networkError => '네트워크 오류';

  @override
  String get unknownError => '알 수 없는 오류';

  @override
  String get pullToRefresh => '당겨서 새로고침';

  @override
  String get releaseToRefresh => '놓으면 새로고침';

  @override
  String get loadingMore => '더 불러오는 중...';

  @override
  String get noMoreItems => '더 이상 항목이 없습니다';

  @override
  String get emptyHere => '여기는 비어 있습니다';

  @override
  String get nothingToShow => '표시할 내용이 없습니다';

  @override
  String get getStartedMessage => '첫 번째 항목을 추가하여 시작하세요';

  @override
  String get tapToRetry => '탭하여 다시 시도';

  @override
  String get swipeToDelete => '밀어서 삭제';

  @override
  String get logoutConfirmTitle => '로그아웃';

  @override
  String get logoutConfirmMessage => '정말 로그아웃하시겠습니까?';

  @override
  String get deleteAccountConfirmMessage =>
      '정말 계정을 삭제하시겠습니까? 이 작업은 영구적이며 되돌릴 수 없습니다.';

  @override
  String get termsAgreement => '계속 진행하면 이용약관 및 개인정보 처리방침에 동의하는 것으로 간주됩니다.';

  @override
  String poweredBy(String name) {
    return 'Powered by $name';
  }

  @override
  String version_info(String version) {
    return '버전 $version';
  }

  @override
  String lastUpdated(String date) {
    return '최종 수정: $date';
  }

  @override
  String createdBy(String name) {
    return '$name 작성';
  }

  @override
  String get login => '로그인';

  @override
  String get logout => '로그아웃';

  @override
  String get signUp => '회원가입';

  @override
  String get signIn => '로그인';

  @override
  String get signOut => '로그아웃';

  @override
  String get register => '가입하기';

  @override
  String get email => '이메일';

  @override
  String get password => '비밀번호';

  @override
  String get confirmPassword => '비밀번호 확인';

  @override
  String get currentPassword => '현재 비밀번호';

  @override
  String get newPassword => '새 비밀번호';

  @override
  String get username => '사용자 이름';

  @override
  String get phoneNumber => '전화번호';

  @override
  String get forgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get resetPassword => '비밀번호 재설정';

  @override
  String get changePassword => '비밀번호 변경';

  @override
  String get rememberMe => '로그인 상태 유지';

  @override
  String get staySignedIn => '로그인 유지';

  @override
  String get orContinueWith => '또는 다음으로 계속';

  @override
  String get signInWithGoogle => 'Google로 로그인';

  @override
  String get signInWithApple => 'Apple로 로그인';

  @override
  String get signInWithFacebook => 'Facebook으로 로그인';

  @override
  String get createAccount => '계정 만들기';

  @override
  String get alreadyHaveAccount => '이미 계정이 있으신가요?';

  @override
  String get dontHaveAccount => '계정이 없으신가요?';

  @override
  String get verificationCode => '인증 코드';

  @override
  String get sendCode => '코드 전송';

  @override
  String get resendCode => '코드 재전송';

  @override
  String get verifyEmail => '이메일 인증';

  @override
  String get verifyPhone => '전화번호 인증';

  @override
  String get resetPasswordSent => '비밀번호 재설정 이메일이 전송되었습니다';

  @override
  String get resetPasswordInstruction => '이메일을 입력하시면 비밀번호 재설정 링크를 보내드립니다.';

  @override
  String get accountCreated => '계정이 생성되었습니다';

  @override
  String get loginFailed => '로그인 실패';

  @override
  String get invalidCredentials => '이메일 또는 비밀번호가 올바르지 않습니다';

  @override
  String get accountLocked => '계정이 잠겼습니다';

  @override
  String get accountDeactivated => '계정이 비활성화되었습니다';

  @override
  String get passwordChanged => '비밀번호가 변경되었습니다';

  @override
  String get profileUpdated => '프로필이 수정되었습니다';

  @override
  String get firstName => '이름';

  @override
  String get lastName => '성';

  @override
  String get displayName => '표시 이름';

  @override
  String get bio => '소개';

  @override
  String get birthday => '생년월일';

  @override
  String get gender => '성별';

  @override
  String get male => '남성';

  @override
  String get female => '여성';

  @override
  String get other => '기타';

  @override
  String get preferNotToSay => '밝히고 싶지 않음';

  @override
  String get editProfile => '프로필 편집';

  @override
  String get changeProfilePhoto => '프로필 사진 변경';

  @override
  String get deleteAccount => '계정 삭제';

  @override
  String get fieldRequired => '이 필드는 필수입니다';

  @override
  String fieldRequiredNamed(String field) {
    return '$field은(는) 필수입니다';
  }

  @override
  String get invalidEmail => '올바른 이메일 주소를 입력해 주세요';

  @override
  String get invalidPhone => '올바른 전화번호를 입력해 주세요';

  @override
  String get invalidUrl => '올바른 URL을 입력해 주세요';

  @override
  String passwordTooShort(int min) {
    return '비밀번호는 최소 $min자 이상이어야 합니다';
  }

  @override
  String get passwordTooWeak => '비밀번호가 너무 약합니다';

  @override
  String get passwordRequirements => '비밀번호는 대문자, 소문자, 숫자를 각각 하나 이상 포함해야 합니다';

  @override
  String get passwordsDoNotMatch => '비밀번호가 일치하지 않습니다';

  @override
  String get invalidInput => '잘못된 입력입니다';

  @override
  String tooShort(int min) {
    return '최소 $min자 이상이어야 합니다';
  }

  @override
  String tooLong(int max) {
    return '최대 $max자까지 입력할 수 있습니다';
  }

  @override
  String characterCount(int current, int max) {
    return '$current/$max';
  }

  @override
  String minValue(String min) {
    return '최솟값은 $min입니다';
  }

  @override
  String maxValue(String max) {
    return '최댓값은 $max입니다';
  }

  @override
  String get invalidFormat => '형식이 올바르지 않습니다';

  @override
  String get onlyNumbers => '숫자만 입력할 수 있습니다';

  @override
  String get onlyLetters => '문자만 입력할 수 있습니다';

  @override
  String get noSpecialCharacters => '특수문자는 사용할 수 없습니다';

  @override
  String alreadyExists(String field) {
    return '$field이(가) 이미 존재합니다';
  }

  @override
  String notAvailable(String field) {
    return '$field을(를) 사용할 수 없습니다';
  }

  @override
  String get invalidDate => '올바른 날짜를 입력해 주세요';

  @override
  String dateTooEarly(String date) {
    return '$date 이후 날짜를 입력해 주세요';
  }

  @override
  String dateTooLate(String date) {
    return '$date 이전 날짜를 입력해 주세요';
  }

  @override
  String fileTooLarge(String size) {
    return '파일 크기가 $size 미만이어야 합니다';
  }

  @override
  String get unsupportedFileType => '지원하지 않는 파일 형식입니다';

  @override
  String maxItemsReached(int max) {
    return '최대 $max개까지 추가할 수 있습니다';
  }

  @override
  String get pleaseFixErrors => '위의 오류를 수정해 주세요';

  @override
  String get allFieldsRequired => '모든 필드는 필수입니다';

  @override
  String get today => '오늘';

  @override
  String get yesterday => '어제';

  @override
  String get tomorrow => '내일';

  @override
  String get now => '지금';

  @override
  String get justNow => '방금';

  @override
  String minutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count분 전',
    );
    return '$_temp0';
  }

  @override
  String hoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count시간 전',
    );
    return '$_temp0';
  }

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count일 전',
    );
    return '$_temp0';
  }

  @override
  String weeksAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count주 전',
    );
    return '$_temp0';
  }

  @override
  String monthsAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개월 전',
    );
    return '$_temp0';
  }

  @override
  String yearsAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count년 전',
    );
    return '$_temp0';
  }

  @override
  String inMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count분 후',
    );
    return '$_temp0';
  }

  @override
  String inHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count시간 후',
    );
    return '$_temp0';
  }

  @override
  String inDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count일 후',
    );
    return '$_temp0';
  }

  @override
  String get seconds => '초';

  @override
  String get minutes => '분';

  @override
  String get hours => '시간';

  @override
  String get days => '일';

  @override
  String get weeks => '주';

  @override
  String get months => '개월';

  @override
  String get years => '년';

  @override
  String get monday => '월요일';

  @override
  String get tuesday => '화요일';

  @override
  String get wednesday => '수요일';

  @override
  String get thursday => '목요일';

  @override
  String get friday => '금요일';

  @override
  String get saturday => '토요일';

  @override
  String get sunday => '일요일';

  @override
  String get monShort => '월';

  @override
  String get tueShort => '화';

  @override
  String get wedShort => '수';

  @override
  String get thuShort => '목';

  @override
  String get friShort => '금';

  @override
  String get satShort => '토';

  @override
  String get sunShort => '일';

  @override
  String get am => '오전';

  @override
  String get pm => '오후';

  @override
  String get startDate => '시작일';

  @override
  String get endDate => '종료일';

  @override
  String get startTime => '시작 시간';

  @override
  String get endTime => '종료 시간';

  @override
  String get duration => '기간';

  @override
  String get allDay => '종일';

  @override
  String get fromDate => '시작';

  @override
  String get toDate => '종료';

  @override
  String get selectDate => '날짜 선택';

  @override
  String get selectTime => '시간 선택';

  @override
  String get pickDate => '날짜를 선택하세요';

  @override
  String get pickTime => '시간을 선택하세요';

  @override
  String get noDateSelected => '날짜를 선택하지 않았습니다';

  @override
  String get noTimeSelected => '시간을 선택하지 않았습니다';

  @override
  String get deadline => '마감일';

  @override
  String get reminder => '알림';

  @override
  String get schedule => '일정';

  @override
  String get calendar => '캘린더';

  @override
  String get event => '이벤트';

  @override
  String get events => '이벤트';
}
