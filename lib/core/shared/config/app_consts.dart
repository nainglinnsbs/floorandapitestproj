import 'package:intl/intl.dart';

import 'app_strings.dart';

class AppConsts {
  AppConsts._();

  static const String abbrOrganization = 'SBS';
  static const String organization = 'Systematic Business Solution Co.,Ltd.';

  static const double containerRadius = 8;
  static const double buttonRadius = 8;

  static const double defaultTextFieldRadius = 8;

  // Fonts
  static const String mainFont = 'Roboto';
  static const String mainFontMM = pyidaungsuFont;

  static const String pyidaungsuFont = 'Pyidaungsu';

  // SharedPreference Keys
  static const String prefsDarkMode = 'is_dark_mode';
  static const String prefsFirstRun = 'first_run';
  static const String prefInvoiceID = 'KeyInvoiceID';
  static const String prefOrderID = 'KeyOrderID';
  static const String prefSaleInvoiceID = 'KeySaleInvoiceID';
  static const String prefTransferID = 'KeyTransferID';
  static const String prefReceiveID = 'KeyReceiveID';
  static const String prefCreditReceiveID = 'KeyCreditReceiveID';
  static const String prefExceptionID = 'KeyExceptionID';
  static const String prefCustomerId = 'KeyCustomerId';
  static const String prefWayId = 'KeyWayId';
  static const String prefIssueID = 'KeyIssueId';
  static const String prefSaleReturnID = 'KeySaleReturnId';

  // DateTime
  static const String patternDate = "yyyy-MM-dd";
  static const String listDatePattern = "d MMM, yyyy";
  static const String patternTime = "HH:mm a";
  static const String patternDateTime12 = "MM/dd/yyyy hh:mm:ss a";
  static const String patternDateTime24 = "dd-MM-yyyy HH:mm:ss";
  static const String patternExtraDateTime24 = "dd-MM-yyyy hh:mm a";
  static const String patternUploadDateTime = "dd/MM/yyyy hh:mm a";

  static NumberFormat numberFormat = NumberFormat("#,##0", "en_US");

  static const List<String> statusList = [
    AppStrings.statusNew,
    AppStrings.statusRequested,
    AppStrings.statusCancelled,
  ];

  // platform type
  static const String platformAndroid = "android";
  static const String platformiOS = "ios";
}
