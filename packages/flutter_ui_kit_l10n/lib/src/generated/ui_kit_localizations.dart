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

  /// Error message with context prefix
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

  /// Affirmative response
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// Negative response
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Submit action label
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Apply changes action label
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// Reset to default action label
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// Refresh content action label
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// Share content action label
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// Copy action label
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// Paste action label
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get paste;

  /// Undo action label
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// Redo action label
  ///
  /// In en, this message translates to:
  /// **'Redo'**
  String get redo;

  /// Select all items action label
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectAll;

  /// Select action label
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// Deselect action label
  ///
  /// In en, this message translates to:
  /// **'Deselect'**
  String get deselect;

  /// Add action label
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Remove action label
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// Create action label
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// Update action label
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Send action label
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// Upload file action label
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// Download file action label
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// Open action label
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// Preview action label
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// Filter action label
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// Sort action label
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// More options label
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// Show more content action
  ///
  /// In en, this message translates to:
  /// **'Show More'**
  String get showMore;

  /// Show less content action
  ///
  /// In en, this message translates to:
  /// **'Show Less'**
  String get showLess;

  /// See all items action
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// View details action
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// Previous navigation label
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// Skip action label
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Finish action label
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// Continue action label
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// Start action label
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// Stop action label
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// Pause action label
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// Resume action label
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// Enable toggle label
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// Disable toggle label
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// On state label
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get on;

  /// Off state label
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get off;

  /// All items label
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// None label
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// Selected state label
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get selected;

  /// Required field label
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// Optional field label
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// Details label
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// Description field label
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Title field label
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// Name field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Date field label
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// Time field label
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// Status field label
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// Category field label
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// Tags label
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tags;

  /// Favorite action label
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// Favorites list label
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// Bookmark action label
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get bookmark;

  /// Like action label
  ///
  /// In en, this message translates to:
  /// **'Like'**
  String get like;

  /// Comment label
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment;

  /// Comments label
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// Reply action label
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply;

  /// Report action label
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// Block action label
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get block;

  /// Unblock action label
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get unblock;

  /// Mute action label
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get mute;

  /// Unmute action label
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get unmute;

  /// Pin action label
  ///
  /// In en, this message translates to:
  /// **'Pin'**
  String get pin;

  /// Unpin action label
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get unpin;

  /// Archive action label
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// Hide action label
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// Show action label
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// Expand action label
  ///
  /// In en, this message translates to:
  /// **'Expand'**
  String get expand;

  /// Collapse action label
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get collapse;

  /// Attach file action label
  ///
  /// In en, this message translates to:
  /// **'Attach'**
  String get attach;

  /// Accept action label
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// Decline action label
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decline;

  /// Approve action label
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// Reject action label
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// Pending status label
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// Active status label
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// Inactive status label
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// Completed status label
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// In progress status label
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// Draft status label
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get draft;

  /// Public visibility label
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get public;

  /// Private visibility label
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get private;

  /// Item count with pluralization
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No items} =1{1 item} other{{count} items}}'**
  String itemCount(int count);

  /// Number of selected items
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String selectedCount(int count);

  /// Search input hint text
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searchHint;

  /// Empty search results message
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResults;

  /// Empty data message
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noData;

  /// Empty state label
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// Success status label
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// Warning status label
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// Info status label
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// Help label
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// About label
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Version label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Home navigation label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Notifications label
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Messages label
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// Profile label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Camera label
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// Gallery label
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// Photo label
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get photo;

  /// Video label
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get video;

  /// File label
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get file;

  /// Location label
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Contacts label
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// Invite action label
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get invite;

  /// Join action label
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get join;

  /// Leave action label
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// Follow action label
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// Unfollow action label
  ///
  /// In en, this message translates to:
  /// **'Unfollow'**
  String get unfollow;

  /// Followers label
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get followers;

  /// Following label
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get following;

  /// Recent items label
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// Popular items label
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get popular;

  /// Trending items label
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// Recommended items label
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// Free price label
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// Premium label
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premium;

  /// Upgrade action label
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get upgrade;

  /// Learn more link label
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get learnMore;

  /// Get started action label
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// Try again action label
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// Go back navigation label
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

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

  /// General settings section
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsGeneral;

  /// Appearance settings section
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// Dark mode toggle label
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settingsDarkMode;

  /// Light mode toggle label
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get settingsLightMode;

  /// Follow system theme label
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get settingsSystemDefault;

  /// Privacy settings section
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get settingsPrivacy;

  /// Security settings section
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get settingsSecurity;

  /// Help settings option
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get settingsHelp;

  /// About app option
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// App version label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingsVersion;

  /// Sound settings option
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get settingsSound;

  /// Vibration settings option
  ///
  /// In en, this message translates to:
  /// **'Vibration'**
  String get settingsVibration;

  /// Storage settings option
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get settingsStorage;

  /// Cache settings option
  ///
  /// In en, this message translates to:
  /// **'Cache'**
  String get settingsCache;

  /// Clear cache action label
  ///
  /// In en, this message translates to:
  /// **'Clear Cache'**
  String get settingsClearCache;

  /// Delete account action label
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get settingsDeleteAccount;

  /// Feedback option label
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get settingsFeedback;

  /// Rate app action label
  ///
  /// In en, this message translates to:
  /// **'Rate App'**
  String get settingsRateApp;

  /// Terms of service link label
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get settingsTermsOfService;

  /// Privacy policy link label
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyPolicy;

  /// Contact us option label
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get settingsContactUs;

  /// Display settings section
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get settingsDisplay;

  /// Font size setting option
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get settingsFontSize;

  /// Auto update toggle label
  ///
  /// In en, this message translates to:
  /// **'Auto Update'**
  String get settingsAutoUpdate;

  /// Data usage settings option
  ///
  /// In en, this message translates to:
  /// **'Data Usage'**
  String get settingsDataUsage;

  /// Backup settings option
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get settingsBackup;

  /// Restore settings option
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get settingsRestore;

  /// Reset all settings action
  ///
  /// In en, this message translates to:
  /// **'Reset All Settings'**
  String get settingsResetAll;

  /// Accessibility settings section
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get settingsAccessibility;

  /// Do not disturb toggle label
  ///
  /// In en, this message translates to:
  /// **'Do Not Disturb'**
  String get settingsDoNotDisturb;

  /// Location services toggle label
  ///
  /// In en, this message translates to:
  /// **'Location Services'**
  String get settingsLocationServices;

  /// App permissions option
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get settingsPermissions;

  /// Open source licenses option
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get settingsLicenses;

  /// Change password option
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get settingsChangePassword;

  /// 2FA setting option
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication'**
  String get settingsTwoFactor;

  /// Biometric login toggle
  ///
  /// In en, this message translates to:
  /// **'Biometric Login'**
  String get settingsBiometrics;

  /// Auto lock setting
  ///
  /// In en, this message translates to:
  /// **'Auto Lock'**
  String get settingsAutoLock;

  /// Generic confirmation question
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// Delete confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteConfirmTitle;

  /// Delete confirmation dialog message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this? This action cannot be undone.'**
  String get deleteConfirmMessage;

  /// Unsaved changes warning title
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes'**
  String get unsavedChanges;

  /// Unsaved changes warning message
  ///
  /// In en, this message translates to:
  /// **'Do you want to save your changes before leaving?'**
  String get unsavedChangesMessage;

  /// Discard changes action label
  ///
  /// In en, this message translates to:
  /// **'Discard Changes'**
  String get discardChanges;

  /// Save changes action label
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// Clipboard copy success message
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No internet connection message
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetConnection;

  /// Check connection suggestion message
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again.'**
  String get checkConnection;

  /// Try again later message
  ///
  /// In en, this message translates to:
  /// **'Please try again later'**
  String get tryAgainLater;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// Permission denied message
  ///
  /// In en, this message translates to:
  /// **'Permission denied'**
  String get permissionDenied;

  /// Access denied message
  ///
  /// In en, this message translates to:
  /// **'Access denied'**
  String get accessDenied;

  /// Not found message
  ///
  /// In en, this message translates to:
  /// **'Not found'**
  String get notFound;

  /// 404 page not found message
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get pageNotFound;

  /// Coming soon placeholder
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// Under maintenance message
  ///
  /// In en, this message translates to:
  /// **'Under Maintenance'**
  String get underMaintenance;

  /// App update available title
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateAvailable;

  /// Update now action label
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get updateNow;

  /// Later/dismiss action label
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// Welcome back greeting
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// Welcome greeting
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Goodbye message
  ///
  /// In en, this message translates to:
  /// **'Goodbye'**
  String get goodbye;

  /// Thank you message
  ///
  /// In en, this message translates to:
  /// **'Thank You'**
  String get thankYou;

  /// Congratulations message
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// Save success message
  ///
  /// In en, this message translates to:
  /// **'Saved successfully'**
  String get savedSuccessfully;

  /// Delete success message
  ///
  /// In en, this message translates to:
  /// **'Deleted successfully'**
  String get deletedSuccessfully;

  /// Update success message
  ///
  /// In en, this message translates to:
  /// **'Updated successfully'**
  String get updatedSuccessfully;

  /// Send success message
  ///
  /// In en, this message translates to:
  /// **'Sent successfully'**
  String get sentSuccessfully;

  /// Upload success message
  ///
  /// In en, this message translates to:
  /// **'Uploaded successfully'**
  String get uploadedSuccessfully;

  /// Download complete message
  ///
  /// In en, this message translates to:
  /// **'Download complete'**
  String get downloadComplete;

  /// Operation failure message
  ///
  /// In en, this message translates to:
  /// **'Operation failed'**
  String get operationFailed;

  /// Session expired message
  ///
  /// In en, this message translates to:
  /// **'Session expired'**
  String get sessionExpired;

  /// Session expired detail message
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please log in again.'**
  String get sessionExpiredMessage;

  /// Timeout error message
  ///
  /// In en, this message translates to:
  /// **'Request timed out'**
  String get timeout;

  /// Server error message
  ///
  /// In en, this message translates to:
  /// **'Server error'**
  String get serverError;

  /// Network error message
  ///
  /// In en, this message translates to:
  /// **'Network error'**
  String get networkError;

  /// Unknown error message
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// Pull to refresh hint
  ///
  /// In en, this message translates to:
  /// **'Pull to refresh'**
  String get pullToRefresh;

  /// Release to refresh hint
  ///
  /// In en, this message translates to:
  /// **'Release to refresh'**
  String get releaseToRefresh;

  /// Loading more items message
  ///
  /// In en, this message translates to:
  /// **'Loading more...'**
  String get loadingMore;

  /// End of list message
  ///
  /// In en, this message translates to:
  /// **'No more items'**
  String get noMoreItems;

  /// Empty state title
  ///
  /// In en, this message translates to:
  /// **'It\'s empty here'**
  String get emptyHere;

  /// Nothing to display message
  ///
  /// In en, this message translates to:
  /// **'Nothing to show'**
  String get nothingToShow;

  /// Empty state call to action
  ///
  /// In en, this message translates to:
  /// **'Get started by adding your first item'**
  String get getStartedMessage;

  /// Tap to retry hint
  ///
  /// In en, this message translates to:
  /// **'Tap to retry'**
  String get tapToRetry;

  /// Swipe to delete hint
  ///
  /// In en, this message translates to:
  /// **'Swipe to delete'**
  String get swipeToDelete;

  /// Logout confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logoutConfirmTitle;

  /// Logout confirmation dialog message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmMessage;

  /// Delete account confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account? This action is permanent and cannot be undone.'**
  String get deleteAccountConfirmMessage;

  /// Terms agreement text
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our Terms of Service and Privacy Policy.'**
  String get termsAgreement;

  /// Powered by attribution
  ///
  /// In en, this message translates to:
  /// **'Powered by {name}'**
  String poweredBy(String name);

  /// Version info display
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String version_info(String version);

  /// Last updated timestamp
  ///
  /// In en, this message translates to:
  /// **'Last updated: {date}'**
  String lastUpdated(String date);

  /// Created by attribution
  ///
  /// In en, this message translates to:
  /// **'Created by {name}'**
  String createdBy(String name);

  /// Login action label
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get login;

  /// Logout action label
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// Sign up action label
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// Sign in action label
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// Sign out action label
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// Register action label
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Confirm password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Current password field label
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// New password field label
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// Username field label
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Phone number field label
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Forgot password link label
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Reset password action label
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// Change password action label
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// Remember me checkbox label
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// Stay signed in checkbox label
  ///
  /// In en, this message translates to:
  /// **'Stay Signed In'**
  String get staySignedIn;

  /// Social login separator text
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get orContinueWith;

  /// Google sign in button label
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// Apple sign in button label
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get signInWithApple;

  /// Facebook sign in button label
  ///
  /// In en, this message translates to:
  /// **'Sign in with Facebook'**
  String get signInWithFacebook;

  /// Create account action label
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// Already have account text
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// Don't have account text
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Verification code field label
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCode;

  /// Send verification code action
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sendCode;

  /// Resend verification code action
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// Verify email action label
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get verifyEmail;

  /// Verify phone action label
  ///
  /// In en, this message translates to:
  /// **'Verify Phone'**
  String get verifyPhone;

  /// Password reset email sent message
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent'**
  String get resetPasswordSent;

  /// Password reset instruction text
  ///
  /// In en, this message translates to:
  /// **'Enter your email and we\'ll send you a link to reset your password.'**
  String get resetPasswordInstruction;

  /// Account creation success message
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get accountCreated;

  /// Login failure message
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// Invalid credentials message
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get invalidCredentials;

  /// Account locked message
  ///
  /// In en, this message translates to:
  /// **'Account locked'**
  String get accountLocked;

  /// Account deactivated message
  ///
  /// In en, this message translates to:
  /// **'Account deactivated'**
  String get accountDeactivated;

  /// Password change success message
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChanged;

  /// Profile update success message
  ///
  /// In en, this message translates to:
  /// **'Profile updated'**
  String get profileUpdated;

  /// First name field label
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// Last name field label
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// Display name field label
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get displayName;

  /// Bio/about me field label
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bio;

  /// Birthday field label
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// Gender field label
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// Male gender option
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// Female gender option
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// Other gender option
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// Prefer not to say option
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get preferNotToSay;

  /// Edit profile action label
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Change profile photo action
  ///
  /// In en, this message translates to:
  /// **'Change Profile Photo'**
  String get changeProfilePhoto;

  /// Delete account action label
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// Required field validation error
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// Named required field validation error
  ///
  /// In en, this message translates to:
  /// **'{field} is required'**
  String fieldRequiredNamed(String field);

  /// Invalid email validation error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// Invalid phone validation error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get invalidPhone;

  /// Invalid URL validation error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid URL'**
  String get invalidUrl;

  /// Password too short validation error
  ///
  /// In en, this message translates to:
  /// **'Password must be at least {min} characters'**
  String passwordTooShort(int min);

  /// Weak password validation error
  ///
  /// In en, this message translates to:
  /// **'Password is too weak'**
  String get passwordTooWeak;

  /// Password requirements text
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter, one lowercase letter, and one number'**
  String get passwordRequirements;

  /// Password mismatch validation error
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// Generic invalid input error
  ///
  /// In en, this message translates to:
  /// **'Invalid input'**
  String get invalidInput;

  /// Minimum length validation error
  ///
  /// In en, this message translates to:
  /// **'Must be at least {min} characters'**
  String tooShort(int min);

  /// Maximum length validation error
  ///
  /// In en, this message translates to:
  /// **'Must be at most {max} characters'**
  String tooLong(int max);

  /// Character count display
  ///
  /// In en, this message translates to:
  /// **'{current}/{max}'**
  String characterCount(int current, int max);

  /// Minimum value validation error
  ///
  /// In en, this message translates to:
  /// **'Must be at least {min}'**
  String minValue(String min);

  /// Maximum value validation error
  ///
  /// In en, this message translates to:
  /// **'Must be at most {max}'**
  String maxValue(String max);

  /// Invalid format validation error
  ///
  /// In en, this message translates to:
  /// **'Invalid format'**
  String get invalidFormat;

  /// Numbers only validation error
  ///
  /// In en, this message translates to:
  /// **'Only numbers are allowed'**
  String get onlyNumbers;

  /// Letters only validation error
  ///
  /// In en, this message translates to:
  /// **'Only letters are allowed'**
  String get onlyLetters;

  /// No special characters validation error
  ///
  /// In en, this message translates to:
  /// **'Special characters are not allowed'**
  String get noSpecialCharacters;

  /// Already exists validation error
  ///
  /// In en, this message translates to:
  /// **'{field} already exists'**
  String alreadyExists(String field);

  /// Not available validation error
  ///
  /// In en, this message translates to:
  /// **'{field} is not available'**
  String notAvailable(String field);

  /// Invalid date validation error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid date'**
  String get invalidDate;

  /// Date too early validation error
  ///
  /// In en, this message translates to:
  /// **'Date must be after {date}'**
  String dateTooEarly(String date);

  /// Date too late validation error
  ///
  /// In en, this message translates to:
  /// **'Date must be before {date}'**
  String dateTooLate(String date);

  /// File too large validation error
  ///
  /// In en, this message translates to:
  /// **'File size must be less than {size}'**
  String fileTooLarge(String size);

  /// Unsupported file type error
  ///
  /// In en, this message translates to:
  /// **'This file type is not supported'**
  String get unsupportedFileType;

  /// Maximum items reached error
  ///
  /// In en, this message translates to:
  /// **'Maximum of {max} items allowed'**
  String maxItemsReached(int max);

  /// Fix form errors message
  ///
  /// In en, this message translates to:
  /// **'Please fix the errors above'**
  String get pleaseFixErrors;

  /// All fields required message
  ///
  /// In en, this message translates to:
  /// **'All fields are required'**
  String get allFieldsRequired;

  /// Today label
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Yesterday label
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// Tomorrow label
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// Now/current time label
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

  /// Just now relative time
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// Minutes ago relative time
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 minute ago} other{{count} minutes ago}}'**
  String minutesAgo(int count);

  /// Hours ago relative time
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 hour ago} other{{count} hours ago}}'**
  String hoursAgo(int count);

  /// Days ago relative time
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day ago} other{{count} days ago}}'**
  String daysAgo(int count);

  /// Weeks ago relative time
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 week ago} other{{count} weeks ago}}'**
  String weeksAgo(int count);

  /// Months ago relative time
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 month ago} other{{count} months ago}}'**
  String monthsAgo(int count);

  /// Years ago relative time
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 year ago} other{{count} years ago}}'**
  String yearsAgo(int count);

  /// In X minutes future time
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{In 1 minute} other{In {count} minutes}}'**
  String inMinutes(int count);

  /// In X hours future time
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{In 1 hour} other{In {count} hours}}'**
  String inHours(int count);

  /// In X days future time
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{In 1 day} other{In {count} days}}'**
  String inDays(int count);

  /// Seconds unit label
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get seconds;

  /// Minutes unit label
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutes;

  /// Hours unit label
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// Days unit label
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// Weeks unit label
  ///
  /// In en, this message translates to:
  /// **'Weeks'**
  String get weeks;

  /// Months unit label
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get months;

  /// Years unit label
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get years;

  /// Monday
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// Tuesday
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// Wednesday
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// Thursday
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// Friday
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// Saturday
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// Sunday
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// Monday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get monShort;

  /// Tuesday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tueShort;

  /// Wednesday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wedShort;

  /// Thursday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thuShort;

  /// Friday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get friShort;

  /// Saturday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get satShort;

  /// Sunday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sunShort;

  /// AM time label
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get am;

  /// PM time label
  ///
  /// In en, this message translates to:
  /// **'PM'**
  String get pm;

  /// Start date field label
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// End date field label
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// Start time field label
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get startTime;

  /// End time field label
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get endTime;

  /// Duration label
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// All day event label
  ///
  /// In en, this message translates to:
  /// **'All Day'**
  String get allDay;

  /// From date label
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get fromDate;

  /// To date label
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get toDate;

  /// Select date action
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// Select time action
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTime;

  /// Date picker prompt
  ///
  /// In en, this message translates to:
  /// **'Pick a date'**
  String get pickDate;

  /// Time picker prompt
  ///
  /// In en, this message translates to:
  /// **'Pick a time'**
  String get pickTime;

  /// No date selected placeholder
  ///
  /// In en, this message translates to:
  /// **'No date selected'**
  String get noDateSelected;

  /// No time selected placeholder
  ///
  /// In en, this message translates to:
  /// **'No time selected'**
  String get noTimeSelected;

  /// Deadline label
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get deadline;

  /// Reminder label
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get reminder;

  /// Schedule label
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// Calendar label
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// Event label
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get event;

  /// Events label
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get events;
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
