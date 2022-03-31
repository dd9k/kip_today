import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/createInvitation/DetailEventsCalendar.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/createInvitation/DetailEventsCalendarNotifier.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorInviteNotifier.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/CalendarAppointmentEditor.dart';
import 'package:checkinpromobile/src/widgetUtilities/SmartRefreshCustom.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'ItemInvitation.dart';
import 'ItemVisitorLog.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';

class VisitorInvitePage extends MainScreen {
  @override
  VisitorInviteState createState() => VisitorInviteState();

  @override
  String getNameScreen() {
    return "VisitorInvitePage";
  }
}

class VisitorInviteState extends MainScreenState<VisitorInviteNotifier>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<MainScreen> {
  VisitorInviteNotifier provider;
  CalendarController calendarController = CalendarController();
  bool isInit = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInit) {
      isInit = true;
      provider.langSaved =
          provider.parent.preferences.getString(Constants.KEY_LANGUAGE) ??
              Constants.LANG_DEFAULT;
      provider.invitationDataSource.currentLang = provider.langSaved;
      calendarController.view = CalendarView.month;
      provider.getAPIVisitorInvitation(context);
      provider.getCalendarVisitorInvitation(DateTime.now().month);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Selector<VisitorInviteNotifier, bool>(
      builder: (context, data, child) {
        if (data) {
          return itemLoading();
        } else {
          return Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Stack(
                children: [
                  Selector<VisitorInviteNotifier, bool>(
                    builder: (context, isCalendar, child) {
                      if (isCalendar) {
                        return buildCalendar();
                      }
                      return buildScheduler(context);
                    },
                    selector: (context, provider) => provider.isCalendar,
                  ),
                  buildCalendarView(),
                ],
              ));
        }
      },
      selector: (context, provider) => provider.isLoading,
    );
  }

  Positioned buildCalendarView() {
    return Positioned.fill(
      top: 5,
      right: 10,
      child: Align(
        alignment: Alignment.topRight,
        child: Selector<VisitorInviteNotifier, bool>(
          builder: (context, isCalendar, child) {
            return Visibility(
              child: Container(
                height: 25,
                width: 25,
                alignment: Alignment.center,
                child: Selector<VisitorInviteNotifier, CalendarView>(
                  builder: (context, calendarView, child) {
                    return PopupMenuButton<CalendarView>(
                      initialValue: calendarView,
                      onSelected: (CalendarView newValue) {
                        calendarController.view = newValue;
                        provider.updateCalendarView(newValue);
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: context.bgSwapColor,
                      ),
                      padding: const EdgeInsets.all(0.0),
                      itemBuilder: (BuildContext context) {
                        return <CalendarView>[
                          CalendarView.month,
                          CalendarView.week,
                          CalendarView.day,
                        ].map((CalendarView choice) {
                          return PopupMenuItem<CalendarView>(
                            value: choice,
                            child: Text(
                              provider.getNameFromCalendarView(choice),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                    fontSize: 13,
                                    color: context.bgSwapColor,
                                  ),
                            ),
                          );
                        }).toList();
                      },
                    );
                  },
                  selector: (context, provider) => provider.calendarView,
                ),
              ),
              visible: isCalendar,
            );
          },
          selector: (context, provider) => provider.isCalendar,
        ),
      ),
    );
  }

  Stack buildCalendar() {
    return Stack(
      children: [
        Selector<VisitorInviteNotifier, bool>(
          builder: (context, isLoadingCalendar, child) {
            return AbsorbPointer(
              absorbing: isLoadingCalendar,
              child: RefreshConfiguration(
                  footerTriggerDistance: 400,
                  child: SmartRefresher(
                      child: Container(
                        height: heightScreen * 75,
                        child: CalendarAppointmentEditor(
                            provider.invitationDataSource,
                            calendarController,
                            provider.langSaved),
                      ),
                      onRefresh: _onRefresh,
                      onLoading: () {
//                                        _onLoading(context);
                      },
                      header: MaterialClassicHeader(
                        distance: 40,
                      ),
                      footer: SmartRefreshFooter(),
                      enablePullDown: true,
                      enablePullUp: true,
                      controller: provider.refreshController)),
            );
          },
          selector: (context, provider) => provider.isLoadingCalendar,
        ),
        Positioned.fill(
            child: Align(
                alignment: Alignment.center,
                child: Selector<VisitorInviteNotifier, bool>(
                  builder: (context, isLoadingCalendar, child) {
                    return Visibility(
                      visible: isLoadingCalendar &&
                          !provider.refreshController.isRefresh,
                      child: CircularProgressIndicator(),
                    );
                  },
                  selector: (context, provider) => provider.isLoadingCalendar,
                ))),
      ],
    );
  }

  _onRefresh() {
    provider.doTryAgain();
  }

  Widget buildScheduler(BuildContext context) {
    return Selector<VisitorInviteNotifier, List<InviteNewVisitor>>(
      builder: (context, data, child) {
        if (data != null && data.isEmpty == false) {
          return Selector<VisitorInviteNotifier, bool>(
            builder: (context, updateScheduler, child) {
              return ItemInvitation(
                listInvitation: provider.listInvitationGroup,
                itemLogType: ItemLogType.VISITOR,
                itemClickFunc: (InviteNewVisitor newVisitor) {
                  bool isViewMode = newVisitor.status != InvitationStatus.DRAFT;
                  bool isEditOld = !isViewMode;
                  AppRouter.pushToWithArguments(context, DetailEventsPage.route_name, arguments: {
                    'inviteOld': newVisitor,
                    'isViewMode': isViewMode
                  }, transitionType: TransitionType.inFromBottom, transitionDuration: Duration(milliseconds: 500)).then((value) {
                    if (newVisitor.isSent && isEditOld) {
                      provider.updateOldInvite(newVisitor);
                    }
                  });
                },
                pullRefreshFunc: (callbackFn) {
                  provider.resetInviteData();
                  provider.getAPIVisitorInvitation(context, callbackFn: () {
                    callbackFn();
                  });
                },
                loadingMoreFunc: (callbackFn) {
                  provider.getAPIVisitorInvitation(context, callbackFn: () {
                    callbackFn();
                  });
                },
              );
            },
            selector: (context, provider) => provider.updateScheduler,
          );
        }
        return _buildLayoutNotFound();
      },
      selector: (context, provider) => provider.listVisitorInvitation,
    );
  }

  Widget itemLoading() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
      //color: AppColors.BACKGROUND_MAIN,
    );
  }

  Widget _buildLayoutNotFound() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/pic_no_data_found.png',
              cacheWidth: (857 ~/ 4) * SizeConfig.devicePixelRatio,
              cacheHeight: (781 ~/ 4) * SizeConfig.devicePixelRatio,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                AppLocalizations.of(context).noResultsFoundTitle,
                style: TextStyle(
                  fontSize: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 1.85),
                  fontFamily: AppTextStyles.tahomaFont,
                ),
              ),
            ),
            _buildBtnTryAgainRefresh()
          ],
        ),
      ),
    );
  }

  Widget _buildBtnTryAgainRefresh() {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
      child: ArgonTimerButton(
        elevation: 0,
        height: 30,
        width: MediaQuery.of(context).size.width * 0.3,
        minWidth: MediaQuery.of(context).size.width * 0.3,
        color: context.bgSliverAppBar,
        highlightColor: Colors.transparent,
        roundLoadingShape: true,
        borderSide: BorderSide(
          width: 0,
          color: context.bgCard,
        ),
        child: Text(
          '${AppLocalizations.of(context).tryAgainButtonTitle}' + "     ",
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headline1,
        ),
        loader: (timeLeft) {
          return Text(
            '${AppLocalizations.of(context).tryAgainButtonTitle} ($timeLeft)',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey,
              fontSize: AdaptiveTextSize()
                  .getadaptiveTextSize(context, multiplier: 1.85),
              fontFamily: AppTextStyles.helveticaFontLight,
            ),
          );
        },
        onTap: (startTimer, btnState) {
          if (btnState == ButtonState.Idle) {
            provider.doTryAgain();
            startTimer(10);
          }
        },
      ),
    );
    // RaisedGradientButton(
    //   isLoading: true,
    //   btnController: provider.btnTryAgainController,
    //   disable: provider.isLoading,
    //   btnText: AppLocalizations.of(context).tryAgainButtonTitle,
    //   btnTextSize: AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
    //   onPressed: () {
    //     provider.doTryAgain();
    //   },
    // ),
    //);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
