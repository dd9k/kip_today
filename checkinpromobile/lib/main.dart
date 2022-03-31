import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppRoutes.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/ConnectionStatusSingleton.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/services/SyncService.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';
import 'src/constants/Constants.dart';
import 'src/themes/AppThemes.dart';
import 'dart:async';
import 'package:logging/logging.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/Shared.dart';
import 'src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/themes/TextTheme.dart';

//Main for example provider
// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  var isConnection = true;
  SharedPreferences preferences;
  var isPause = false;

  static MyApp of(BuildContext context) {
    return context.findAncestorWidgetOfExactType();
  }

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  StreamSubscription<DataConnectionStatus> connectionChecker;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    locator<Utilities>().printLog("build app......................................");
    // Change is 5 seconds. Interval is the time between automatic checks
    DataConnectionChecker().checkInterval = Duration(seconds: 5);
    // Actively listen for status updates
    connectionChecker = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          if (widget.isConnection == false) {
            widget.isConnection = true;
            Utilities().printLog('Function DataConnectionChecker === Data connection is available.');
            // Sync to server
            locator<SyncService>().syncEventCheckedGuest(context);
            locator<SyncService>().syncInvitationCheckedVisitor(context);
          }
          break;
        case DataConnectionStatus.disconnected:
          widget.isConnection = false;
          Utilities().printLog('Function DataConnectionChecker === You are disconnected from the internet.');
          break;
      }
    });
    // Build layout
    return FutureBuilder<String>(
        future: getLanguage(context),
        builder: (widget, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            SpecificLocalizationDelegate _localeOverrideDelegate = SpecificLocalizationDelegate(Locale(snapshot.data));
            return OverlaySupport(
              child: ChangeNotifierProvider<ThemeChanger>(
                create: (_) => ThemeChanger(),
                child: Builder(
                  builder: (BuildContext context) {
                    final themeChanger = Provider.of<ThemeChanger>(context);
                    return MaterialApp(
                      themeMode: themeChanger.themeMode,
                      theme: ThemeData(
                        brightness: Brightness.light,
                        backgroundColor: AppColors.BG_COLOR_LIGHT,
                        primaryColor: Colors.blue,
                        fontFamily: AppTextStyles.helveticaFont,
                        scaffoldBackgroundColor: AppColors.BG_COLOR_LIGHT,
                        floatingActionButtonTheme: FloatingActionButtonThemeData(
                          backgroundColor: AppColors.RED_COLOR,
                        ),
                        appBarTheme: AppBarTheme(
                          brightness: Brightness.light,
                          color: AppColors.APPBAR_BG_COLOR_LIGHT,
                          iconTheme: IconThemeData(color: AppColors.MAIN_TEXT_COLOR),
                          textTheme: AppTextTheme.getBlueLightTextTheme(),
                        ),
                        iconTheme: IconThemeData(
                          color: AppColors.TITLE_APPBAR_COLOR, //_darkIconColor,
                        ),
                        bottomAppBarTheme: BottomAppBarTheme(
                          elevation: 10,
                          shape: CircularNotchedRectangle(),
                          color: AppColors.BACKGROUND_MAIN,
                        ),
                        tabBarTheme: TabBarTheme(
                          labelColor: AppColors.BACKGROUND_MAIN,
                          unselectedLabelColor: AppColors.BLACK_TEXT_COLOR,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: AppColors.MAIN_TEXT_COLOR,
                          ),
                        ),
                        cardTheme: CardTheme(
                          color: AppColors.CARD_COLOR_LIGHT,
                        ),
                        textTheme: AppTextTheme.getBlueLightTextTheme(),
                      ),
                      darkTheme: ThemeData(
                        primarySwatch: Colors.blue,
                        accentColor: Colors.blue,
                        brightness: Brightness.dark,
                        backgroundColor: AppColors.BG_COLOR_DARK,
                        primaryColor: AppColors.MAIN_TEXT_COLOR,
                        fontFamily: AppTextStyles.helveticaFont,
                        scaffoldBackgroundColor: AppColors.BG_COLOR_DARK,
                        floatingActionButtonTheme: FloatingActionButtonThemeData(
                          backgroundColor: AppColors.RED_COLOR,
                        ),
                        appBarTheme: AppBarTheme(
                          brightness: Brightness.dark,
                          color: AppColors.APPBAR_BG_COLOR_DARK,
                          iconTheme: IconThemeData(color: AppColors.MAIN_TEXT_COLOR),
                          textTheme: AppTextTheme.getBlueDarkTextTheme(),
                        ),
                        bottomAppBarTheme: BottomAppBarTheme(
                          elevation: 10,
                          shape: CircularNotchedRectangle(),
                          color: AppColors.CARD_COLOR_DARK,
                        ),
                        //cardColor: AppColors.TEXT_GRAY,
                        cardTheme: CardTheme(
                          color: AppColors.CARD_COLOR_DARK,
                        ),
                        tabBarTheme: TabBarTheme(
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: AppColors.CARD_COLOR_DARK,
                          ),
                          unselectedLabelColor: AppColors.GRAY,
                        ),
                        iconTheme: IconThemeData(
                          color: AppColors.TITLE_APPBAR_COLOR,
                        ),
                        textTheme: AppTextTheme.getBlueDarkTextTheme(),
                      ),
                      debugShowCheckedModeBanner: false,
                      builder: (context, child) {
                        final mediaQueryData = MediaQuery.of(context);
                        final scale = mediaQueryData.textScaleFactor.clamp(0.8, 1.35);
                        return MediaQuery(
                          child: child,
                          data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
                        );
                      },
                      onGenerateRoute: AppRouter.router.generator,
                      supportedLocales: [Locale(Constants.EN_CODE), Locale(Constants.VN_CODE)],
                      localizationsDelegates: [
                        _localeOverrideDelegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate
                      ],
                    );
                  },
                ),
              ),
            );
          }
          return Material();
        });
  }

  _getAttendanceModeInPreference() async {
    var preferences = await SharedPreferences.getInstance();
    String value = preferences.getString(Constants.KEY_CHANGE_THEMES) ?? "0";
    Utilities().localIndexThemes = int.parse(value);
  }

  Future<String> getLanguage(BuildContext context) async {
    widget.isConnection = await locator<Utilities>().isConnectInternet();
    var completer = Completer<String>();
    widget.preferences = await SharedPreferences.getInstance();
    var lang = widget.preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
    if (lang.isEmpty || !Constants.LIST_LANG.contains(lang)) {
      lang = Constants.EN_CODE;
    }
    Constants.CURRENT_LANG_CODE = lang;
    completer.complete(lang);
    return completer.future;
  }

  @override
  void initState() {
    super.initState();

    // Create router
    AppRouter appRouter = AppRouter(
      routes: AppRoutes.routes,
      notFoundHandler: AppRoutes.routeNotFoundHandler,
    );
    appRouter.setupRoutes();
    _getAttendanceModeInPreference();
  }

  @override
  void dispose() {
    connectionChecker?.cancel();
    super.dispose();
  }

  @override
  // ignore: override_on_non_overriding_member
  void onDeactivate() {
    super.deactivate();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  _setupLogging();
  ConnectionStatusSingleton.getInstance().initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.BACKGROUND_MAIN,
      statusBarColor: Colors.transparent,
    ),
  );
  Wakelock.enable();
  runApp(MultiProvider(
    providers: [
      Provider(
          create: (BuildContext context) => constructDb(), dispose: (BuildContext context, Database db) => db.close()),
    ],
    child: MyApp(),
  ));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    Utilities().printLog('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
