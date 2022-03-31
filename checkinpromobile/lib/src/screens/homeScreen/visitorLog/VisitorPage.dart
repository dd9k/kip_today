import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/VisitorLog.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorLogNotifier.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ItemVisitorLog.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorInvitePage.dart';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';

class VisitorPage extends MainScreen {
  @override
  VisitorPageState createState() => VisitorPageState();

  @override
  String getNameScreen() {
    return "VisitorPage";
  }
}

class VisitorPageState extends MainScreenState<VisitorLogNotifier>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<MainScreen> {
  TabController _tabController;
  bool isInit = false;

  final _tabLength = 3;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SizeConfig().init(context);
    if (!isInit) {
      isInit = true;
      _tabController = TabController(length: _tabLength, vsync: this);
      _tabController.animation.addListener(() {
        if (_tabController.offset != 0) {
          if (_tabController.index == 1 && _tabController.offset < 0) {
            provider.updateTabBar(0);
          } else {
            provider.updateTabBar(-1);
          }
        } else {
          provider.updateTabBar(_tabController.index);
        }
      });
      provider.getAPIVisitorLogIn();
      provider.getAPIVisitorLogOut();
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: DefaultTabController(
        length: _tabLength,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: context.bgSliverAppBar,
            elevation: 0,
            leading: Container(),
            flexibleSpace: Container(
              height: 60,
              child: TabBar(
                labelColor: AppColors.DARK_BLUE_TEXT,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: AppColors.DARK_BLUE_TEXT,
                    width: 2.0,
                  ),
                ),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 2),
                            child: Align(
                              child: Text(
                                AppLocalizations.of(context).inviteTabTitle,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              alignment: Alignment.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 2),
                            child: Align(
                              child: Text(
                                AppLocalizations.of(context).btnCheckIn,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              alignment: Alignment.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 2),
                            child: Align(
                              child: Text(
                                AppLocalizations.of(context).btnCheckOut,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              alignment: Alignment.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              VisitorInvitePage(),
              Selector<VisitorLogNotifier, List<VisitorLog>>(
                builder: (widget, data, child) {
                  if (provider.isLoadingIn) {
                    return Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (data != null && data.isEmpty == false) {
                    return ItemVisitorLog(
                      listVisitor: provider.logGroupIn,
                      itemLogType: ItemLogType.HISTORY,
                      pullRefreshFunc: (callbackFn) {
                        provider.resetVisitorLogIn();
                        provider.getAPIVisitorLogIn(callbackFn: () {
                          callbackFn();
                        });
                      },
                      loadingMoreFunc: (callbackFn) {
                        provider.getAPIVisitorLogIn(callbackFn: () {
                          callbackFn();
                        });
                      },
                      notYetCheckOut: true,
                    );
                  }
                  return _buildLayoutNotFound(true);
                },
                selector: (cx, provider) => provider.listVisitorLogIn,
              ),
              Selector<VisitorLogNotifier, List<VisitorLog>>(
                builder: (widget, data, child) {
                  if (provider.isLoadingOut) {
                    return Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                      //color: AppColors.BACKGROUND_MAIN,
                    );
                  }
                  if (data != null && data.isEmpty == false) {
                    return ItemVisitorLog(
                      listVisitor: provider.logGroupOut,
                      itemLogType: ItemLogType.HISTORY,
                      pullRefreshFunc: (callbackFn) {
                        provider.resetVisitorLogOut();
                        provider.getAPIVisitorLogOut(callbackFn: () {
                          callbackFn();
                        });
                      },
                      loadingMoreFunc: (callbackFn) {
                        provider.getAPIVisitorLogOut(callbackFn: () {
                          callbackFn();
                        });
                      },
                      notYetCheckOut: false,
                    );
                  }
                  return _buildLayoutNotFound(false);
                },
                selector: (cx, provider) => provider.listVisitorLogOut,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemLoading() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
      // color: AppColors.BACKGROUND_MAIN,
    );
  }

  Widget _buildLayoutNotFound(bool notYetCheckOut) {
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
                  fontFamily: AppTextStyles.helveticaFontLight,
                ),
              ),
            ),
            _buildBtnTryAgainRefresh(notYetCheckOut)
          ],
        ),
      ),
    );
  }

  Widget _buildBtnTryAgainRefresh(bool notYetCheckOut) {
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
            notYetCheckOut
                ? provider.doTryAgainIn(context)
                : provider.doTryAgainOut(context);
            startTimer(10);
          }
        },
      ),
      // RaisedGradientButton(
      //   isLoading: true,
      //   color: Colors.white,
      //   btnController: provider.btnTryAgainController,
      //   disable: notYetCheckOut ? provider.isLoadingIn : provider.isLoadingOut,
      //   btnText: AppLocalizations.of(context).tryAgainButtonTitle,
      //   btnTextSize:
      //       AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
      //   onPressed: () {
      //     notYetCheckOut
      //         ? provider.doTryAgainIn(context)
      //         : provider.doTryAgainOut(context);
      //   },
      // ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
