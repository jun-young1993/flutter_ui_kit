import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'ui_kit_localizations_en.dart';
import 'ui_kit_localizations_ja.dart';
import 'ui_kit_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of UiKitLocalizations
/// returned by `UiKitLocalizations.of(context)`.
///
/// Applications need to include `UiKitLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/ui_kit_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: UiKitLocalizations.localizationsDelegates,
///   supportedLocales: UiKitLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the UiKitLocalizations.supportedLocales
/// property.
abstract class UiKitLocalizations {
  UiKitLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static UiKitLocalizations of(BuildContext context) {
    return Localizations.of<UiKitLocalizations>(context, UiKitLocalizations)!;
  }

  static const LocalizationsDelegate<UiKitLocalizations> delegate =
      _UiKitLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
    Locale('ja'),
  ];

  /// Generic OK/Confirm button label
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Generic Cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Generic Confirm action label
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Generic Save action label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Generic Delete action label
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Generic Edit action label
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Generic Close action label
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Generic Back navigation label
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Generic Next navigation label
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Generic Done action label
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Loading state indicator text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get error;

  /// Error message with context prefix (e.g. Server error occurred)
  ///
  /// In en, this message translates to:
  /// **'{context} error occurred'**
  String errorWithContext(String context);

  /// Retry action label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Search action/placeholder label
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Generic add item action label
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get addItem;

  /// Settings screen title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Language setting option label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// Theme setting option label
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// Account setting option label
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccount;

  /// Notifications setting option label
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// Profile setting option label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get settingsProfile;

  /// Logout action label
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get settingsLogout;
}

class _UiKitLocalizationsDelegate
    extends LocalizationsDelegate<UiKitLocalizations> {
  const _UiKitLocalizationsDelegate();

  @override
  Future<UiKitLocalizations> load(Locale locale) {
    return SynchronousFuture<UiKitLocalizations>(
      lookupUiKitLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_UiKitLocalizationsDelegate old) => false;
}

UiKitLocalizations lookupUiKitLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return UiKitLocalizationsEn();
    case 'ja':
      return UiKitLocalizationsJa();
    case 'ko':
      return UiKitLocalizationsKo();
  }

  throw FlutterError(
    'UiKitLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
