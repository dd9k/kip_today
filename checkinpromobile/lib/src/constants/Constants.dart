import 'dart:async';

import 'package:checkinpromobile/src/screens/homeScreen/setting/SettingNotifier.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class Constants {
  static final Constants _singleton = Constants._internal();

  static final formatCurrency = NumberFormat.currency(
    decimalDigits: 0,
    customPattern: "###,###.## VND",
  );

  factory Constants() {
    return _singleton;
  }

  //flutter packages pub run build_runner watch --delete-conflicting-outputs
  //flutter build appbundle
  //./adb logcat > logcard01.txt
  Constants._internal();

  //flutter packages pub run build_runner watch --delete-conflicting-outputs
  //flutter build appbundle

  static const PRINTER_CHANNEL = const MethodChannel('flutter.native/helper');
  static const LOCATION_CHANNEL = const MethodChannel('flutter.native/location');

  static const int PAGE_MAX_SIZE = 15;
  static const bool PRINT_LOG_OUTPUT_FILE = true;

  static const int MAX_INT = 4294967296; //2^32
  static const Duration CONNECTION_TIME_OUT = Duration(seconds: 120);
  static const String replaceField = "field_name";

  static const String POSTFIX_DOMAIN = '.checkinpro.vn';

  static const String FIELD_DOMAIN = "domain";
  static const String FIELD_TYPE = "type";
  static const String FIELD_BEARER = "Bearer ";
  static const String FIELD_USER_NAME = "username";
  static const String FIELD_EMAIL_ADDRESS = "emailAddress";
  static const String FIELD_PASS_CODE = "passcode";
  static const String FIELD_CODE = "code";
  static const String FIELD_PASSWORD = "password";
  static const String FIELD_FIREBASE_TOKEN = "firebaseId";
  static const String FIELD_LANGUAGE = "language";
  static const String FIELD_OS = "osMobile";
  static const String FIELD_APP_VERSION = "appVersion";
  static const String FIELD_DEVICE_ID = "deviceId";
  static const String FIELD_REFRESH_TOKEN = "refreshToken";
  static const String FIELD_LOCATION_ID = "locationId";
  static const String FIELD_VISITOR_LOG_ID = "visitorLogId";
  static const String FIELD_FACE_FILE = "captureFaceFileContent";
  static const String FIELD_VISITOR = "visitor";
  static const String FIELD_TIME_ZONE = "timezone";
  static const String FIELD_KEYWORD = "keyword";
  static const String FIELD_PAGE_INDEX = "pageIndex";
  static const String FIELD_PAGE_SIZE = "pageSize";
  static const String FIELD_IS_DESC = "isDesc";
  static const String FIELD_IS_PAGING = "isPaging";
  static const String FIELD_STATUS = "status";
  static const String FIELD_SECRET_KEY = "secretKey";
  static const String FIELD_DEVICE = "device";
  static const String KEY_SURVEY = "survey";
  static const String FIELD_QR_CODE = "qrCode";
  static const String FIELD_EVENT_ID = "eventId";

  static const String FIELD_FIRE_BASE_ID = "firebaseId";
  static const int EXCEEDING_SECONDS_SEARCH_INVITATION = 3600;

  int indexURL = 2;
  static const List<String> URL_LIST = [URL, URL_VNG, URL_FPT];
  static const String URL = "https://api.checkinpro.vn/";
  static const String URL_VNG = "http://61.28.235.127:5100/";
  static const String URL_FPT = "https://api-demo.checkinpro.vn/";

  static const String PATH_LOCATION = "api/v1/location/getall";
  static const String PATH_CHECK_VERSION = "api/v1/systemsetting/getcurrentappversion-mobile";
  static const String PATH_USER_INFOR = "api/v1/account/info";
  static const String PATH_LOCATION_INFOR = "api/v1/userbranch/branch-info";
  static const String PATH_GET_BRANCHES = "atd/v1/EmployeeMobile/get-branches";
  static const String PATH_REFRESH_TOKEN = "api/v1.3/mobileauthentication/refresh-authentication-token";
  static const String PATH_UPLOAD_FACE_CAPTURE = "api/v1/file/faceCapture/upload";
  static const String PATH_CONFIGURATION = "api/v1/configuration/GetByType";
  static const String PATH_VISITOR_TYPE = "api/v1/BranchConfigMobile/get-visitor-type";
  static const String PATH_SYNC = "api/v1/sync/synchronize";
  static const String PATH_BUILDING_ALL_COMPANY = "api/v1/BuildingCompany/get-all-company";
  static const String PATH_AUTHENTICATE = "api/v1.3/MobileAuthentication/authenticate";
  static const String PATH_VALIDATE_EMAIL = "api/v1.3/MobileAuthentication/validate-contact-person-email";
  static const String PATH_VALIDATE_PASS_CODE = "api/v1/MobileAuthentication/validate-passcode";
  static const String PATH_CHANGE_PASSWORD = "api/v1/MobileAuthentication/change-password";
  static const String PATH_FORGOT_PASSWORD = "api/v1/MobileAuthentication/forgot-contact-person-password";
  static const String PATH_INVITE_NEW_VISITOR = "api/v1/invitationMobile/new";
  static const String PATH_GET_EXPECTED = "api/v1/employee/get-expected";
  static const String PATH_GET_TODAY = "api/v1/employee/get-today";
  static const String PATH_GET_LOG = "api/v1/employee/get-log-by-conditions";
  static const String PATH_CHECK_IN = "api/v1/employee/manual-checkin-for-individual-visitor/";
  static const String PATH_CHECK_OUT = "api/v1/employee/Checkout/";
  static const String PATH_INVITATION = "api/v1/employee/manual-checkin/{branchId}";
  static const String PATH_SCAN_QR = "api/v1/employeePass/employee-scan";

  static const String PATH_EMPLOYEE_INFO = "api/v1/employee/get-employee-info";
  static const String PATH_GET_EMPLOYEE_INFO = "atd/v1/employeemobile/get-by-id";
  static const String PATH_GET_EMPLOYEE_SETTING = "atd/v1/employeemobile/get-employee-setting";
  static const String PATH_UPDATE_INTEGRATION_SETTING = "atd/v1/employeemobile/update-integration-setting/";

  static const String PATH_MONTH_INVITE_VISITOR = "api/v1/invitationmobile/search-by-month";
  static const String PATH_INVITE_VISITOR_SEARCH = "api/v1/invitationMobile/search";
  static const String PATH_VISITOR_LOG_SEARCH = "api/v1/visitlogs/search";
  static const String PATH_SIGN_OUT = "api/v1/AccountMobile/sign-out";
  static const String PATH_NOTIFICATION_SEARCH = 'api/v1/NotificationMobile/search';
  static const String PATH_UPDATE_READ_ALL_NOTIFICATION = 'api/v1/NotificationMobile/update-read-all';
  static const String PATH_UPDATE_READ_NOTIFICATION = 'api/v1/NotificationMobile/update-read';
  static const String PATH_DELETE_NOTIFICATION = 'api/v1/NotificationMobile/delete';
  static const String PATH_DELETE_RANGE_NOTIFICATION = 'api/v1/NotificationMobile/delete-range';
  static const String PATH_TOTAL_UNREAD_NOTIFICATION = 'api/v1/NotificationMobile/total-unread-notification';
  static const String PATH_EVENTS_DETAIL = 'api/v1/EventsMobile';
  static const String PATH_GET_EVENTS_GUESTS = 'api/v1/EventsMobile/get-event-guests';
  static const String PATH_GET_EVENTS_GUESTS_All = 'api/v1.3/eventsmobile/get-event-guest';
  static const String PATH_ACTION_CHECKINOUT_EVENT = 'api/v1/EventsMobile/action';
  static const String PATH_EVENT_TODAY = "api/v1/EventsMobile/get-expected-event-today";
  static const String PATH_SYNC_EVENT_GUEST = "api/v1.3/eventsmobile/synchronize-event-guest";
  static const String PATH_MY_VISITOR = "atd/v1/EmployeeMobile/get-visit-log";
  static const String PATH_INVITATION_TODAY = "api/v1/invitationMobile/get-expected-invitation-today";
  static const String PATH_SYNC_INVITATION_VISITOR = "api/v1.3/invitationmobile/sync-invitation";
  static const String PATH_UPDATE_DEVICE = "api/v1/device/update";
  static const String PATH_CHANGE_PW = "api/v1/AccountMobile/change-password";
  static const String PATH_UPLOAD_AVATAR = "api/v1/accountmobile/upload-avatar";
  static const String PATH_DELETE_AVATAR = "api/v1/accountmobile/delete-avatar";

  static const String PATH_CHECK_DOMAIN_REGISTER = "api/v1/mobileauthentication/validate-company-url";
  static const String PATH_EDIT_PRO_FILE = "atd/v1/employeemobile/update/";
  static const String PATH_UPDATE_NOTIFICATION = "atd/v1/employeemobile/update-setttings";
  static const String PATH_UPDATE_INTEGRATION = "atd/v1/employeemobile/update-integration-settings";
  static const String URL_CONTACT = "https://checkinpro.vn/lien-he/";
  static const String URL_CHECK_IN_PRO = "https://checkinpro.vn/";
  static const String PATH_EMPLOYEE_ATTENDANCE_CHECKIN = "atd/v1.3/employeeattendance/employee-checkin";
  static const String PATH_EMPLOYEE_ATTENDANCE_CHECKIN_NO_VALIDATION =
      "atd/v1.3/employeeattendance/employee-checkin-no-validation";
  static const String PATH_GET_EMPLOYEE_ATTENDANCE_DETAIL = "atd/v1.3/employeeattendance/get-detail-attendance";
  static const String PATH_GET_TODAY_ATTTENDANCE_INFO = "atd/v1.3/employeeattendance/get-today-attendance-info";
  static const String PATH_GET_WORKING_TIME_INFO = "atd/v1.3/employeeattendance/get-working-time-info";
  static const String PATH_ATTENDANCE_CHART = "atd/v1.3/employeeattendance/attendance-statistics";
  static const String PATH_GET_HEALTH_DECLARATION = "core/v1.2/survey/get-health-declaration-mobile";
  static const String PATH_WELCOME_MESSAGE = "atd/v1/employeemobile/getrandommessage";
  static const String PATH_EMPLOYEE_SEARCM = "atd/v1/employeemobile/search";
  static const String PATH_ALL_EVENT_TICKET = "eventadvanced/v1/eventmobile/get-all";
  static const String PATH_ALL_EVENT_TICKET_DETAIL = "eventadvanced/v1/eventmobile/get-full-flow-by-id?id=";
  static const String PATH_EVENT_TICKET_CHECK_IN = "huba/v1/orderdetailmobile/check-in";
  static const String PATH_PAID_ORDER = "huba/v1/ordermobile/update-order-paid/";
  static const String PATH_CREATE_ORDER = "huba/v1/ordermobile/create-order";

