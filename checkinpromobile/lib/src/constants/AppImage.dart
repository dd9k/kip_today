import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter_svg/svg.dart';

import 'SizeConfig.dart';

class AppImage {
  static var viFlag = Image.asset(
    "assets/images/vi_flag.png",
    cacheWidth: 100 * SizeConfig.devicePixelRatio,
    cacheHeight: 100 * SizeConfig.devicePixelRatio,
  );
  static var enFlag = Image.asset(
    "assets/images/en_flag.png",
    cacheWidth: 100 * SizeConfig.devicePixelRatio,
    cacheHeight: 100 * SizeConfig.devicePixelRatio,
  );
  static var checkinProBlue = Image.asset(
    'assets/images/logo_company.png',
    cacheWidth: 228 * SizeConfig.devicePixelRatio,
    cacheHeight: 45 * SizeConfig.devicePixelRatio,
    // scale: 1,
  );
  static var checkinProDarkMode = Image.asset(
    'assets/images/checkinPro_blue_dark_mode.png',
    cacheWidth: 242 * SizeConfig.devicePixelRatio,
    cacheHeight: 45 * SizeConfig.devicePixelRatio,
    scale: 1.5,
  );
  static var checkinProBlueHalf = Image.asset(
    'assets/images/checkinPro_blue.png',
    cacheWidth: 242 * SizeConfig.devicePixelRatio,
    cacheHeight: 45 * SizeConfig.devicePixelRatio,
    scale: 1.5,
  );
  static var checkinProWhite = Image.asset(
    'assets/images/logo_white.png',
    cacheWidth: 242 * SizeConfig.devicePixelRatio,
    cacheHeight: 45 * SizeConfig.devicePixelRatio,
    scale: 2.0,
  );
  static var icEmail = Image.asset(
    'assets/images/ic_email.png',
    cacheWidth: 15 * SizeConfig.devicePixelRatio,
    cacheHeight: 13 * SizeConfig.devicePixelRatio,
  );
  static var icPassword = Image.asset(
    'assets/images/ic_password.png',
    cacheWidth: 14 * SizeConfig.devicePixelRatio,
    cacheHeight: 21 * SizeConfig.devicePixelRatio,
  );
  static var icPrintfinger = Image.asset(
    'assets/images/ic_printfinger.png',
    cacheWidth: 40 * SizeConfig.devicePixelRatio,
    cacheHeight: 40 * SizeConfig.devicePixelRatio,
    fit: BoxFit.cover,
  );
  static var icClearKeyBoard = Image.asset(
    'assets/images/ic_clear_keyboard.png',
    cacheWidth: 80 * SizeConfig.devicePixelRatio,
    cacheHeight: 80 * SizeConfig.devicePixelRatio,
    fit: BoxFit.fill,
  );
  static var icCircleCamera = Image.asset(
    'assets/images/circle_camera.png',
    cacheWidth: 30 * SizeConfig.devicePixelRatio,
    cacheHeight: 30 * SizeConfig.devicePixelRatio,
  );
  static var icSms = Image.asset(
    'assets/images/ic_sms.png',
    cacheWidth: 22 * SizeConfig.devicePixelRatio,
    cacheHeight: 20 * SizeConfig.devicePixelRatio,
  );
  static var icHistoryBlue = Image.asset(
    'assets/images/ic_history_blue.png',
    cacheWidth: 32 * SizeConfig.devicePixelRatio,
    cacheHeight: 30 * SizeConfig.devicePixelRatio,
    fit: BoxFit.cover,
  );
  static var icCall = Image.asset(
    'assets/images/ic_call.png',
    cacheWidth: 30 * SizeConfig.devicePixelRatio,
    cacheHeight: 31 * SizeConfig.devicePixelRatio,
    fit: BoxFit.cover,
    color: AppColors.WHITE_LESS,
  );
  static var icChat = Image.asset(
    'assets/images/ic_chat.png',
    cacheWidth: 43 * SizeConfig.devicePixelRatio,
    cacheHeight: 42 * SizeConfig.devicePixelRatio,
    fit: BoxFit.cover,
    color: AppColors.WHITE_LESS,
  );
  static var icClock = Image.asset(
    'assets/images/ic_clock.png',
    cacheWidth: 28 * SizeConfig.devicePixelRatio,
    cacheHeight: 26 * SizeConfig.devicePixelRatio,
    fit: BoxFit.cover,
  );
  static var scanQR = FlareActor(
    'assets/images/scanner.flr',
    shouldClip: false,
    animation: "scan",
    color: Colors.black,
  );
  static var people = Image.asset('assets/images/people2.png',
      width: 20, height: 20, color: AppColors.HIGHLIGHT_LOADING);
  static var peopleActive = Image.asset(
    'assets/images/people2.png',
    color: AppColors.MAIN_TEXT_COLOR,
  );
  static var history = Image.asset('assets/images/history2.png',
      color: AppColors.HIGHLIGHT_LOADING);
  static var historyActive = Image.asset(
    'assets/images/history2.png',
    color: AppColors.MAIN_TEXT_COLOR,
  );
  static var home =
      Image.asset('assets/images/home.png', color: AppColors.HIGHLIGHT_LOADING);
  static var homeActive = Image.asset(
    'assets/images/home.png',
    color: AppColors.MAIN_TEXT_COLOR,
  );
  static var setting =
      Image.asset('assets/images/setting.png', color: AppColors.GRAY);
  static var settingActive = Image.asset(
    'assets/images/setting.png',
    color: AppColors.MAIN_TEXT_COLOR,
  );
  static var addBtn = Image.asset('assets/images/add_btn.png',
      cacheWidth: 54 * SizeConfig.devicePixelRatio,
      cacheHeight: 51 * SizeConfig.devicePixelRatio,
      color: AppColors.MAIN_TEXT_COLOR);

