import 'dart:async';
import 'dart:ui' as ui;
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/ChoiceValue.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/HomeNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/dashBoard/DashBoardPage.dart';
import 'package:checkinpromobile/src/screens/homeScreen/setting/SettingPage.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorInvitePage.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorLogPage.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorPage.dart';
import 'package:checkinpromobile/src/screens/splashScreen/SplashScreen.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/FABBottomAppBarItem.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:checkinpromobile/src/screens/AttendanceScreen/AttendanceScreen.dart';
import 'package:location/location.dart' as loc;

import 'ItemBottom.dart';

class HomeScreen extends MainScreen {
  static const String route_name = '/homeScreen';

  @override
  HomeScreenState createState() => HomeScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class HomeScreenState extends MainScreenState<HomeNotifier>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  FABBottomAppBar fabBottomAppBar;
  bool isInit = false;

  final FlareControls controls = FlareControls();
  final key = GlobalKey();
  bool isPause = false;

  void _playSuccessAnimation() {
    // Use the controls to trigger an animation.
    controls.play("scan");
  }

  sec5Timer() {
    Timer.periodic(Duration(seconds: 10), (timer) {
      _playSuccessAnimation();
    });
  }

  static const kStyles = [
    ChoiceValue<TabStyle>(
      title: 'TabStyle.react',
      label: 'Appbar use react style',
      value: TabStyle.react,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.reactCircle',
      label: 'Appbar use reactCircle style',
      value: TabStyle.reactCircle,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.flip',
      label: 'Appbar use flip style',
      value: TabStyle.flip,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.textIn',
      label: 'Appbar use textIn style',
      value: TabStyle.textIn,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.titled',
      label: 'Appbar use titled style',
      value: TabStyle.titled,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.fixedCircle',
      label: 'Appbar use fixedCircle style',
      value: TabStyle.fixedCircle,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.fixed',
      label: 'Appbar use fixed style',
      value: TabStyle.fixed,
    ),
  ];
  static final kTabTypes = [
    ChoiceValue<List<TabItem>>(
      title: 'Icon Tab',
      label: 'Appbar use icon with Tab',
      value: ItemBottom.items(image: false),
    ),
    ChoiceValue<List<TabItem>>(
      title: 'Image Tab',
      label: 'Appbar use image with Tab',
      value: ItemBottom.items(image: true),
    ),
  ];

