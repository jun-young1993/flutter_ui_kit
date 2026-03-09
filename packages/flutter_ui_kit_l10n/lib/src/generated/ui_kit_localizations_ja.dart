// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ui_kit_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class UiKitLocalizationsJa extends UiKitLocalizations {
  UiKitLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get confirm => '確認';

  @override
  String get save => '保存';

  @override
  String get delete => '削除';

  @override
  String get edit => '編集';

  @override
  String get close => '閉じる';

  @override
  String get back => '戻る';

  @override
  String get next => '次へ';

  @override
  String get done => '完了';

  @override
  String get loading => '読み込み中...';

  @override
  String get error => 'エラーが発生しました';

  @override
  String errorWithContext(String context) {
    return '$contextエラーが発生しました';
  }

  @override
  String get retry => '再試行';

  @override
  String get search => '検索';

  @override
  String get addItem => 'アイテムを追加';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get submit => '送信';

  @override
  String get apply => '適用';

  @override
  String get reset => 'リセット';

  @override
  String get refresh => '更新';

  @override
  String get share => '共有';

  @override
  String get copy => 'コピー';

  @override
  String get paste => '貼り付け';

  @override
  String get undo => '元に戻す';

  @override
  String get redo => 'やり直す';

  @override
  String get selectAll => 'すべて選択';

  @override
  String get select => '選択';

  @override
  String get deselect => '選択解除';

  @override
  String get add => '追加';

  @override
  String get remove => '削除';

  @override
  String get create => '作成';

  @override
  String get update => '更新';

  @override
  String get send => '送信';

  @override
  String get upload => 'アップロード';

  @override
  String get download => 'ダウンロード';

  @override
  String get open => '開く';

  @override
  String get preview => 'プレビュー';

  @override
  String get filter => 'フィルター';

  @override
  String get sort => '並べ替え';

  @override
  String get more => 'もっと見る';

  @override
  String get showMore => 'もっと見る';

  @override
  String get showLess => '閉じる';

  @override
  String get seeAll => 'すべて見る';

  @override
  String get viewDetails => '詳細を見る';

  @override
  String get previous => '前へ';

  @override
  String get skip => 'スキップ';

  @override
  String get finish => '完了';

  @override
  String get continueAction => '続ける';

  @override
  String get start => '開始';

  @override
  String get stop => '停止';

  @override
  String get pause => '一時停止';

  @override
  String get resume => '再開';

  @override
  String get enable => '有効';

  @override
  String get disable => '無効';

  @override
  String get on => 'オン';

  @override
  String get off => 'オフ';

  @override
  String get all => 'すべて';

  @override
  String get none => 'なし';

  @override
  String get selected => '選択済み';

  @override
  String get required => '必須';

  @override
  String get optional => '任意';

  @override
  String get details => '詳細';

  @override
  String get description => '説明';

  @override
  String get title => 'タイトル';

  @override
  String get name => '名前';

  @override
  String get date => '日付';

  @override
  String get time => '時間';

  @override
  String get status => 'ステータス';

  @override
  String get category => 'カテゴリ';

  @override
  String get tags => 'タグ';

  @override
  String get favorite => 'お気に入り';

  @override
  String get favorites => 'お気に入り';

  @override
  String get bookmark => 'ブックマーク';

  @override
  String get like => 'いいね';

  @override
  String get comment => 'コメント';

  @override
  String get comments => 'コメント';

  @override
  String get reply => '返信';

  @override
  String get report => '報告';

  @override
  String get block => 'ブロック';

  @override
  String get unblock => 'ブロック解除';

  @override
  String get mute => 'ミュート';

  @override
  String get unmute => 'ミュート解除';

  @override
  String get pin => 'ピン留め';

  @override
  String get unpin => 'ピン留め解除';

  @override
  String get archive => 'アーカイブ';

  @override
  String get hide => '非表示';

  @override
  String get show => '表示';

  @override
  String get expand => '展開';

  @override
  String get collapse => '折りたたむ';

  @override
  String get attach => '添付';

  @override
  String get accept => '承認';

  @override
  String get decline => '辞退';

  @override
  String get approve => '承認';

  @override
  String get reject => '却下';

  @override
  String get pending => '保留中';

  @override
  String get active => 'アクティブ';

  @override
  String get inactive => '非アクティブ';

  @override
  String get completed => '完了';

  @override
  String get inProgress => '進行中';

  @override
  String get draft => '下書き';

  @override
  String get public => '公開';

  @override
  String get private => '非公開';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のアイテム',
      zero: 'アイテムなし',
    );
    return '$_temp0';
  }

  @override
  String selectedCount(int count) {
    return '$count件選択済み';
  }

  @override
  String get searchHint => '検索...';

  @override
  String get noResults => '検索結果がありません';

  @override
  String get noData => 'データがありません';

  @override
  String get empty => '空';

  @override
  String get success => '成功';

  @override
  String get warning => '警告';

  @override
  String get info => '情報';

  @override
  String get help => 'ヘルプ';

  @override
  String get about => '概要';

  @override
  String get version => 'バージョン';

  @override
  String get home => 'ホーム';

  @override
  String get notifications => '通知';

  @override
  String get messages => 'メッセージ';

  @override
  String get profile => 'プロフィール';

  @override
  String get camera => 'カメラ';

  @override
  String get gallery => 'ギャラリー';

  @override
  String get photo => '写真';

  @override
  String get video => '動画';

  @override
  String get file => 'ファイル';

  @override
  String get location => '位置情報';

  @override
  String get contacts => '連絡先';

  @override
  String get invite => '招待';

  @override
  String get join => '参加';

  @override
  String get leave => '退出';

  @override
  String get follow => 'フォロー';

  @override
  String get unfollow => 'フォロー解除';

  @override
  String get followers => 'フォロワー';

  @override
  String get following => 'フォロー中';

  @override
  String get recent => '最近';

  @override
  String get popular => '人気';

  @override
  String get trending => 'トレンド';

  @override
  String get recommended => 'おすすめ';

  @override
  String get free => '無料';

  @override
  String get premium => 'プレミアム';

  @override
  String get upgrade => 'アップグレード';

  @override
  String get learnMore => '詳しく見る';

  @override
  String get getStarted => '始める';

  @override
  String get tryAgain => 'もう一度試す';

  @override
  String get goBack => '戻る';

  @override
  String get settings => '設定';

  @override
  String get settingsLanguage => '言語';

  @override
  String get settingsTheme => 'テーマ';

  @override
  String get settingsAccount => 'アカウント';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsProfile => 'プロフィール';

  @override
  String get settingsLogout => 'ログアウト';

  @override
  String get settingsGeneral => '一般';

  @override
  String get settingsAppearance => '外観';

  @override
  String get settingsDarkMode => 'ダークモード';

  @override
  String get settingsLightMode => 'ライトモード';

  @override
  String get settingsSystemDefault => 'システムデフォルト';

  @override
  String get settingsPrivacy => 'プライバシー';

  @override
  String get settingsSecurity => 'セキュリティ';

  @override
  String get settingsHelp => 'ヘルプ';

  @override
  String get settingsAbout => 'アプリについて';

  @override
  String get settingsVersion => 'バージョン';

  @override
  String get settingsSound => 'サウンド';

  @override
  String get settingsVibration => 'バイブレーション';

  @override
  String get settingsStorage => 'ストレージ';

  @override
  String get settingsCache => 'キャッシュ';

  @override
  String get settingsClearCache => 'キャッシュを削除';

  @override
  String get settingsDeleteAccount => 'アカウントを削除';

  @override
  String get settingsFeedback => 'フィードバック';

  @override
  String get settingsRateApp => 'アプリを評価';

  @override
  String get settingsTermsOfService => '利用規約';

  @override
  String get settingsPrivacyPolicy => 'プライバシーポリシー';

  @override
  String get settingsContactUs => 'お問い合わせ';

  @override
  String get settingsDisplay => 'ディスプレイ';

  @override
  String get settingsFontSize => 'フォントサイズ';

  @override
  String get settingsAutoUpdate => '自動更新';

  @override
  String get settingsDataUsage => 'データ使用量';

  @override
  String get settingsBackup => 'バックアップ';

  @override
  String get settingsRestore => '復元';

  @override
  String get settingsResetAll => 'すべての設定をリセット';

  @override
  String get settingsAccessibility => 'アクセシビリティ';

  @override
  String get settingsDoNotDisturb => 'おやすみモード';

  @override
  String get settingsLocationServices => '位置情報サービス';

  @override
  String get settingsPermissions => '権限';

  @override
  String get settingsLicenses => 'ライセンス';

  @override
  String get settingsChangePassword => 'パスワードを変更';

  @override
  String get settingsTwoFactor => '二段階認証';

  @override
  String get settingsBiometrics => '生体認証ログイン';

  @override
  String get settingsAutoLock => '自動ロック';

  @override
  String get areYouSure => 'よろしいですか？';

  @override
  String get deleteConfirmTitle => '削除';

  @override
  String get deleteConfirmMessage => '本当に削除しますか？この操作は元に戻せません。';

  @override
  String get unsavedChanges => '保存されていない変更があります';

  @override
  String get unsavedChangesMessage => '移動する前に変更を保存しますか？';

  @override
  String get discardChanges => '変更を破棄';

  @override
  String get saveChanges => '変更を保存';

  @override
  String get copiedToClipboard => 'クリップボードにコピーしました';

  @override
  String get noInternetConnection => 'インターネット接続がありません';

  @override
  String get checkConnection => 'インターネット接続を確認して再試行してください。';

  @override
  String get tryAgainLater => '後でもう一度お試しください';

  @override
  String get somethingWentWrong => '問題が発生しました';

  @override
  String get permissionDenied => '権限が拒否されました';

  @override
  String get accessDenied => 'アクセスが拒否されました';

  @override
  String get notFound => '見つかりません';

  @override
  String get pageNotFound => 'ページが見つかりません';

  @override
  String get comingSoon => '近日公開';

  @override
  String get underMaintenance => 'メンテナンス中';

  @override
  String get updateAvailable => 'アップデートがあります';

  @override
  String get updateNow => '今すぐアップデート';

  @override
  String get later => '後で';

  @override
  String get welcomeBack => 'おかえりなさい';

  @override
  String get welcome => 'ようこそ';

  @override
  String get goodbye => 'さようなら';

  @override
  String get thankYou => 'ありがとうございます';

  @override
  String get congratulations => 'おめでとうございます！';

  @override
  String get savedSuccessfully => '保存しました';

  @override
  String get deletedSuccessfully => '削除しました';

  @override
  String get updatedSuccessfully => '更新しました';

  @override
  String get sentSuccessfully => '送信しました';

  @override
  String get uploadedSuccessfully => 'アップロードしました';

  @override
  String get downloadComplete => 'ダウンロード完了';

  @override
  String get operationFailed => '操作に失敗しました';

  @override
  String get sessionExpired => 'セッションが切れました';

  @override
  String get sessionExpiredMessage => 'セッションが切れました。再度ログインしてください。';

  @override
  String get timeout => 'リクエストがタイムアウトしました';

  @override
  String get serverError => 'サーバーエラー';

  @override
  String get networkError => 'ネットワークエラー';

  @override
  String get unknownError => '不明なエラー';

  @override
  String get pullToRefresh => '引っ張って更新';

  @override
  String get releaseToRefresh => '離して更新';

  @override
  String get loadingMore => '読み込み中...';

  @override
  String get noMoreItems => 'これ以上アイテムはありません';

  @override
  String get emptyHere => 'ここは空です';

  @override
  String get nothingToShow => '表示するものがありません';

  @override
  String get getStartedMessage => '最初のアイテムを追加して始めましょう';

  @override
  String get tapToRetry => 'タップして再試行';

  @override
  String get swipeToDelete => 'スワイプして削除';

  @override
  String get logoutConfirmTitle => 'ログアウト';

  @override
  String get logoutConfirmMessage => '本当にログアウトしますか？';

  @override
  String get deleteAccountConfirmMessage => '本当にアカウントを削除しますか？この操作は永久的で元に戻せません。';

  @override
  String get termsAgreement => '続行することで、利用規約とプライバシーポリシーに同意したものとみなされます。';

  @override
  String poweredBy(String name) {
    return 'Powered by $name';
  }

  @override
  String version_info(String version) {
    return 'バージョン $version';
  }

  @override
  String lastUpdated(String date) {
    return '最終更新: $date';
  }

  @override
  String createdBy(String name) {
    return '$name 作成';
  }

  @override
  String get login => 'ログイン';

  @override
  String get logout => 'ログアウト';

  @override
  String get signUp => '新規登録';

  @override
  String get signIn => 'サインイン';

  @override
  String get signOut => 'サインアウト';

  @override
  String get register => '登録';

  @override
  String get email => 'メールアドレス';

  @override
  String get password => 'パスワード';

  @override
  String get confirmPassword => 'パスワード確認';

  @override
  String get currentPassword => '現在のパスワード';

  @override
  String get newPassword => '新しいパスワード';

  @override
  String get username => 'ユーザー名';

  @override
  String get phoneNumber => '電話番号';

  @override
  String get forgotPassword => 'パスワードをお忘れですか？';

  @override
  String get resetPassword => 'パスワードをリセット';

  @override
  String get changePassword => 'パスワードを変更';

  @override
  String get rememberMe => 'ログイン状態を保持';

  @override
  String get staySignedIn => 'サインイン状態を保持';

  @override
  String get orContinueWith => 'または次の方法で続ける';

  @override
  String get signInWithGoogle => 'Googleでサインイン';

  @override
  String get signInWithApple => 'Appleでサインイン';

  @override
  String get signInWithFacebook => 'Facebookでサインイン';

  @override
  String get createAccount => 'アカウントを作成';

  @override
  String get alreadyHaveAccount => 'すでにアカウントをお持ちですか？';

  @override
  String get dontHaveAccount => 'アカウントをお持ちでないですか？';

  @override
  String get verificationCode => '認証コード';

  @override
  String get sendCode => 'コードを送信';

  @override
  String get resendCode => 'コードを再送信';

  @override
  String get verifyEmail => 'メールを認証';

  @override
  String get verifyPhone => '電話番号を認証';

  @override
  String get resetPasswordSent => 'パスワードリセットメールを送信しました';

  @override
  String get resetPasswordInstruction =>
      'メールアドレスを入力してください。パスワードリセットリンクをお送りします。';

  @override
  String get accountCreated => 'アカウントが作成されました';

  @override
  String get loginFailed => 'ログインに失敗しました';

  @override
  String get invalidCredentials => 'メールアドレスまたはパスワードが正しくありません';

  @override
  String get accountLocked => 'アカウントがロックされました';

  @override
  String get accountDeactivated => 'アカウントが無効化されました';

  @override
  String get passwordChanged => 'パスワードが変更されました';

  @override
  String get profileUpdated => 'プロフィールが更新されました';

  @override
  String get firstName => '名';

  @override
  String get lastName => '姓';

  @override
  String get displayName => '表示名';

  @override
  String get bio => '自己紹介';

  @override
  String get birthday => '誕生日';

  @override
  String get gender => '性別';

  @override
  String get male => '男性';

  @override
  String get female => '女性';

  @override
  String get other => 'その他';

  @override
  String get preferNotToSay => '回答しない';

  @override
  String get editProfile => 'プロフィールを編集';

  @override
  String get changeProfilePhoto => 'プロフィール写真を変更';

  @override
  String get deleteAccount => 'アカウントを削除';

  @override
  String get fieldRequired => 'この項目は必須です';

  @override
  String fieldRequiredNamed(String field) {
    return '$fieldは必須です';
  }

  @override
  String get invalidEmail => '有効なメールアドレスを入力してください';

  @override
  String get invalidPhone => '有効な電話番号を入力してください';

  @override
  String get invalidUrl => '有効なURLを入力してください';

  @override
  String passwordTooShort(int min) {
    return 'パスワードは$min文字以上必要です';
  }

  @override
  String get passwordTooWeak => 'パスワードが弱すぎます';

  @override
  String get passwordRequirements => 'パスワードには大文字、小文字、数字をそれぞれ1つ以上含める必要があります';

  @override
  String get passwordsDoNotMatch => 'パスワードが一致しません';

  @override
  String get invalidInput => '無効な入力です';

  @override
  String tooShort(int min) {
    return '$min文字以上で入力してください';
  }

  @override
  String tooLong(int max) {
    return '$max文字以内で入力してください';
  }

  @override
  String characterCount(int current, int max) {
    return '$current/$max';
  }

  @override
  String minValue(String min) {
    return '最小値は$minです';
  }

  @override
  String maxValue(String max) {
    return '最大値は$maxです';
  }

  @override
  String get invalidFormat => '形式が正しくありません';

  @override
  String get onlyNumbers => '数字のみ入力できます';

  @override
  String get onlyLetters => '文字のみ入力できます';

  @override
  String get noSpecialCharacters => '特殊文字は使用できません';

  @override
  String alreadyExists(String field) {
    return '$fieldはすでに存在します';
  }

  @override
  String notAvailable(String field) {
    return '$fieldは使用できません';
  }

  @override
  String get invalidDate => '有効な日付を入力してください';

  @override
  String dateTooEarly(String date) {
    return '$dateより後の日付を入力してください';
  }

  @override
  String dateTooLate(String date) {
    return '$dateより前の日付を入力してください';
  }

  @override
  String fileTooLarge(String size) {
    return 'ファイルサイズは$size未満にしてください';
  }

  @override
  String get unsupportedFileType => 'このファイル形式はサポートされていません';

  @override
  String maxItemsReached(int max) {
    return '最大$max個まで追加できます';
  }

  @override
  String get pleaseFixErrors => '上記のエラーを修正してください';

  @override
  String get allFieldsRequired => 'すべての項目は必須です';

  @override
  String get today => '今日';

  @override
  String get yesterday => '昨日';

  @override
  String get tomorrow => '明日';

  @override
  String get now => '今';

  @override
  String get justNow => 'たった今';

  @override
  String minutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分前',
    );
    return '$_temp0';
  }

  @override
  String hoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count時間前',
    );
    return '$_temp0';
  }

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日前',
    );
    return '$_temp0';
  }

  @override
  String weeksAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count週間前',
    );
    return '$_temp0';
  }

  @override
  String monthsAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countヶ月前',
    );
    return '$_temp0';
  }

  @override
  String yearsAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count年前',
    );
    return '$_temp0';
  }

  @override
  String inMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分後',
    );
    return '$_temp0';
  }

  @override
  String inHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count時間後',
    );
    return '$_temp0';
  }

  @override
  String inDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日後',
    );
    return '$_temp0';
  }

  @override
  String get seconds => '秒';

  @override
  String get minutes => '分';

  @override
  String get hours => '時間';

  @override
  String get days => '日';

  @override
  String get weeks => '週';

  @override
  String get months => 'ヶ月';

  @override
  String get years => '年';

  @override
  String get monday => '月曜日';

  @override
  String get tuesday => '火曜日';

  @override
  String get wednesday => '水曜日';

  @override
  String get thursday => '木曜日';

  @override
  String get friday => '金曜日';

  @override
  String get saturday => '土曜日';

  @override
  String get sunday => '日曜日';

  @override
  String get monShort => '月';

  @override
  String get tueShort => '火';

  @override
  String get wedShort => '水';

  @override
  String get thuShort => '木';

  @override
  String get friShort => '金';

  @override
  String get satShort => '土';

  @override
  String get sunShort => '日';

  @override
  String get am => '午前';

  @override
  String get pm => '午後';

  @override
  String get startDate => '開始日';

  @override
  String get endDate => '終了日';

  @override
  String get startTime => '開始時間';

  @override
  String get endTime => '終了時間';

  @override
  String get duration => '期間';

  @override
  String get allDay => '終日';

  @override
  String get fromDate => '開始';

  @override
  String get toDate => '終了';

  @override
  String get selectDate => '日付を選択';

  @override
  String get selectTime => '時間を選択';

  @override
  String get pickDate => '日付を選んでください';

  @override
  String get pickTime => '時間を選んでください';

  @override
  String get noDateSelected => '日付が選択されていません';

  @override
  String get noTimeSelected => '時間が選択されていません';

  @override
  String get deadline => '締め切り';

  @override
  String get reminder => 'リマインダー';

  @override
  String get schedule => 'スケジュール';

  @override
  String get calendar => 'カレンダー';

  @override
  String get event => 'イベント';

  @override
  String get events => 'イベント';
}