// Info step flow reigster app
  static const String KEY_IS_DOMAIN = 'isDomain';
  static const String KEY_HAS_CACHE_ACCOUNT_DATA = 'hasCache';
  static const String KEY_IS_CHANGE_PASS_FIRST = 'isChangePass';
  static const String KEY_IS_LOGIN = 'isLogin';

  static const String KEY_IS_HAS_LOGIN = 'isHasLogin'; // sử dụng cho check domain -> login screen
  static const String KEY_AUTHENTICATE = "authenticate";
  static const String KEY_USER_INFOR = "userInfor";
  static const String KEY_IS_LOGGED = "isLogged";
  static const String KEY_INFO_STEP = "isActive";
  static const String KEY_LANGUAGE = "lang";
  static const String KEY_FULLNAME = "fullname";
  static const String KEY_EMAIL = "email";
  static const String KEY_PASSWORD = "password";
  static const String KEY_FIREBASE_TOKEN = "firebaseToken";
  static const String KEY_DEV_MODE = "devmode";
  static const String KEY_LAST_TIME = "lastTime";
  static const String KEY_FIRST_START = "isFirstStart";
  static const String KEY_LAST_REFRESH = "lastRefresh";
  static const String KEY_IS_LAUNCH = "isFirstLaunch";
  static const String KEY_NOTIFICATION_CONFIG = "notificationConfig";
  static const String KEY_BIO_CONFIG = "bioConfig";
  static const String KEY_SETTINGS_CONFIG = "settingsConfig";
  static const String KEY_EMPLOYEE_DATA = "employeeData";
  static const String KEY_DOMAIN_STRING = 'domainKey';
  static const String KEY_DATA_CODEOTP = 'dataCodeOTP';
  static const String KEY_FLOW_ACTIVE_EMAIL = 'flowActiveEmail';
  static const String KEY_IS_ATTENDANCE_MODE = 'AttendanceMode';
  static const String KEY_CHANGE_UI = 'ChangeUi';
  static const String KEY_CHANGE_THEMES = 'ChangeThemes';
  static const String KEY_FIRST_STORAGE = 'firstStorage';
  static const String KEY_ATTENDANCE_TODAY = 'Attendancetoday';
  static const String KEY_LAST_VERSION = 'lastVersion';

  // Constant printer
  static const String KEY_PRINTER = "printerInfo";
  static const ACTION_PRINTER_FIND = "findPrinter";
  static const ACTION_PRINTER_PRINT = "printTemplate";
  static const PRINTER_QL = "QL-810W";
  static const PRINTER_ESC_POS = "ESC_POS";
  static const String BADGE_FILE_TEST = "card_printer";
  static const ERROR_PRINTER = "ERROR_CODE";
  static const ACTION_PRINTER_TEST = "printTest";
  static const BADGE_TEMPLATE = "BADGE";
  static const int TIMEOUT_PRINTER = 3;

  static const int TIMEOUT_ALLOW_CHECKOUT = 60;
  static const String STATUS_SUCCESS = "SUCCESS";
  static const String STATUS_FAIL = "FAIL";
  static const String STATUS_FAIL_API = "FAIL_API";
  static const String B500 = "b500";
  static const String B401 = "401";
  static const String B400 = "400";
  static const String B403 = "403";
  static const int STATUS_CODE_NO_INTERNET = 12163;
  static const int TIMEOUT_RESET = 3;
  static const int TIMEOUT_RESTART = 60;
  static const int TIMEOUT_REFRESH = 12;
  static const int MIN_HEIGHT = 600;

  static const int AUTO_HIDE_LESS = 3;
  static const int AUTO_HIDE_LONG = 5;
  static const int AUTO_HIDE_LONGER = 10;

  static const String VT_VISITORS = "VISITOR1";

  static const String SPLIT_SIMPLE = ";";

  static const String FOLDER_TEMP_EVENT = "temp/events";
  static const String FOLDER_TEMP_INVITE = "temp/invites";
  static const String FOLDER_TEMP_VISITOR_LOG = "temp/visitor_log";
  static const String FOLDER_TEMP_AVATAR = "temp/avatar";
  static const String FOLDER_TEMP = "temp";
  static const String FILE_TYPE_IMAGE_AVATAR = "avatar";

  static const String FOLDER_FACE_OFFLINE = "faceOffline";
  static const String FOLDER_BADGE = "badge";

  static const String PREFIX_COLOR = "0xFF";

  static const List<String> LIST_LANG = [Constants.EN_CODE, Constants.VN_CODE];

  // ignore: non_constant_identifier_names
  static String CURRENT_LANG_CODE;
  static const VN_CODE = "vi";
  static const EN_CODE = "en";
  static const LANG_DEFAULT = Constants.VN_CODE;
  static const IPAD_CODE = "IPAD";
  static const ANDROID_CODE = "ANDROID";
  static const IOS_CODE = "IOS";

  static const HQ_CODE = "HQ";

  static const TYPE_CHECK = "DEVICE";

  static const ERROR_TOKEN = "error_token";

  static const PNG_ETX = "png";
  static const LIMIT_IMAGE_SIZE = 200000;

  static const HEIGHT_BUTTON = 30.0;

  static const DATE_FORMAT_EN = "EEE, MMMM d, yyyy";
  static const TIME_FORMAT_12_EN = "hh:mm a";
  static const TIME_FORMAT_24 = "HH:mm";
  static const DATE_FORMAT_TO_SQL = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

  static const PERMISSION_LIST_ANDROID = [
    PermissionGroup.camera,
    PermissionGroup.storage,
    PermissionGroup.locationAlways
  ];

  static const PERMISSION_LIST_IOS = [PermissionGroup.camera, PermissionGroup.photos, PermissionGroup.location];

  /// Maximum of click on Logo to show hidden Activity
  static const MAX_CLICK_NUMBER = 4;

  static const HARDWARE_CHANNEL = const MethodChannel('hardware');
  static const REMINDER_CHANNEL = const MethodChannel('reminder');
  static const ACTION_HANDLER_NOTIFICATION = "handlerNotification";
  static const ACTION_REMINDER_CREATE = "createReminder";
  static const ACTION_REMINDER_CHECK = "checkReminder";
  static const ACTION_REMINDER_GRANT = "grantReminder";
  static const MEMORY_METHOD = 'memory';
  static const B_TO_GB = 1000000000;

  static const FORMAT_STRING_DATE = 'dd/MM/yyyy HH:mm';
  static const FORMAT_DATE_BASIC = "yyyy-MM-dd'T'HH:mm:ss";
  static const FORMAT_DAY_MAIN = "yyyy-MM-dd";
  static const FORMAT_DAY_BASIC = "dd-MM-yyyy";
  static const FORMAT_TIME_BASIC = "HH:mm";

  // ERROR CODE
  static const COM_WRONGDOMAIN = 'COM_WrongDomain';
  static const DEFAULT_STEP =
      "[{\"stepCode\":\"FULL_NAME\",\"stepName\":\"FULL_NAME\",\"stepType\":\"text\",\"isRequired\":true,\"isShow\":true,\"sort\":0},{\"stepCode\":\"EMAIL_ADDRESS\",\"stepName\":\"EMAIL_ADDRESS\",\"stepType\":\"email\",\"isRequired\":true,\"isShow\":true,\"sort\":1},{\"stepCode\":\"PHONE_NUMBER\",\"stepName\":\"PHONE_NUMBER\",\"stepType\":\"phone\",\"isRequired\":true,\"isShow\":true,\"sort\":2},{\"stepCode\":\"ID_CARD\",\"stepName\":\"ID_CARD\",\"stepType\":\"text\",\"isRequired\":true,\"isShow\":false,\"sort\":3},{\"stepCode\":\"COMPANY\",\"stepName\":\"COMPANY\",\"stepType\":\"text\",\"isRequired\":true,\"isShow\":false,\"sort\":4},{\"stepCode\":\"POSITION\",\"stepName\":\"POSITION\",\"stepType\":\"text\",\"isRequired\":true,\"isShow\":true,\"sort\":5}]";
}