  static var backBtn = Image.asset(
    'assets/images/back_btn.png',
    color: AppColors.DARK_BLUE_TEXT,
    cacheWidth: 66 * SizeConfig.devicePixelRatio,
    cacheHeight: 37 * SizeConfig.devicePixelRatio,
  );
  static var backBtnWhite = Image.asset(
    'assets/images/back_btn.png',
    cacheWidth: 69 * SizeConfig.devicePixelRatio,
    cacheHeight: 40 * SizeConfig.devicePixelRatio,
    color: AppColors.WHITE_LESS,
  );
  static var temp = Image.asset(
    'assets/images/temp.png',
    fit: BoxFit.cover,
  );
  static var arrowRight = Image.asset(
    'assets/images/arrow_right.png',
    cacheWidth: 5 * SizeConfig.devicePixelRatio,
    cacheHeight: 9 * SizeConfig.devicePixelRatio,
    fit: BoxFit.cover,
  );
  static var defaultAvatar = Image.asset(
    "assets/images/default_avatar.png",
    fit: BoxFit.cover,
  );
  static var icLetterInvite =
      Image.asset("assets/images/ic_letter_invite.png", fit: BoxFit.cover);
  static var icSuccess = Image.asset(
    "assets/images/ic_success.png",
    fit: BoxFit.cover,
    cacheWidth: SizeConfig.devicePixelRatio,
    cacheHeight: SizeConfig.devicePixelRatio,
  );
  static var icRangCua = Image.asset(
    "assets/images/ic_rangcua.png",
    fit: BoxFit.cover,
    cacheWidth: 50 * SizeConfig.devicePixelRatio,
    cacheHeight: 50 * SizeConfig.devicePixelRatio,
    color: Colors.white,
  );
  static var icEditPen = Image.asset(
    'assets/images/ic_edit.png',
    cacheWidth: 20 * SizeConfig.devicePixelRatio,
    cacheHeight: 20 * SizeConfig.devicePixelRatio,
  );
  static var tabMenuProfile = Image.asset(
    'assets/images/ic_profile.png',
  );
  static var tabMenuProfileActive = Image.asset(
    'assets/images/ic_profile.png',
    color: AppColors.MAIN_TEXT_COLOR,
  );
  static var icRingBell = Image.asset(
    'assets/images/ic_ring_bell.png',
    cacheWidth: 200 * SizeConfig.devicePixelRatio,
    cacheHeight: 200 * SizeConfig.devicePixelRatio,
    color: Utilities().localIndexThemes == 0
        ? Color(0xff757575)
        : AppColors.BACKGROUND_MAIN,
  );
  static var icDoubleCheck = Image.asset('assets/images/ic_double_check.png',
      cacheWidth: 26 * SizeConfig.devicePixelRatio,
      cacheHeight: 23 * SizeConfig.devicePixelRatio,
      color: AppColors.MAIN_TEXT_COLOR);
  static var icCircleStatusUnRead = Image.asset(
    'assets/images/ic_circle_status_read.png',
  );
  static var icCircleStatusRead = Image.asset(
      'assets/images/ic_circle_status_read.png',
      color: Color(0xFFD8D8D8));

  static var logoCompany = Image.asset(
    'assets/images/logo_company.png',
    cacheWidth: 228 * SizeConfig.devicePixelRatio,
    cacheHeight: 45 * SizeConfig.devicePixelRatio,
  );

  static var viber = Image.asset(
    'assets/images/viber.png',
    scale: 20,
  );

  static var zalo = Image.asset(
    'assets/images/zalo.jpg',
    scale: 7,
  );

  static var checkinPro = Image.asset(
    'assets/images/ic_logo.png',
    width: 25,
    height: 25,
    fit: BoxFit.cover,
  );

  static var giphy = Image.asset(
    'assets/images/giphy.gif',
    cacheWidth: 480 * SizeConfig.devicePixelRatio,
    cacheHeight: 749 * SizeConfig.devicePixelRatio,
    scale: 5,
  );
  static var checkin = SvgPicture.asset('assets/images/checkin.svg');
  static var checkout = SvgPicture.asset('assets/images/checkout.svg');
  static var icHome = SvgPicture.asset('assets/images/iconhome.svg');
  static var icCalendar = SvgPicture.asset('assets/images/calendar.svg');
  static var icEditInvitation =
      SvgPicture.asset('assets/images/ic_edit_invitation.svg');
  static var icLocationInvitation =
      SvgPicture.asset('assets/images/ic_location_invitation.svg');
  static var icGuestsInvitation =
      SvgPicture.asset('assets/images/ic_guests_invitation.svg');
  static var icListGuestsInvitation =
      SvgPicture.asset('assets/images/ic_list_guests_invitation.svg');
  static var icDateInvitation =
      SvgPicture.asset('assets/images/ic_date_invitation.svg');
  static var icStartTimeInvitation =
      SvgPicture.asset('assets/images/ic_start_time_invitation.svg');
  static var icEndTimeInvitation =
      SvgPicture.asset('assets/images/ic_end_time_invitation.svg');
  static var icAlertInvitation =
      SvgPicture.asset('assets/images/ic_alert_invitation.svg');
  static var icDescribeInvitation =
      SvgPicture.asset('assets/images/ic_describe_invitation.svg');
  static var icAddInvitation =
      SvgPicture.asset('assets/images/ic_add_invitation.svg');
}