  // var _tabItems = kTabTypes.last;
  // ChoiceValue<TabStyle> _style = kStyles.last;
  // ChoiceValue<Curve> _curve = ItemBottom.curves.first;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void getAttendanceFlag() async {
    provider.isAttendance =
        provider.parent.preferences.getBool(Constants.KEY_IS_ATTENDANCE_MODE) ??
            false;
  }

  bool _isTopPadding = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  List<Widget> _buildIsAttendance() {
    return [
      DashBoardPage.Handler(() {
        provider.tabController.index = 3;
        provider.updateIndex(3);
      }),
      AttendanceScreen(),
      SizedBox(),
      VisitorPage(),
      SettingPage()
    ];
  }

  List<Widget> _buildIsNotAttendance() {
    return [
      DashBoardPage.Handler(() {
        provider.tabController.index = 3;
        provider.updateIndex(3);
      }),
      VisitorInvitePage(),
      SizedBox(),
      VisitorLogPage(),
      SettingPage()
    ];
  }

  List<Widget> _buildTabItemIsAttendance() {
    var colorSelect = ui.Gradient.linear(
      Offset(4.0, 24.0),
      Offset(24.0, 4.0),
      [
        Color(0xff0252b6),
        Color(0xff0087fe),
      ],
    );

    var colorUnselected = ui.Gradient.linear(
      Offset(4.0, 24.0),
      Offset(24.0, 4.0),
      [
        Colors.grey[200],
        Colors.grey,
      ],
    );
    return [
      Tab(
        text: appLocalizations.homeTitleDashboard,
        icon: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return provider.tabController.index == 0
                  ? colorSelect
                  : colorUnselected;
            },
            child: Icon(Icons.home, size: 30)),
        iconMargin: EdgeInsets.all(0.0),
      ),
      Tab(
        text: appLocalizations.attendanceTitle,
        icon: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return provider.tabController.index == 1
                  ? colorSelect
                  : colorUnselected;
            },
            child: Icon(Icons.history, size: 30)),
        iconMargin: EdgeInsets.all(0.0),
      ),
      SizedBox(),
      Tab(
          text: appLocalizations.visitorTitle,
          icon: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return provider.tabController.index == 3
                    ? colorSelect
                    : colorUnselected;
              },
              child: Icon(
                Icons.people_alt_sharp,
                size: 25,
              )),
          iconMargin: EdgeInsets.all(0.0)),
      Tab(
          text: appLocalizations.profile,
          icon: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return provider.tabController.index == 4
                    ? colorSelect
                    : colorUnselected;
              },
              child: Icon(Icons.settings, size: 30)),
          iconMargin: EdgeInsets.all(0.0))
    ];
  }

  List<Widget> _buildTabItemIsNotAttendance() {
    var colorSelect = ui.Gradient.linear(
      Offset(4.0, 24.0),
      Offset(24.0, 4.0),
      [
        Color(0xff0252b6),
        Color(0xff0087fe),
      ],
    );

    var colorUnselected = ui.Gradient.linear(
      Offset(4.0, 24.0),
      Offset(24.0, 4.0),
      [
        Colors.grey[200],
        Colors.grey,
      ],
    );
    return [
      Tab(
        text: appLocalizations.homeTitleDashboard,
        icon: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return provider.tabController.index == 0
                  ? colorSelect
                  : colorUnselected;
            },
            child: Icon(Icons.home, size: 30)),
        iconMargin: EdgeInsets.all(0.0),
      ),
      Tab(
        text: appLocalizations.inviteTabTitle,
        icon: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return provider.tabController.index == 1
                  ? colorSelect
                  : colorUnselected;
            },
            child: Icon(Icons.people_alt_sharp, size: 30)),
        iconMargin: EdgeInsets.all(0.0),
      ),
      SizedBox(),
      Tab(
          text: appLocalizations.historyTitle,
          icon: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return provider.tabController.index == 3
                    ? colorSelect
                    : colorUnselected;
              },
              child: Icon(
                Icons.history,
                size: 25,
              )),
          iconMargin: EdgeInsets.all(0.0)),
      Tab(
          text: appLocalizations.profile,
          icon: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return provider.tabController.index == 4
                    ? colorSelect
                    : colorUnselected;
              },
              child: Icon(Icons.settings, size: 30)),
          iconMargin: EdgeInsets.all(0.0))
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (!isInit) {
      isInit = true;
      provider.tabController = TabController(length: 5, vsync: this);
      provider.tabController.addListener(() {
        if (provider.tabController.index == provider.tabController.length - 1) {
          setState(() {
            _isTopPadding = false;
          });
        } else {
          setState(() {
            _isTopPadding = true;
          });
        }
      });
      getAttendanceFlag();
      sec5Timer();
      provider.configFBCloudMessage(context);
      provider.getUserInfo(context);
      if (provider.arguments != null && provider.arguments["dataNotification"] != null) {
        provider.viewInvitationFromNotification(provider.arguments["dataNotification"] as String);
      }
    }

    // Get total count notification ringbell in dashboard
    locator<Utilities>().paddingTopSizeHeight =
        MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        Container(
          color: context.bgSliverAppBar,
          child: SafeArea(
            bottom: false,
            top: _isTopPadding,
            child: Selector<HomeNotifier, int>(
              builder: (widget, data, child) =>
                  Selector<HomeNotifier, TitleName>(
                builder: (context, dataUserName, child) {
                  return Scaffold(
                    extendBody: true,
                    appBar: data == 4
                        ? null
                        : CustomAppBar(
                            context: context,
                            isAttendance: provider.isAttendance,
                            index: data,
                            provider: provider.getChildProvider(context),
                            userName: dataUserName,
                            callbackTabAvatar: () {
                              provider.tabController.index = 4;
                              provider.updateIndex(4);
                            },
                          ),
                    body: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: provider.tabController..index = data,
                        children: provider.isAttendance
                            ? _buildIsAttendance()
                            : _buildIsNotAttendance()),
                    floatingActionButton: FloatingActionButton(
                      backgroundColor:
                          AppColors.MAIN_TEXT_COLOR.withOpacity(0.4),
                      onPressed: () {
                        provider.validateOpenQR();
                      },
                      child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff0252b6),
                                Color(0xff0087fe),
                              ],
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.qr_code_scanner_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              FlareActor(
                                'assets/images/line_scan.flr',
                                animation: "scan",
                                color: Colors.white,
                                controller: controls,
                              )
                            ],
                          )),
                    ),
                    bottomNavigationBar: BottomAppBar(
                      notchMargin: 4,
                      clipBehavior: Clip.antiAlias,
                      child: PreferredSize(
                        preferredSize: Size(10, 10.0),
                        child: TabBar(
                          unselectedLabelColor: context.bgSwapColor,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: AppColors.DARK_BLUE_TEXT,
                          labelPadding: EdgeInsets.all(0),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: context.bgTabbarBottom,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Family Name',
                          ),
                          tabs: provider.isAttendance
                              ? _buildTabItemIsAttendance()
                              : _buildTabItemIsNotAttendance(),
                          controller: provider.tabController,
                          onTap: (int i) {
                            provider.updateIndex(i);
                          },
                        ),
                      ),
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerDocked,
                  );
                },
                selector: (buildContext, modelProvider) =>
                    modelProvider.userName,
              ),
              selector: (buildContext, provider) => provider.currentIndex,
            ),
          ),
        ),
        FutureBuilder<loc.LocationData>(
          future: provider.getLocationInit(),
          builder:
              (BuildContext context, AsyncSnapshot<loc.LocationData> snapshot) {
            return IgnorePointer(
              ignoring: true,
              child: AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: !provider.isDoneInitLocation && provider.isAttendance ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                // The green box must be a child of the AnimatedOpacity widget.
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: context.bgCard,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppImage.giphy,
                      Container(
                        height: 10,
                      ),
                      Text(
                        appLocalizations.locationMessage,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ),
                ),
              ),
            ); // unreachable
          },
        ),
      ],
    );
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        {
          if (isPause) {
            isPause = false;
            var dateTime = DateTime.now();
            var timeStamp = dateTime.millisecondsSinceEpoch;
            var lastTime =
                provider.parent.preferences.getInt(Constants.KEY_LAST_TIME) ??
                    timeStamp;
            var timeBackground = (timeStamp - lastTime) / 60000;
            if (timeBackground >= Constants.TIMEOUT_RESTART) {
              AppRouter.pushTo(context, SplashScreen.route_name,
                  isRemoveUntil: true, transitionType: TransitionType.fadeIn);
            }
          }
          break;
        }
      case AppLifecycleState.inactive:
        {
          break;
        }
      case AppLifecycleState.paused:
        {
          isPause = true;
          provider.parent.preferences.setInt(
              Constants.KEY_LAST_TIME, DateTime.now().millisecondsSinceEpoch);
          locator<Utilities>().timeoutToResetApp?.cancel();
          break;
        }
      case AppLifecycleState.detached:
        {
          break;
        }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