class ItemSwitch {
  String title;
  final String subtitle;
  final Widget icon;
  bool isSelect;
  SwitchType switchType;

  ItemSwitch({this.title, this.subtitle, this.icon, this.isSelect, this.switchType});
}

// Printer type
class PrinterType {
  static const BROTHER = "brother";
  static const X_PRINTER = "xPrinter";
}

class InvitationStatus {
  static const DRAFT = "draft";
  static const SENT = "sent";
}

class OrderTicketStatus {
  static const PAID = "PAID";
  static const CONFIRMED = "CONFIRMED";
}

// Printer error
class ErrorCodePrinter {
  static const NO_PRINTER = "noPrinter";
  static const NO_TEST_IMAGE = "noTestImage";
  static const NONE = "none";
  static const NOT_SAME_MODEL = "notsamemodel";
  static const BROTHER_PRINTER_NOT_FOUND = "brotherprinternotfound";
  static const PAPER_EMPTY = "paperempty";
  static const BATTERY_EMPTY = "batteryempty";
  static const COMMUNICATION_ERROR = "communicationerror";
  static const OVERHEAT = "overheat";
  static const PAPER_JAM = "paperjam";
  static const HIGH_VOLTAGE_ADAPTER = "highvoltageadapter";
  static const CHANGE_CASSETTE = "changecassette";
  static const FEED_OR_CASSETTE_EMPTY = "feedorcassetteempty";
  static const SYSTEM_ERROR = "systemerror";
  static const NO_CASSETTE = "nocassette";
  static const WRONG_CASSETTE_DIRECT = "wrongcassettedirect";
  static const CREATE_SOCKET_FAILED = "createsocketfailed";
  static const CONNECT_SOCKET_FAILED = "connectsocketfailed";
  static const GET_OUTPUT_STREAM_FAILED = "getoutputstreamfailed";
  static const GET_INPUT_STREAM_FAILED = "getinputstreamfailed";
  static const CLOSE_SOCKET_FAILED = "closesocketfailed";
  static const OUT_OF_MEMORY = "outofmemory";
  static const SET_OVER_MARGIN = "setovermargin";
  static const NO_SD_CARD = "nosdcard";
  static const FILE_NOT_SUPPORTED = "filenotsupported";
  static const EVALUATION_TIMEUP = "evaluationtimeup";
  static const WRONG_CUSTOM_INFO = "wrongcustominfo";
  static const NO_ADDRESS = "noaddress";
  static const NOT_MATCH_ADDRESS = "notmatchaddress";
  static const FILE_NOT_FOUND = "filenotfound";
  static const TEMPLATE_FILE_NOT_MATCH_MODEL = "templatefilenotmatchmodel";
  static const TEMPLATE_NOT_TRANS_MODEL = "templatenottransmodel";
  static const COVER_OPEN = "coveropen";
  static const WRONG_LABEL = "wronglabel";
  static const PORT_NOT_SUPPORTED = "portnotsupported";
  static const WRONG_TEMPLATE_KEY = "wrongtemplatekey";
  static const BUSY = "busy";
  static const TEMPLATE_NOT_PRINT_MODEL = "templatenotprintmodel";
  static const CANCEL = "cancel";
  static const PRINTER_SETTING_NOT_SUPPORTED = "printersettingnotsupported";
  static const INVALID_PARAMETER = "invalidparameter";
  static const INTERNAL_ERROR = "internalerror";
  static const TEMPLATE_NOT_CONTROL_MODEL = "templatenotcontrolmodel";
  static const TEMPLATE_NOT_EXIST = "templatenotexist";
  static const BUFFER_FULL = "bufferfull";
  static const TUBE_EMPTY = "tubeempty";
  static const TUBE_RIBBON_EMPTY = "tuberibbonempty";
  static const UPDATE_FRIM_NOT_SUPPORTED = "updatefrimnotsupported";
  static const OS_VERSION_NOT_SUPPORTED = "osversionnotsupported";
  static const RESOLUTION_MODE = "resolutionmode";
  static const POWER_CABLE_UNPLUGGING = "powercableunplugging";
  static const BATTERY_TROUBLE = "batterytrouble";
  static const UNSUPPORTED_MEDIA = "unsupportedmedia";
  static const TUBE_CUTTER = "tubecutter";
  static const UNSUPPORTED_TWO_COLOR = "unsupportedtwocolor";
  static const UNSUPPORTED_MONO_COLOR = "unsupportedmonocolor";
  static const MINIMUM_LENGTH_LIMIT = "minimumlengthlimit";
}

class StepCode {
  static const COMPANY = "COMPANY";
  static const FULL_NAME = "FULL_NAME";
  static const ID_CARD = "ID_CARD";
  static const PHONE_NUMBER = "PHONE_NUMBER";
  static const EMAIL = "EMAIL_ADDRESS";
  static const POSITION = "POSITION";
}

class StepType {
  static const IMAGE = "IMAGE";
  static const FILE = "FILE";
  static const TEXT = "TEXT";
  static const PHONE = "PHONE";
  static const MULTIPLE_TEXT = "MULTIPE TEXT";
  static const NUMBER = "NUMBER";
  static const EMAIL = "EMAIL";
}

class PaymentType {
  static const CASH = "CASH";
  static const TRANSFER = "BANKING";
}
