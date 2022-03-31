import 'package:checkinpromobile/src/screens/ActiveEmail/ActiveEmailNotifier.dart';
import 'package:checkinpromobile/src/screens/ActiveEmail/ActiveEmailScreen.dart';
import 'package:checkinpromobile/src/screens/AttendanceScreen/AttendanceNotifier.dart';
import 'package:checkinpromobile/src/screens/CreateGuest/CreateGuestNotifier.dart';
import 'package:checkinpromobile/src/screens/CreateGuest/CreateGuestScreen.dart';
import 'package:checkinpromobile/src/screens/DomainPage/DomainNotifier.dart';
import 'package:checkinpromobile/src/screens/DomainPage/DomainScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/createInvitation/DetailEventsCalendar.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/createInvitation/DetailEventsCalendarNotifier.dart';
import 'package:checkinpromobile/src/screens/EventDetail/EventDetailNotifier.dart';
import 'package:checkinpromobile/src/screens/EventDetail/EventDetailScreen.dart';
import 'package:checkinpromobile/src/screens/Notification/NotificationNotifier.dart';
import 'package:checkinpromobile/src/screens/Notification/NotificationScreen.dart';
import 'package:checkinpromobile/src/screens/OtpVerifyScreen/OtpVerifyNotifier.dart';
import 'package:checkinpromobile/src/screens/OtpVerifyScreen/OtpVerifyScreen.dart';
import 'package:checkinpromobile/src/screens/ResetPassword/ResetPasswordNotifier.dart';
import 'package:checkinpromobile/src/screens/ResetPassword/ResetPasswordScreen.dart';
import 'package:checkinpromobile/src/screens/SurveyScreen/SurveyNotifier.dart';
import 'package:checkinpromobile/src/screens/SurveyScreen/SurveyScreen.dart';
import 'package:checkinpromobile/src/screens/VerifyEmailForgotPass/VerifyEmailForgotPassNotifier.dart';
import 'package:checkinpromobile/src/screens/VerifyEmailForgotPass/VerifyEmailForgotPassScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/ChangePassWord/ChangePassWordNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/ChangePassWord/ChangePassWordScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/Chart/ChartNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/HomeNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/HomeScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/SettingChangeUI/ChangeUiSettingsNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/SettingChangeUI/ChangeUiSettingsScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/SettingNotification/NotificationSettingNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/SettingNotification/NotificationSettingScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/dashBoard/DashBoardNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/setting/SettingNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/ItemVisitorInvitationNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/ItemVisitorInvitationScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorInviteNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorLogNotifier.dart';
import 'package:checkinpromobile/src/screens/jobInfo/JobInfoNotifier.dart';
import 'package:checkinpromobile/src/screens/jobInfo/JobInfoScreen.dart';
import 'package:checkinpromobile/src/screens/login/LoginNotifier.dart';
import 'package:checkinpromobile/src/screens/login/LoginScreen.dart';
import 'package:checkinpromobile/src/screens/personalInfor/InforPersonNotifier.dart';
import 'package:checkinpromobile/src/screens/personalInfor/InforPersonScreen.dart';
import 'package:checkinpromobile/src/screens/print/PrinterNotifier.dart';
import 'package:checkinpromobile/src/screens/print/PrinterPage.dart';
import 'package:checkinpromobile/src/screens/scanQR/ScanQRNotifier.dart';
import 'package:checkinpromobile/src/screens/scanQR/ScanQRScreen.dart';
import 'package:checkinpromobile/src/screens/splashScreen/SplashNotifier.dart';
import 'package:checkinpromobile/src/screens/splashScreen/SplashScreen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checkinpromobile/src/screens/homeScreen/SettingChangeThemes/ChangeThemesSettingsNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/SettingChangeThemes/ChangeThemesSettingsScreen.dart';

