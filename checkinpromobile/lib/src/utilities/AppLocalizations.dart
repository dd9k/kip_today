import 'dart:convert';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _localizedStrings;
  Map<String, String> _viStrings;
  Map<String, String> _enStrings;

  Future<bool> load(Locale locale) async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    Constants.CURRENT_LANG_CODE = locale.languageCode;
    return true;
  }

  Future<bool> initLocalLang() async {
    if (_viStrings != null) {
      return false;
    }
    String jsonString = await rootBundle.loadString('assets/lang/vi.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _viStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    jsonString = await rootBundle.loadString('assets/lang/en.json');
    jsonMap = json.decode(jsonString);

    _enStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }

  String translateVi(String key) {
    return _viStrings[key];
  }

  String translateEn(String key) {
    return _enStrings[key];
  }

  String get langVi => translate("lang_vi");
  String get langEn => translate("lang_en");
  String get noInternet => translate("no_internet");
  String get validateEmail => translate("validate_email");
  String get errorNoUserName => translate("error_no_username");
  String get errorNoPassword => translate("error_no_password");
  String get titleError => translate("title_error");
  String get buttonClose => translate("button_close");
  String get btnOk => translate("btn_ok");
  String get noPassword => translate("error_no_password");
  String get wrongPassword => translate("error_wrong_password");
  String get expiredToken => translate("expired_token");
  String get buttonTryAgain => translate("button_try_again");
  String get messageCommonError => translate("message_common_error");
  String get noPermission => translate("no_permission");
  String get noData => translate("no_data");
  String get errorInviteCode => translate("error_invite_code");
  String get alreadyCheckout => translate("already_checkout");
  String get emailNotExist => translate("email_not_exist");
  String get changedConfiguration => translate("changed_configuration");
  String get changedConfigurationContent =>
      translate("changed_configuration_content");
  String get titleConfirmPassword => translate("title_confirm_password");
  String get accountDeactivated => translate("account_deactivated");
  String get accountLocked => translate("account_locked");
  String get noVisitor => translate("no_visitor");
  String get noPhone => translate("no_phone");
  String get hintLoginEmail => translate("hint_login_email");
  String get hintLoginPassword => translate("hint_login_password");
  String get buttonLoginText => translate("button_login_text");
  String get buttonLogoutText => translate("button_logout_text");
  String get buttonForgotPasswordText =>
      translate("button_forgot_password_text");
  String get email => translate("email");
  String get password => translate("password");
  String get welcomeLoginTitle => translate("welcome_login_title");
  String get termConditionPrefix => translate("terms_condition_prefix");
  String get termConditionPostfix => translate("terms_condition_postfix");
  String get signIn => translate("btn_sign_in");
  String get infoContentFooter => translate("info_content_footer");
  String get changePasswordTitle => translate("change_password_title");
  String get settingPasswordTitle => translate("setting_password_title");
  String get changePasswordContent => translate("change_password_content");
  String get saveContentButton => translate("save_content");
  String get addContentButton => translate("add_content");
  String get confirmPassword => translate("confirm_password");
  String get visitorTitle => translate("visitor");
  String get todayTitle => translate("today");
  String get expectedTitle => translate("expected");
  String get fullname => translate("fullname");
  String get idCardText => translate("id_card_text");
  String get numberphone => translate("numberphone");
  String get company => translate("company");
  String get address => translate("address");
  String get call => translate("call");
  String get message => translate("message");
  String get meeting => translate("meeting");
  String get verificationCode => translate("verification_code");
  String get activeButton => translate("active_button");
  String get passcodeExpired => translate("passcode_expired");
  String get passcodeInvalid => translate("passcode_invalid");
  String get messageFingerprintAlert => translate("message_fingerprint_alert");
  String get messageFaceIDAlert => translate("message_faceid_alert");
  String get homeTitleDashboard => translate("home_title");
  String get visitorTitleDashboard => translate("visitor_title");
  String get homeAddressTitle => translate("home_address_title");
  String get jobInfoTitle => translate("job_info_title");
  String get goodMorning => translate("good_morning");
  String get goodAfternoon => translate("good_afternoon");
  String get goodEvening => translate("good_evening");
  String get goodNight => translate("good_night");
  String get subMorning => translate("sub_morning");
  String get subAfternoon => translate("sub_afternoon");
  String get subEvening => translate("sub_evening");
  String get subNight => translate("sub_night");
  String get activeAccount => translate("active_account");
  String get passCodeInValid => translate("EA_PasscodeInvalid");
  String get passCodeExpired => translate("EA_PasscodeExpired");
  String get comparePassword => translate("compare_password");
  String get changePasswordExpired => translate("ACC_Action_Expire");
  String get workingTime => translate("working_time");
  String get personalInfor => translate("personal_information_title");
  String get jobInfor => translate("job_information_title");
  String get editTitle => translate("edit_title");
  String get historyTitle => translate("history_title");
  String get timeTitle => translate("time_title");
  String get checkInTitle => translate("checkin");
  String get checkOutTitle => translate("checkout");
  String get notesTitle => translate("notes_title");
  String get inviteVistorTitle => translate("invite_visitor_title");
  String get inviteTitle => translate("invite_title");
  String get inviteTabTitle => translate("invite_title_tab");
  String get inviteListTitle => translate("invite_list_title");
  String get notificationsTitle => translate("notifications_title");
  String get getStartedTitle => translate("get_started_title");
  String get subjectTitle => translate("subject_title");
  String get siteTitle => translate("site_title");
  String get visitorNameTitle => translate("visitor_name_title");
  String get fromCompany => translate("from_company_title");
  String get visitorType => translate("visitor_type_title");
  String get nextButtonTitle => translate("next_btn_title");
  String get prevButtonTitle => translate("prev_btn_title");
  String get reviewInvitationInfoTitle =>
      translate("review_invitation_info_title");
  String get inviteInfoTitile => translate("invite_info_title");
  String get visitorInfoTitle => translate("visitor_info");
  String get loadMoreTitle => translate("load_more_title");
  String get employeeStatus => translate("employee_status");
  String get joinDate => translate("join_date");
  String get department => translate("department");
  String get workPhoneNumber => translate("work_phone_number");
  String get employmentType => translate("employment_type");
  String get jobTitle => translate("job_title");
  String get settingTitle => translate('setting_title');
  String get visitorLogTitle => translate("visitor_log_title");
  String get visitorInvitationTitle => translate("visitor_invitation_title");
  String get statusReadTitle => translate("status_read_title");
  String get statusUnReadTitle => translate("status_unread_title");
  String get deleteTitle => translate("delete_title");
  String get notYetActiveAccount => translate("not_yet_active_account");
  String get activeAccountPostfix => translate("active_account_postfix");
  String get domainTitle => translate("domain_title");
  String get eventDetailTitle => translate("event_detail_information_title");
  String get eventGuestsTitle => translate("event_guests_title");
  String get orderPaidBy => translate("order_paid_by");
  String get eventNameTitle => translate("event_name_title");
  String get hostTitle => translate("host_title");
  String get locationTitle => translate("location_title");
  String get endDateTitle => translate("end_date_title");
  String get coverImageTitle => translate("cover_image_title");
  String get coverImageContent => translate("cover_image_content");
  String get guestSearchTitle => translate("guest_search_title");
  String get notifyTitle => translate("notify");
  String get checkinSuccess => translate("checkin_success");
  String get januaryTitle => translate("january_title");
  String get februaryTitle => translate("february_title");
  String get marchTitle => translate("march_title");
  String get aprilTitle => translate("april_title");
  String get mayTitle => translate("may_title");
  String get juneTitle => translate("june_title");
  String get julyTitle => translate("july_title");
  String get augustTitle => translate("august_title");
  String get septemberTitle => translate("september_title");
  String get octoberTitle => translate("october_title");
  String get novemberTitle => translate("november_title");
  String get decemberTitle => translate("december_title");
  String get mondayTitle => translate("monday_title");
  String get tuesdayTitle => translate("tuesday_title");
  String get webnesdayTitle => translate("webnesday_title");
  String get thursdayTitle => translate("thursday_title");
  String get fridayTitle => translate("friday_title");
  String get saturdayTitle => translate("saturday_title");
  String get sundayTitle => translate("sunday_title");
  String get visitorExpectedTodayTitle =>
      translate("visitor_expected_today_title");
  String get eventsTitle => translate("events_title");
  String get myVisitorTitle => translate("my_visitor_title");
  String get composeInvite => translate("compose_invitation");
  String get cannotCheckinContent => translate('cannot_checkin_content');
  String get alreadyCheckoutContent => translate('already_checkout_content');
  String get invalidDomain => translate('invalid_domain');
  String get nonEvent => translate('mes_non_event');
  String get nonVisitor => translate('mes_non_visitor');
  String get wrongDomain => translate('wrong_domain');
  String get notificationContentSetting =>
      translate('notification_content_setting');
  String get bioTitleSetting => translate('bio_title_setting');
  String get bioContentSetting => translate('bio_content_setting');
  String get faceRecordTitleSetting => translate('face_record_title_setting');
  String get faceRecordSetting => translate('face_record_setting');
  String get configurationTitle => translate('configuration');
  String get versionTitle => translate('version_title');
  String get resetPassword => translate('reset_password');
  String get sendButtonTitle => translate('send_button_title');
  String get otpVerifyContent => translate('otp_verify_content');
  String get notYetConfigureBioContent =>
      translate('not_yet_configure_bio_login_content');
  String get profile => translate('pro_file');
  String get printTitle => translate("print_title");
  String get communicationError => translate("communication_error");
  String get coverOpen => translate("cover_open");
  String get emptyPaper => translate("empty_paper");
  String get cardPhone => translate("card_phone");
  String get cardID => translate("card_id");
  String get cardFrom => translate("card_from");
  String get cardTo => translate("card_to");
  String get connected => translate("connected");
  String get disconnected => translate("disconnected");
  String get searchPrinter => translate("search_printer");
  String get noPrinter => translate("no_printer");
  String get refresh => translate("refresh");
  String get printTest => translate("print_test");
  String get connect => translate("connect");
  String get disconnect => translate("disconnect");
  String get printerTitle => translate("printer");
  String get printerTitleSetting => translate('printer_title_setting');
  String get printerContentSetting => translate('printer_content_setting');
  String get titleMyProfile => translate('title_my_profile');
  String get checkoutSuccess => translate('checkout_success');
  String get inviteDetailTitle => translate('invite_detail_title');
  String get visitorAmountTitle => translate('visitor_amount_title');
  String get downloadQRCodeSuccessContent =>
      translate('download_qrcode_success_content');
  String get clickToDownloadQRCodeContent =>
      translate('click_to_download_qrcode_content');
  String get haveBeenActiveAnAccountContent =>
      translate('have_been_active_account_content');
  String get haveBeenActiveAnAccountContentPostfix =>
      translate('have_been_active_account_content_postfix');
  String get startDateGreaterThanTodayContent =>
      translate('start_date_greater_than_today_content');
  String get enterVisitorTypeContent => translate('enter_visitor_type_content');
  String get enterSiteContent => translate('enter_site_content');
  String get enterSubjectInviteContent =>
      translate('enter_subject_invite_content');
  String get enterStartDateContent => translate('enter_start_date_content');
  String get infoInviteTitle => translate('info_invite_title');
  String get oldPw => translate('old_pw');
  String get noResultsFoundTitle => translate('no_results_found');
  String get tryAgainButtonTitle => translate('try_again_button_title');
  String get welcomeCheckinTitle => translate('welcome_checkin_title');
  String get thankyouCheckoutTitle => translate('thankyou_checkout_title');
  String get checkoutAlreadyAgainContent =>
      translate('checkout_already_again_content');
  String get inviteSuccessTitleNotify =>
      translate('invite_completed_title_notify');
  String get inviteSuccessContentNotify =>
      translate('invite_success_content_notify');
  String get pleaseEnterFullnameInviteValidator =>
      translate('please_enter_fullname_invite_validator');
  String get pleaseEnterTitleInviteValidator =>
      translate('please_enter_title_invite_validator');
  String get pleaseEnterSitesInviteValidator =>
      translate('please_enter_sites_invite_validator');
  String get pleaseEnterVisitorTupeInviteValidator =>
      translate('please_enter_visitor_type_invite_validator');
  String get confirmNotifyTitle => translate('confirm_notify_title');
  String get confirmNotifySaveContent =>
      translate('confirm_notify_save_content');
  String get noTitle => translate('no_title');
  String get yesTitle => translate('yes_title');
  String get mesNonMyVisitor =>
      translate('mes_non_my_visitor'); //mes_non_my_visitor
  String get confirmNotifySignout => translate('confirm_notify_signout');
  String get feedbackTitle => translate("feed_back_title");
  String get male => translate("male");
  String get female => translate("female");
  String get other => translate("other");
  String get gender => translate("gender");
  String get language => translate('language');
  String get english => translate('english');
  String get vietnamese => translate('vietnamese');
  String get confirmSaveProFile => translate('confirm_save_pro_file');
  String get dateOfBirth => translate('date_of_Birth');
  String get firstName => translate('first_name');
  String get lastName => translate('last_name');
  String get confirmChangeAccountViberZalo =>
      translate('confirm_change_account_viber_zalo');
  String get noneContent => translate('none_content');
  String get bioNotAvailableEnable => translate('bio_not_available_enable');
  String get gotoSettingApp => translate('go_to_settings');
  String get tomorrowTitle => translate('tomorrow');
  String get checkedInTitle => translate('checkedin');
  String get checkedOutTitle => translate('checkedout');
  String get btnCheckOut => translate('btn_check_out');
  String get btnCheckIn => translate('btn_check_in');
  String get invalidQR => translate("invalid_QR");
  String get otpCodeSendContent => translate("otp_code_send_content");
  String get isLate => translate("is_late");
  String get isNoOut => translate("is_no_out");
  String get noCheckedin => translate("no_checkin");
  String get noCheckedinYet => translate("no_checkin_yet");
  String get titleNotification => translate("title_notification");
  String get noGetLocationDevice => translate("no_get_location_device");
  String get locationInvalid => translate("location_invalid");
  String get qrCodeExpired => translate("qrcode_expired");
  String get checkinEmployeeContent => translate("checkin_employee_content");
  String get checkoutEmployeeContent => translate("checkout_employee_content");
  String get checkinEmployeeBranchWrong =>
      translate("checkin_employee_branch_wrong");
  String get confirm => translate("confirm");
  String get authLockedOut => translate("auth_lockedOut");
  String get authNotEnrolled => translate("auth_notEnrolled");
  String get resendOPT => translate("resend_otp");
  String get questionResend => translate("question_resend");
  String get ruleOneAccOneDeviceForActive =>
      translate("rule_one_acc_one_device_for_active");
  String get ruleOneAccOneDeviceForLogin =>
      translate("rule_one_acc_one_device_for_login");
  String get shouldBe8CharPassError => translate("should_be_8_chars_pass_err");
  String get ruleValidPassError => translate("rule_valid_pass_err");
  String get scanQrCodeTitle => translate("scan_qr_code_title");
  String get scanQrBooking => translate("scan_qr_booking");
  String get scanQRCheck => translate("scan_qr_check-in");
  String get getLocationWrong => translate("get_location_wrong");
  String get clearAccountTitle => translate("clear_account_title");
  String get loginByBiometricsTitleSetting =>
      translate("login_by_bio_title_setting");
  String get loginByFaceIDTitleSetting =>
      translate("login_by_faceid_title_setting");
  String get loginByTouchIDTitleSetting =>
      translate("login_by_touchid_title_setting");
  String get loginByIrisTitleSetting =>
      translate("login_by_iris_title_setting");
  String get oldPwInCorrect => translate("old_pw_incorrect");
  String get limitDeviceError => translate("limit_device");
  String get pleaseAuthenContinue =>
      translate("please_authenticate_to_continue");
  String get checkIn => translate("check_in");
  String get checkOut => translate("check_out");
  String get cameraPermissionSetting => translate('camera_permission_setting');
  String get waitingGetLocationDevice =>
      translate('waiting_get_location_device_content');
  String get locationServiceEnableContent =>
      translate('location_services_enable_content');
  String get refreshTokenNotFound =>
      translate('refresh_token_notfound_content');
  String get thisWeekTitle => translate('this_week_title');
  String get hoursTitle => translate('hours_title');
  String get secondsTitle => translate('seconds_title');
  String get minutesTitle => translate('minutes_title');
  String get attendanceTitle => translate('attendance_title');
  String get absent => translate('absent');
  String get calendar => translate('calendar');
  String get changelanguage => translate('en_vi');
  String get somethingWrongContent => translate('something_wrong_content');
  String get downloadingContent => translate('downloading_content');
  String get downloadCompletedContent =>
      translate('download_completed_content');
  String get notificationSettingTitle =>
      translate('notification_setting_title');
  String get changeAccountContent => translate('change_account_content');
  String get hostNotification => translate('host_notification');
  String get contactContent => translate('contact_content');
  String get changeUiContentSetting => translate('changeui_content_setting');
  String get changeUiContentTitle => translate('changeui_content_title');
  String get changeUiDialogTitle => translate('changeui_dialog_title');
  String get changeUiSelectDefault => translate('changeui_select_default');
  String get changeUiSelectAttendace => translate('changeui_select_attendance');
  String get workingHours => translate('working_hours');
  String get workingHoursOfMonth => translate('working_hours_of_month');
  String get january => translate('January');
  String get february => translate('February');
  String get march => translate('March');
  String get april => translate('April');
  String get may => translate('May');
  String get june => translate('June');
  String get july => translate('July');
  String get august => translate('August');
  String get september => translate('September');
  String get october => translate('October');
  String get november => translate('November');
  String get december => translate('December');
  String get viewMoreTitle => translate("view_more_title");
  String get titleSurvey0Vi => translateVi("title_survey_0");
  String get titleSurvey0En => translateEn("title_survey_0");
  String get value0Survey2Vi => translateVi("value_0_survey_2");
  String get value0Survey2En => translateEn("value_0_survey_2");
  String get surveyValidate => translate("survey_validate");
  String get errorMinPhone => translate("message_phone_length");
  String get doneButtonContent => translate('done_button_content');
  String get deleteAvatar => translate('delete_avatar');
  String get changeThemesContentTitle =>
      translate('change_themes_content_title');
  String get changeThemesContentSetting =>
      translate('change_themes_content_setting');
  String get eventCalender => translate('calendar_event');
  String get btnSkip => translate('btn_skip');
  String get locationMessage => translate('location_message');
  String get thisWeek => translate('this_week');
  String get timesTitle => translate('times_title');
  String get totalTimeTitle => translate('total_time_title');
  String get enoughTimeTitle => translate('enough_time_title');
  String get timeTitleWeek => translate('time_title_week');
  String get saveThemeContent => translate('confirm_save_content');
  String get successSaveContent => translate('success_save_content');
  String get monthView => translate('month_view');
  String get weekView => translate('week_view');
  String get dayView => translate('day_view');
  String get blueTitle => translate('blue_title');
  String get yellowTitle => translate('yellow_title');
  String get redTitle => translate('red_title');
  String get duplicateVisitor => translate('visitor_type_duplicate');
  String get addNewVisitorType => translate('add_new_visitor_type');
  String get selectColor => translate('select_color');
  String get listVisitor => translate('list_visitor');
  String get listVisitorEmpty => translate('list_visitor_empty');
  String get errorFormat => translate('error_format');
  String get notSelectLocation => translate('not_select_location');
  String get workedFor => translate('worked_for');
  String get reminderTitle => translate('reminder_title');
  String get reminder5 => translate('reminder_5');
  String get reminder10 => translate('reminder_10');
  String get reminder15 => translate('reminder_15');
  String get reminder30 => translate('reminder_30');
  String get prioritylevel => translate('priority_level');
  String get startTime => translate('start_time');
  String get endTime => translate('end_time');
  String get dialogCreateInvitation => translate('dialog_create_invitaion');
  String get dialogReminderCheck => translate('dialog_reminder_check');
  String get upcomingMeeting => translate('upcoming_meeting');
  String get at => translate('at');
  String get accessLibrary => translate('access_library');
  String get accessImageGalley => translate('access_image_galley');
  String get accessImageGalley1 => translate('access_image_galley1');
  String get accessImageGalley2 => translate('access_image_galley2');
  String get allowAccess => translate('allow_access');
  String get or => translate('or');
  String get goToSetting => translate('go_to_setting');
  String get fineIcon => translate('fine_icon');
  String get enableLibrary => translate('enable_library');
  String get allowAccessbnt => translate('allow_access_bnt');
  String get accessLocation => translate('access_location');
  String get accessLocation1 => translate('access_location1');
  String get accessLocation2 => translate('access_location2');
  String get enableLocation => translate('enable_location');
  String get accessCamera => translate('access_camera');
  String get accessCamera1 => translate('access_camera1');
  String get accessCamera2 => translate('access_camera2');
  String get enableCamera => translate('enable_camera');
  String get accessLocationDevice => translate('access_location_device');
  String get titleVersionApp => translate('title_version_app');
  String get subtitleVersionApp => translate('sub_title_version_app');
  String get subtitleVersionApp1 => translate('sub_title_version_app1');
  String get subtitleVersionApp2 => translate('sub_title_version_app2');
  String get subtitleVersionApp3 => translate('sub_title_version_app3');

  String get updateVersion => translate('update_version');
  String get ticketType => translate('ticket_type');
  String get ticketID => translate('ticket_id');
  String get ticketPrice => translate('ticket_price');
  String get ticketDiscout => translate('ticket_discount');
  String get ticketTotally => translate('ticket_totally');
  String get ticketPayment => translate('ticket_payment');
  String get ticketQuantity => translate('ticket_quantity');
  String get ticketAmount => translate('ticket_amount');
  String get ticketSumQuantity => translate('ticket_sum_quantity');
  String get ticketSumAmount => translate('ticket_sum_amount');
  String get ticketTotalReceived => translate('ticket_total_received');
  String get ticketFree => translate('ticket_free');
  String get day => translate('day');
  String get month => translate('month');
  String get year => translate('year');
  String get inviteCodeError => translate("invite_code_error");
  String get orderNotPaid => translate("order_not_paid");
  String get inviteCodeUsed => translate("invite_code_used");
  String get eventExpired => translate("event_expired");
  String get eventNotStart => translate("event_not_start");
  String get position => translate('position');
  String get payOrder => translate('pay_order');
  String get validateCompany => translate('validate_company');
  String get validatePosition => translate('validate_position');
  String get validateIdcard => translate('validate_idcard');
  String get validateQuantity => translate('validate_quantity');
  String get validateAmount => translate('validate_amount');
  String get ticket => translate('ticket');
  String get paySuccess => translate('pay_success');
  String get errorNo => translate('error_no');
  String get validate => translate('validate');
  String get minTicketError => translate('min_ticket_error');
  String get maxTicketError => translate('max_ticket_error');
  String get remainTicketError => translate('remain_ticket_error');
  String get noTicketError => translate('no_ticket_error');
  String get inviteCode => translate('invite_code');
  String get ticketOrder => translate('order_ticket');
  String get createOrderTicket => translate('create_order_ticket');
  String get discountOrderTicket => translate('discount_order_ticket');
  String get discountTicketFrom => translate('discount_ticket_from');
  String get ticketsAreDiscounted => translate('tickets_are_discounted');
  String get ticketsFare => translate('fare');
  String get ticketsDiscount => translate('discount');
  String get ticketsTemporaryprice => translate('temporary_price');
  String get ticketsIntoMoney => translate('into_money');
  String get ticketsTransfer => translate('transfer');
  String get ticketsCash => translate('cash');
  String get checkedIn => translate('checked_in');
  String get happenning => translate('happenning');
  String get eventHasEnded => translate('event_has_ended');
  String get noEvent => translate('no_event');
  String get etPaymentType => translate('et_payment_type');
  String get eventOnline => translate('event_online');
  String get eventOffline => translate('event_offline');
  String get paidAlready => translate('paid_already');
  String get canNotCheckIn => translate('can_not_check_in');
}

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(overriddenLocale);
    await localizations.load(overriddenLocale);
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}