class AppRoutes {
  static final routeNotFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Route not found"),
          ],
        ),
      ),
    );
  });

  static final rootRoute =
      AppRoute('/', Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
        create: (_) => SplashNotifier(), child: SplashScreen());
  }));

  static final homeRoute =
      AppRoute(HomeScreen.route_name, Handler(handlerFunc: (context, params) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeNotifier()),
        ChangeNotifierProvider(create: (_) => DashBoardNotifier()),
        ChangeNotifierProvider(create: (_) => VisitorInviteNotifier()),
        ChangeNotifierProvider(create: (_) => VisitorLogNotifier()),
        ChangeNotifierProvider(create: (_) => AttendanceNotifier()),
        ChangeNotifierProvider(create: (_) => SettingNotifier()),
        ChangeNotifierProvider(create: (_) => ChartNotifier()),
      ],
      child: HomeScreen(),
    );
  }));

  static final loginRoute =
      AppRoute(LoginScreen.route_name, Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
        create: (_) => LoginNotifier(), child: LoginScreen());
  }));

  static final domainRoute =
      AppRoute(DomainScreen.route_name, Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => DomainNotifier(),
      child: DomainScreen(),
    );
  }));

  static final itemVisitorInvitationRoute =
      AppRoute(ItemVisitorInvitationScreen.route_name,
          Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => ItemVisitorInvitationNotifier(),
      child: ItemVisitorInvitationScreen(),
    );
  }));

  static final changeUISettingRoute = AppRoute(ChangeUIScreen.route_name,
      Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => ChangUiSettingsNotifier(),
      child: ChangeUIScreen(),
    );
  }));
  static final changeThemesSettingRoute = AppRoute(
      ChangeThemesScreen.route_name, Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => ChangThemesSettingsNotifier(),
      child: ChangeThemesScreen(),
    );
  }));

  static final scanQRRoute =
      AppRoute(ScanQRScreen.route_name, Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => ScanQRNotifier(),
      child: ScanQRScreen(),
    );
  }));

  static final otpVerifyRoute = AppRoute(OtpVerifyScreen.route_name,
      Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => OtpVerifyNotifier(),
      child: OtpVerifyScreen(),
    );
  }));

  static final activeEmailRoute = AppRoute(ActiveEmailScreen.route_name,
      Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => ActiveEmailNotifier(),
      child: ActiveEmailScreen(),
    );
  }));

  static final inforPersonRoute = AppRoute(InforPersonScreen.route_name,
      Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => InforPersonNotifier(),
      child: InforPersonScreen(),
    );
  }));

  static final notificationRoute = AppRoute(NotificationScreen.route_name,
      Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => NotificationNotifier(),
      child: NotificationScreen(),
    );
  }));

  static final resetPasswordRoute = AppRoute(ResetPasswordScreen.route_name,
      Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => ResetPasswordNotifier(),
      child: ResetPasswordScreen(),
    );
  }));

  static final jobInfoRoute = AppRoute(JobInfoScreen.route_name,
      Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => JobInfoNotifier(),
      child: JobInfoScreen(),
    );
  }));

  static final eventDetailRoute = AppRoute(EventDetailScreen.route_name,
      Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => EventDetailNotifier(),
      child: EventDetailScreen(),
    );
  }));

  static final verifyEmailForgotPassRoute =
      AppRoute(VerifyEmailForgotPassScreen.route_name,
          Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => VerifyEmailForgotPassNotifier(),
      child: VerifyEmailForgotPassScreen(),
    );
  }));

  static final printerRoute =
      AppRoute(PrinterPage.route_name, Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => PrinterNotifier(),
      child: PrinterPage(),
    );
  }));

  static final notificationSettingRoute =
      AppRoute(NotificationSettingScreen.route_name,
          Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => NotificationSettingNotifier(),
      child: NotificationSettingScreen(),
    );
  }));

  static final changePasswordRoute = AppRoute(ChangePasswordScreen.route_name,
      Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => ChangePasswordNotifier(),
      child: ChangePasswordScreen(),
    );
  }));

  static final createOrderTicket = AppRoute(CreateGuestScreen.route_name,
      Handler(handlerFunc: (context, params) {
        return ChangeNotifierProvider(
          create: (_) => CreateGuestNotifier(),
          child: CreateGuestScreen(),
        );
      }));

  static final surveyRoute =
      AppRoute(SurveyScreen.route_name, Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => SurveyNotifier(),
      child: SurveyScreen(),
    );
  }));

  static final createInvitation =
  AppRoute(DetailEventsPage.route_name, Handler(handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (_) => DetailEventCalendarNotifier(),
      child: DetailEventsPage(),
    );
  }));

  static final List<AppRoute> routes = [
    rootRoute,
    homeRoute,
    loginRoute,
    domainRoute,
    itemVisitorInvitationRoute,
    changeUISettingRoute,
    changeThemesSettingRoute,
    scanQRRoute,
    otpVerifyRoute,
    activeEmailRoute,
    inforPersonRoute,
    notificationRoute,
    resetPasswordRoute,
    jobInfoRoute,
    eventDetailRoute,
    verifyEmailForgotPassRoute,
    printerRoute,
    notificationSettingRoute,
    changePasswordRoute,
    surveyRoute,
    createInvitation,
    createOrderTicket
  ];
}
