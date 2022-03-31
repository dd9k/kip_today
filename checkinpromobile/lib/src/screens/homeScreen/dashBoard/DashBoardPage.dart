import 'dart:core';
import 'dart:io';
import 'dart:typed_data';
import 'package:checkinpromobile/src/widgetUtilities/Loading.dart';
import 'package:intl/intl.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppDestination.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/DetailVisitorLog.dart';
import 'package:checkinpromobile/src/model/ItemEventToday.dart';
import 'package:checkinpromobile/src/model/ItemInvitation.dart';
import 'package:checkinpromobile/src/model/ItemVisitor.dart';
import 'package:checkinpromobile/src/model/EventTicket.dart';
import 'package:checkinpromobile/src/screens/DetailHistoryVisitorLog/DetailHistoryVisitorLogNotifier.dart';
import 'package:checkinpromobile/src/screens/DetailHistoryVisitorLog/DetailHistoryVisitorLogScreen.dart';
import 'package:checkinpromobile/src/screens/DetailInviteVisitorLog/DetailInviteVisitorLogNotifier.dart';
import 'package:checkinpromobile/src/screens/DetailInviteVisitorLog/DetailInviteVisitorLogScreen.dart';
import 'package:checkinpromobile/src/screens/EventDetail/EventDetailScreen.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/Chart/ChartScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/dashBoard/DashBoardNotifier.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/LabelDisplayCommon.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as Smart;
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:checkinpromobile/src/model/AttendanceInfoTodayResponse.dart';

// class Greeting {
//   String mess;
//   IconData icon;
//   String subMess;
//   Greeting(this.mess, this.icon, this.subMess);
// }

// ignore: must_be_immutable
class DashBoardPage extends MainScreen {
  @override
  DashBoardPageState createState() => DashBoardPageState();

  @override
  String getNameScreen() {
    return "DashBoardPage";
  }

  DashBoardPage();

  // ignore: non_constant_identifier_names
  DashBoardPage.Handler(Function callbackTab) {
    navigationTab = callbackTab;
  }
}

class DashBoardPageState extends MainScreenState<DashBoardNotifier>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<MainScreen> {
  int selectedBarIndex = 0;
  @override
  bool get wantKeepAlive => true;
  TabController controller;
  int tab;
  bool isInit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInit) {
      isInit = true;
      controller = TabController(length: 2, vsync: this);
      controller.animation.addListener(() {
        if (controller.offset != 0) {
          if (controller.index == 0 && controller.offset > 0) {
            provider.updateTabBar(1);
          }
          if (controller.index == 1 && controller.offset < 0) {
            provider.updateTabBar(0);
          }
        } else {
          provider.updateTabBar(controller.index);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    locator<Utilities>()
        .printLog("build Dashboard page......................................");
    provider.getAttendanceModeInPreference(context);
    return Selector<DashBoardNotifier, bool>(
      builder: (context, isLoadingEventDetail, child) {
        return Loading(
          visible: isLoadingEventDetail,
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: provider.isEventTicket
                ? Selector<DashBoardNotifier, bool>(
                    builder: (context, isExVisitor, child) {
                      return FutureBuilder<List<dynamic>>(
                        future: provider.getEventTicket(false),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return _buildEventTicket();
                        },
                      );
                    },
                    selector: (buildContext, modelProvider) => modelProvider.isReloadEvent,
                  )
                : buildNormal(context),
          ),
        );
      },
      selector: (buildContext, modelProvider) =>
          modelProvider.isLoadingEventDetail,
    );
  }

  Widget _buildEventTicket() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              controller: controller,
              isScrollable: true,
              unselectedLabelColor: context.bgSwapColor,
              labelColor: AppColors.TITLE_APPBAR_COLOR,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: AppColors.DARK_BLUE_TEXT,
                  width: 2.0,
                ),
              ),
              onTap: (value) {
                setState(() {
                  tab = value;
                });
              },
              tabs: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.41,
                  child: Tab(
                    text: appLocalizations.happenning,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.41,
                  child: Tab(
                    text: appLocalizations.eventHasEnded,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  buildTabHappening(),
                  buildTabEnded(),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Column buildTabEnded() {
    return Column(
                  children: [
                    Selector<DashBoardNotifier, bool>(
                      builder: (context, deleteMode, child) => Visibility(
                        visible: deleteMode,
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(top: 10.0, left: 2, right: 10),
                          child: Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 2.0),
                                  child: Selector<DashBoardNotifier, int>(
                                    builder: (context, data, child) {
                                      return CustomCheckBoxTitle(
                                        size: 25,
                                        selected: data == provider.listEventTicketEnd.length,
                                        title: 'Chọn tất cả',
                                        onSelected: (isSelected) {
                                          provider.selectedAllDelete(isSelected);
                                        },
                                      );
                                    },
                                    selector: (cx, provider) => provider.removeItem.length,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 2.0),
                                      child: InkWell(
                                        onTap: () {
                                          provider.updateMode();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Hủy'),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 2.0),
                                      child: InkWell(
                                        onTap: () {
                                          provider.deleteEvent();
                                        },
                                        child: Row(
                                          children: [
                                            Selector<DashBoardNotifier, int>(
                                              builder: (context, data, child) {
                                                if (provider.removeItem.length > 0) {
                                                  return Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Xóa sự kiện (${provider.removeItem.length})',
                                                      style: TextStyle(color: Colors.red),
                                                    ),
                                                  );
                                                }
                                                return Container();
                                              },
                                              selector: (cx, provider) =>
                                                  provider.removeItem.length,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      selector: (context, provider) => provider.deleteMode,
                    ),
                    Expanded(
                      flex: 1,
                      child: Selector<DashBoardNotifier, bool>(
                        builder: (context, deleteMode, child) {
                          if (provider.listEventTicketEnd.isEmpty) {
                            return buildNoEventTicket(context);
                          }
                          return GridView.builder(
                            itemCount: provider.listEventTicketEnd.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: (2 / 2.7),
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 4,
                                    crossAxisCount:
                                        getDeviceType() == 'tablet' ? 3 : 2),
                            padding: EdgeInsets.all(10.0),
                            itemBuilder: (context, index) {
                              EventTicket item =
                                  provider.listEventTicketEnd[index];
                              String fileName = (item?.eventName ?? "") +
                                  item?.id?.toString() +
                                  item?.coverRepoId?.toString();
                              return Stack(
                                children: [
                                  Selector<DashBoardNotifier, bool>(
                                    builder: (context, deleteMode, child) =>
                                        Opacity(
                                      opacity: (deleteMode) ? 0.8 : 1.0,
                                      child: InkWell(
                                        onLongPress: () {
                                          provider.updateMode();
                                          if (provider.deleteMode) {
                                            provider.selectedDeleteEnd(
                                                provider.listEventTicketEnd[
                                                    index]);
                                            provider.reloadUISelected();
                                          }
                                        },
                                        onTap: () {
                                          if (provider.deleteMode) {
                                            provider.selectedDeleteEnd(
                                                provider.listEventTicketEnd[
                                                    index]);
                                            provider.reloadUISelected();
                                          } else {
                                            provider.getEventTicketOrder(
                                              item.id,
                                              () => AppRouter
                                                  .pushToWithArguments(
                                                context,
                                                EventDetailScreen.route_name,
                                                arguments: {
                                                  "eventTicket": item,
                                                  'eventId': item.id.toInt(),
                                                  'coverImageEvent': provider
                                                      .savedImage[fileName],
                                                  'listOrderInfo':
                                                      provider.listOrderInfo,
                                                  'listOrderInfoPaid': provider
                                                          ?.listOrderInfoPaid ??
                                                      List(),
                                                  'eventDetail':
                                                      provider.eventDetail,
                                                  'isEventTicket':
                                                      provider.isEventTicket
                                                },
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: context.bgCard,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3)),
                                          ),
                                          width: 300,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                height: 150,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                  child: FutureBuilder<
                                                      Uint8List>(
                                                    future: provider
                                                        .getSavedNetworkImage(
                                                            item.coverPathFile,
                                                            fileName),
                                                    builder: (_, s) {
                                                      if (!provider.savedImage
                                                          .containsKey(
                                                              fileName)) {
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      }
                                                      if (provider.savedImage[
                                                              fileName] ==
                                                          null) {
                                                        return buildNoImageEvent();
                                                      }
                                                      try {
                                                        return Image.memory(
                                                          s.data,
                                                          fit: BoxFit.cover,
                                                        );
                                                      } catch (_) {
                                                        return buildNoImageEvent();
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        left: 5,
                                                        right: 5),
                                                child: Text(
                                                  item.eventName ?? "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        bottom: 3),
                                                child: Text(
                                                  formatDate(item.startDate,
                                                          'd/M/y HH:mm') +
                                                      '\n' +
                                                      '-' +
                                                      '\n' +
                                                      formatDate(item.endDate,
                                                          'd/M/y HH:mm'),
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5
                                                      .copyWith(fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                          margin: EdgeInsets.all(5.0),
                                        ),
                                      ),
                                    ),
                                    selector: (context, provider) =>
                                        provider.deleteMode,
                                  ),
                                  Selector<DashBoardNotifier, bool>(
                                    builder: (context, deleteMode, child) =>
                                        Visibility(
                                      visible: deleteMode,
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, right: 20),
                                          child: Selector<DashBoardNotifier,
                                              bool>(
                                            builder: (context, deleteMode,
                                                    child) =>
                                                CustomCheckBox(
                                              size: 25,
                                              item: provider
                                                  .listEventTicketEnd[index],
                                              onSelected: (selected) {
                                                provider.selectedDeleteEnd(
                                                    provider.listEventTicketEnd[
                                                        index]);
                                                provider.reloadUISelected();
                                              },
                                            ),
                                            selector: (context, provider) =>
                                                provider.reloadSelected,
                                          ),
                                        ),
                                      ),
                                    ),
                                    selector: (context, provider) =>
                                        provider.deleteMode,
                                  )
                                ],
                              );
                            },
                          );
                        },
                        selector: (context, provider) =>
                            provider.isReloadEventEnd,
                      ),
                    ),
                  ],
                );
  }

  Smart.SmartRefresher buildTabHappening() {
    return Smart.SmartRefresher(
                  onRefresh: () async {
                    provider.onRefreshEventTicket();
                  },
                  controller: provider.refreshController,
                  child: (provider.listEventTicket == null || provider.listEventTicket.isEmpty)
                      ? buildNoEventTicket(context)
                      : GridView.builder(
                          itemCount: provider.listEventTicket.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: (2 / 2.7),
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                              crossAxisCount: getDeviceType() == 'tablet' ? 3 : 2),
                          padding: EdgeInsets.all(10.0),
                          itemBuilder: (context, index) {
                            EventTicket item = provider.listEventTicket[index];
                            String fileName =
                                (item?.eventName ?? "") + item?.id?.toString() + item?.coverRepoId?.toString();
                            return InkWell(
                              onTap: () {
                                provider.getEventTicketOrder(
                                  item.id,
                                  () => AppRouter.pushToWithArguments(
                                    context,
                                    EventDetailScreen.route_name,
                                    arguments: {
                                      "eventTicket": item,
                                      'eventId': item.id.toInt(),
                                      'coverImageEvent': provider.savedImage[fileName],
                                      'listOrderInfo': provider.listOrderInfo,
                                      'listOrderInfoPaid': provider?.listOrderInfoPaid ?? List(),
                                      'eventDetail': provider.eventDetail,
                                      'isEventTicket': provider.isEventTicket
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.bgCard,
                                  borderRadius: BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(3)),
                                        child: FutureBuilder<Uint8List>(
                                          future: provider.getSavedNetworkImage(item.coverPathFile, fileName),
                                          builder: (_, s) {
                                            if (!provider.savedImage.containsKey(fileName)) {
                                              return Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            }
                                            if (provider.savedImage[fileName] == null) {
                                              return buildNoImageEvent();
                                            }
                                            try {
                                              return Image.memory(
                                                s.data,
                                                fit: BoxFit.cover,
                                              );
                                            } catch (_) {
                                              return buildNoImageEvent();
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                                      child: Text(
                                        item.eventName ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      (item?.isOnline == 1)
                                          ? appLocalizations.eventOnline
                                          : appLocalizations.eventOffline,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 12),
                                    ),
                                    Text(
                                      formatDate(item.startDate, Constants.FORMAT_STRING_DATE),
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                                margin: EdgeInsets.all(5.0),
                              ),
                            );
                          },
                        ),
                );
  }

  Container buildNoEventTicket(BuildContext context) {
    return Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/pic_no_data_found.png',
                                      cacheWidth: (857 ~/ 4) *
                                          SizeConfig.devicePixelRatio,
                                      cacheHeight: (781 ~/ 4) *
                                          SizeConfig.devicePixelRatio,
                                      fit: BoxFit.contain,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 30),
                                      child: Text(
                                        appLocalizations.noEvent,
                                        style: TextStyle(
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context,
                                                  multiplier: 1.85),
                                          fontFamily:
                                              AppTextStyles.tahomaFont,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
  }

  String formatDate(String str, String format) {
    DateTime date = DateTime.parse(str);
    return DateFormat(format).format(date);
  }

  Column buildNormal(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: RefreshIndicator(
              onRefresh: () => Future<void>(() {
                    provider.reLoadData(context);
                    provider.reloadChart();
                  }),
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Visibility(
                      child: buildTimeToday(context),
                      visible: provider.isAttendanceMode),
                  Visibility(
                      child: buildCheckinTodayWithImage(context),
                      visible: provider.isAttendanceMode),
                  Visibility(
                    visible: provider.isAttendanceMode,
                    child: buildWorkingTime(context),
                  ),
                  Visibility(
                    visible: provider.isAttendanceMode,
                    child: buildIsLateisNoOut(context),
                  ),
                  Visibility(
                    child: InkWell(
                      onTap: () {
                        launch('https://checkinpro.vn');
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 10,
                            left: AppDestination.PADDING_MAIN_HORIZONTAL,
                            right: AppDestination.PADDING_MAIN_HORIZONTAL,
                            bottom: 20),
                        child: Image.asset('assets/images/banner-qc.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                    visible: false,
                  ),
                  Visibility(
                    visible: provider.isAttendanceMode == false
                        ? true
                        : (provider.localIndex == 0 ||
                                provider.localIndex == null)
                            ? false
                            : true,
                    child: widgetExVisitor(context),
                  ),
                  Visibility(
                    visible: provider.isAttendanceMode == false
                        ? true
                        : (provider.localIndex == 0 ||
                                provider.localIndex == null)
                            ? false
                            : true,
                    child: widgetEventToday(context),
                  ),
                  Visibility(
                    visible: provider.isAttendanceMode == false
                        ? true
                        : (provider.localIndex == 0 ||
                                provider.localIndex == null)
                            ? false
                            : true,
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: AppDestination.PADDING_MAIN_HORIZONTAL,
                              right: AppDestination.PADDING_MAIN_HORIZONTAL),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                appLocalizations.myVisitorTitle,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Selector<DashBoardNotifier, List<ItemVisitor>>(
                                  builder: (_, data, __) {
                                    return Visibility(
                                      visible: data.length > 0,
                                      child: GestureDetector(
                                        onTap: () => {
                                          widget.navigationTab(),
                                        },
                                        child: Text(
                                          appLocalizations.viewMoreTitle,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              .copyWith(
                                                fontStyle: FontStyle.italic,
                                                color: AppColors.DARK_BLUE_TEXT,
                                              ),
                                        ),
                                      ),
                                    );
                                  },
                                  selector: (_, provider) =>
                                      provider.listMyVisitor)
                            ],
                          )),
                    ),
                  ),
                  Visibility(
                    visible: provider.isAttendanceMode == false
                        ? true
                        : (provider.localIndex == 0 ||
                                provider.localIndex == null)
                            ? false
                            : true,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Selector<DashBoardNotifier, bool>(
                            builder: (_, data, __) {
                              if (data) {
                                return loading(context, data);
                              }
                              return Selector<DashBoardNotifier,
                                  List<ItemVisitor>>(
                                builder: (context, data, child) {
                                  if (data.length > 0) {
                                    return buildMyVisitor(context, data);
                                  } else {
                                    return buildNonEvent(
                                        appLocalizations.nonVisitor, context);
                                  }
                                },
                                selector: (buildContext, modelProvider) =>
                                    modelProvider.listMyVisitor,
                              );
                            },
                            selector: (_, provider) =>
                                provider.isLoadingMyVisitor)),
                  ),
                  Visibility(
                    visible: provider.isAttendanceMode == false
                        ? false
                        : (provider.localIndex == 0 ||
                                provider.localIndex == null)
                            ? true
                            : false,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20,
                          top: 20,
                          left: AppDestination.PADDING_MAIN_HORIZONTAL),
                      child: Text(
                        appLocalizations.workingHoursOfMonth,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: provider.isAttendanceMode == false
                        ? false
                        : (provider.localIndex == 0 ||
                                provider.localIndex == null)
                            ? true
                            : false,
                    child: Selector<DashBoardNotifier, bool>(
                      builder: (context, isLoadingChart, child) {
                        return Chart(provider.memCacheChart);
                      },
                      selector: (cx, provider) => provider.isLoadingChart,
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }

  Widget buildTimeToday(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: MediaQuery.of(context).size.width / 31.25,
        right: MediaQuery.of(context).size.width / 31.25,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              appLocalizations.todayTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Color(0xff0080f3)),
            ),
          ),
          Text(
            provider.utilities.convertDateToStringDate(
                DateTime.now().toString(), context, provider.parent.preferences,
                isToday: false, isWithoutTime: true),
            style: Theme.of(context).textTheme.headline3.copyWith(
                  color: AppColors.TEXT_COLOR_DARK,
                ),
          ),
        ],
      ),
    );
  }

  Widget widgetEventToday(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      child: Selector<DashBoardNotifier, bool>(
        builder: (context, isExVisitor, child) {
          return FutureBuilder<List<dynamic>>(
            future: provider.getDataEventTodayInDbLocal(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return loading(context, true);
              }
              if (snapshot.hasData && snapshot.data?.isNotEmpty == true) {
                if (provider.eventToday.length > 0) {
                  return buildEvents(context);
                } else {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: AppDestination.PADDING_MAIN_HORIZONTAL,
                              right: AppDestination.PADDING_MAIN_HORIZONTAL),
                          child: Text(appLocalizations.eventsTitle,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline3),
                        ),
                        buildNonEvent(appLocalizations.nonEvent, context)
                      ]);
                }
              }
              return Container();
            },
          );
        },
        selector: (buildContext, modelProvider) => modelProvider.isReloadEvent,
      ),
    );
  }

  Widget widgetExVisitor(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      child: Selector<DashBoardNotifier, List<ItemInvitation>>(
        builder: (context, data, child) {
          return Selector<DashBoardNotifier, bool>(
            builder: (context, isExVisitor, child) {
              if (isExVisitor) {
                return loading(context, isExVisitor);
              }
              if (data.length > 0) {
                return buildVisitor(context, data);
              } else {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppDestination.PADDING_MAIN_HORIZONTAL,
                            right: AppDestination.PADDING_MAIN_HORIZONTAL),
                        child: Text(
                          appLocalizations.visitorExpectedTodayTitle,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      buildNonEvent(appLocalizations.nonVisitor, context)
                    ]);
              }
            },
            selector: (buildContext, modelProvider) =>
                modelProvider.isLoadingExToday,
          );
        },
        selector: (buildContext, modelProvider) => modelProvider.listInvitation,
      ),
    );
  }

  Widget buildCheckinTodayWithImage(BuildContext context) {
    return Selector<DashBoardNotifier, bool>(
      builder: (cx, data1, child) {
        return FutureBuilder(
          future: provider.getTodayAttendanceInfo(context),
          builder: (ctx, snapshot) {
            if (provider.isReloadAttendance) {
              return loading(context, true);
            } else {
              return Selector<DashBoardNotifier, bool>(
                builder: (cx, data, child) {
                  String checkedInTime =
                      "${provider.checkedInTime}".toUpperCase();
                  String checkedOutTime =
                      '${provider.checkedOutTime}'.toUpperCase();
                  if (provider.checkedInTime.isEmpty) {
                    checkedInTime = appLocalizations.noCheckedinYet;
                    checkedOutTime = '';
                  }
                  return Selector<DashBoardNotifier, String>(
                    builder: (context, data, child) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          left: MediaQuery.of(context).size.width / 31.25,
                          right: MediaQuery.of(context).size.width / 31.25,
                          bottom: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Material(
                              color: context.bgSliverAppBar,
                              elevation: 0,
                              shadowColor: AppColors.LINE_COLOR,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: provider.checkedOutTime.isNotEmpty ||
                                      (provider.data?.today?.length ?? 0) > 1
                                  ? Row(
                                      children: [
                                        WidgetCheckIn(
                                          checkin: appLocalizations.checkIn,
                                          timecheckin: checkedInTime,
                                          countCheckin: checkedInTime,
                                          isLate: appLocalizations.isLate,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1 /
                                              75,
                                        ),
                                        WidgetCheckOut(
                                          checkout: appLocalizations.checkOut,
                                          timecheckout: checkedOutTime == ''
                                              ? '-:-'
                                              : checkedOutTime,
                                          countCheckout: checkedOutTime,
                                        ),
                                      ],
                                    )
                                  : Container(
                                      height: 122,
                                      decoration: BoxDecoration(
                                        color: context.bgCard,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (provider.checkedInTime
                                                        ?.isNotEmpty ==
                                                    true)
                                                  Row(
                                                    children: [
                                                      Text(
                                                        appLocalizations
                                                            .checkIn,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3
                                                            .copyWith(
                                                              color: Color(
                                                                  0xFF03be50),
                                                            ),
                                                      ),
                                                      Selector<
                                                          DashBoardNotifier,
                                                          AttendanceInfoTodayResponse>(
                                                        builder: (context, data,
                                                            child) {
                                                          if (data?.isLate ==
                                                              true)
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                right: 5,
                                                                left: 5,
                                                              ),
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2),
                                                                  border: Border
                                                                      .all(
                                                                    color:
                                                                        Color(
                                                                      0xfff7b500,
                                                                    ),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 2.0,
                                                                      bottom: 2,
                                                                      left: 3,
                                                                      right: 3),
                                                                  child: Text(
                                                                    appLocalizations
                                                                        .isLate,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .headline3
                                                                        .copyWith(
                                                                          fontSize:
                                                                              8,
                                                                          color:
                                                                              AppColors.CHECKOUT_BUTTON_BG_COLOR,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          else
                                                            return SizedBox();
                                                        },
                                                        selector:
                                                            (cx, provider) =>
                                                                provider.data,
                                                      )
                                                    ],
                                                  ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 10,
                                                  ),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: checkedInTime !=
                                                                  appLocalizations
                                                                      .noCheckedinYet
                                                              ? ''
                                                              : checkedInTime,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline3
                                                                  .copyWith(
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                    fontSize:
                                                                        35,
                                                                  ),
                                                        ),
                                                        TextSpan(
                                                          text: checkedInTime !=
                                                                  appLocalizations
                                                                      .noCheckedinYet
                                                              ? checkedInTime
                                                              : '',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline3
                                                                  .copyWith(
                                                                    foreground: Paint()
                                                                      ..shader =
                                                                          linearGradientCheckin,
                                                                    fontSize:
                                                                        35,
                                                                  ),
                                                        ),
                                                        TextSpan(
                                                          text: checkedOutTime
                                                                  .isEmpty
                                                              ? ''
                                                              : ' - ',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1
                                                                  .copyWith(
                                                                    foreground: Paint()
                                                                      ..shader =
                                                                          linearGradientCheckout,
                                                                    fontSize:
                                                                        35,
                                                                  ),
                                                        ),
                                                        TextSpan(
                                                          text: checkedOutTime,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1
                                                                  .copyWith(
                                                                    foreground: Paint()
                                                                      ..shader =
                                                                          linearGradientCheckout,
                                                                    fontSize:
                                                                        35,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      );
                    },
                    selector: (cx, provider) => provider.checkedInTime,
                  );
                },
                selector: (cx, provider) => provider.isUpdateAttendance,
              );
            }
          },
        );
      },
      selector: (cx, provider) => provider.isReloadAttendance,
    );
  }

  Widget buildIsLateisNoOut(BuildContext context) {
    return Selector<DashBoardNotifier, bool>(
      builder: (_, data, __) {
        if (data) {
          return loading(context, data);
        } else {
          return Material(
            color: context.bgSliverAppBar,
            elevation: 0,
            shadowColor: AppColors.LINE_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: buildItemIsLateandisNoOut(),
          );
        }
      },
      selector: (_, provider) => provider.isLoadingWorkingTimeTotal,
    );
  }

  Widget buildWorkingTime(BuildContext context) {
    return Selector<DashBoardNotifier, bool>(
      builder: (_, data, __) {
        if (data) {
          return loading(context, data);
        } else {
          return Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: AppDestination.PADDING_MAIN_HORIZONTAL,
              right: AppDestination.PADDING_MAIN_HORIZONTAL,
              bottom: 5,
            ),
            child: Selector<DashBoardNotifier, bool>(
              builder: (context, data, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      appLocalizations.workingTime,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Material(
                      color: context.bgCard,
                      elevation: 0,
                      shadowColor: AppColors.LINE_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        child: Selector<DashBoardNotifier, double>(
                          builder: (cx, data, child) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      appLocalizations.thisWeek,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(color: Color(0xff0080f3)),
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: '${provider.totalWorkingWeek}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(
                                            fontSize: 35,
                                            color: AppColors
                                                .CHECKOUT_BUTTON_BG_COLOR,
                                          ),
                                    ),
                                    TextSpan(text: '  '),
                                    TextSpan(
                                      text: appLocalizations.timeTitleWeek,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                              color: AppColors.TEXT_COLOR_DARK),
                                    ),
                                  ])),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: context.bgSliverAppBar,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      Utilities.capitalize(Utilities()
                                          .translateMonth(
                                              DateTime.now(), context)),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(color: Color(0xff0080f3)),
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: '${provider.totalWorkingMonth}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(
                                            fontSize: 35,
                                            foreground: Paint()
                                              ..shader =
                                                  linearGradientWorkingtimeweek,
                                          ),
                                    ),
                                    TextSpan(
                                      text: '/',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(
                                            fontSize: 35,
                                            color: AppColors.TEXT_COLOR_DARK,
                                          ),
                                    ),
                                    TextSpan(
                                      text: '${provider.expected}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(
                                            fontSize: 35,
                                            foreground: Paint()
                                              ..shader =
                                                  linearGradientWorkingtimemonth,
                                          ),
                                    ),
                                    TextSpan(text: '  '),
                                    TextSpan(
                                      text: appLocalizations.timeTitleWeek,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                              color: AppColors.TEXT_COLOR_DARK),
                                    ),
                                  ]))
                                ]);
                          },
                          selector: (cx, provider) => provider.totalWorkingWeek,
                        ),
                      ),
                    ),
                  ],
                );
              },
              selector: (_, provider) => provider.updateTime,
            ),
          );
        }
      },
      selector: (_, provider) => provider.isLoadingWorkingTimeTotal,
    );
  }

  Widget buildItemIsLateandisNoOut() {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDestination.PADDING_MAIN_HORIZONTAL,
        right: AppDestination.PADDING_MAIN_HORIZONTAL,
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.bgCard,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        height: 44,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              appLocalizations.isLate,
              style:
                  Theme.of(context).textTheme.headline3.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${provider.totalLateDayInMonth}',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: 21,
                          color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              appLocalizations.isNoOut,
              style:
                  Theme.of(context).textTheme.headline3.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${provider.totalNotCheckoutDayInMonth}',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: 21,
                          color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget totalWorkingTime() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 122,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: context.bgCard,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  appLocalizations.totalTimeTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Color(0xff0080f3)),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${provider.utilities.roundStringDouble(provider.totalWorkingMonth)}',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: 40,
                            foreground: Paint()
                              ..shader = linearGradientWorkingtimemonth,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    TextSpan(
                      text: '/',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    TextSpan(
                      text: '${provider.expected}',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: 40,
                            foreground: Paint()
                              ..shader = linearGradientWorkingtimeweek,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    TextSpan(
                      text: appLocalizations.hoursTitle,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildEvents(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              left: AppDestination.PADDING_MAIN_HORIZONTAL,
              right: AppDestination.PADDING_MAIN_HORIZONTAL),
          child: Text(
            appLocalizations.eventsTitle,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            provider.isEventTicket
                ? _buildIsHaveEvent(provider.listEventTicket)
                : _buildEvents(provider.eventToday)
          ],
        ),
      ],
    );
  }

  Widget _buildEvents(List<ItemEventToday> itemList) {
    return CarouselSlider(
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height / 4,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          aspectRatio: 16 / 9,
          initialPage: 0,
          autoPlayCurve: Curves.easeInBack),
      items: itemList
          .map(
            (item) {
              String fileName = (item?.eventName ?? "") +
                  item?.id?.toString() +
                  item?.coverRepoId?.toString();
              return InkWell(
              onTap: () {
                AppRouter.pushToWithArguments(
                    context, EventDetailScreen.route_name,
                    arguments: {
                      'eventId': item.id.toInt(),
                      'coverImageEvent': provider.savedImage[fileName],
                      'isEventTicket': provider.isEventTicket
                    });
              },
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: FutureBuilder<Uint8List>(
                          future: provider.getSavedNetworkImage(
                              item.coverPathFile,
                              item.eventName +
                                  item.id.toString() +
                                  item.coverRepoId.toString()),
                          builder: (_, s) {
                            if (!s.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (s.data == null) {
                              return buildNoImageEvent();
                            }
                            try {
                              return Image.memory(
                                s.data,
                                fit: BoxFit.cover,
                              );
                            } catch (_) {
                              return buildNoImageEvent();
                            }
                          },
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: BlurryContainer(
                        width: double.maxFinite,
                        blur: 2,
                        padding: EdgeInsets.zero,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        bgColor: context.bgColorEvent,
                        height: MediaQuery.of(context).size.height / 9,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: LabelDisplayCommon(
                                    maxLines: 1,
                                    body: item.eventName ?? "",
                                    prefixIcon: Icons.ac_unit_outlined,
                                    isPaddingRight: false,
                                  )),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0, right: 0),
                                  child: LabelDisplayCommon(
                                    maxLines: 1,
                                    body: item.contactPersonName ?? " ",
                                    prefixIcon: Icons.person,
                                    isPaddingRight: false,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 0,
                                      right: 0,
                                    ),
                                    child: LabelDisplayCommon(
                                      maxLines: 1,
                                      body: item.siteAddress ?? " ",
                                      prefixIcon: Icons.location_on_outlined,
                                      isPaddingRight: false,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );}
          )
          .toList(),
    );
  }

  Container buildNoImageEvent() {
    return Container(
      decoration: BoxDecoration(
        color: context.bgCard,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(5)),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(
              top: (MediaQuery.of(context).size.height / 8) - 50),
          child: Text(
            appLocalizations.coverImageContent,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }

  Widget _buildIsHaveEvent(List<EventTicket> itemList) {
    return CarouselSlider(
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height / 4,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          aspectRatio: 16 / 9,
          initialPage: 0,
          autoPlayCurve: Curves.easeInBack),
      items: itemList.map(
        (item) {
          String fileName = (item?.eventName ?? "") +
              item?.id?.toString() +
              item?.coverRepoId?.toString();
          return InkWell(
            onTap: () {
              provider.getEventTicketOrder(
                  item.id,
                  () => AppRouter.pushToWithArguments(
                        context,
                        EventDetailScreen.route_name,
                        arguments: {
                          "eventTicket": item,
                          'eventId': item.id.toInt(),
                          'coverImageEvent': provider.savedImage[fileName],
                          'listOrderInfo': provider.listOrderInfo,
                          'listOrderInfoPaid':
                              provider?.listOrderInfoPaid ?? List(),
                          'eventDetail': provider.eventDetail,
                          'isEventTicket': provider.isEventTicket
                        },
                      ));
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: FutureBuilder<Uint8List>(
                        future: provider.getSavedNetworkImage(
                            item.coverPathFile, fileName),
                        builder: (_, s) {
                          if (!provider.savedImage.containsKey(fileName)) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (provider.savedImage[fileName] == null) {
                            return buildNoImageEvent();
                          }
                          try {
                            return Image.memory(
                              s.data,
                              fit: BoxFit.cover,
                            );
                          } catch (_) {
                            return buildNoImageEvent();
                          }
                        },
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BlurryContainer(
                      width: double.maxFinite,
                      blur: 2,
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      bgColor: context.bgColorEvent,
                      height: MediaQuery.of(context).size.height / 9,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                flex: 1,
                                child: LabelDisplayCommon(
                                  maxLines: 1,
                                  body: item.eventName ?? "",
                                  prefixIcon: Icons.ac_unit_outlined,
                                  isPaddingRight: false,
                                )),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 0, right: 0),
                                child: LabelDisplayCommon(
                                  maxLines: 1,
                                  body: item.siteName ?? "",
                                  prefixIcon: Icons.location_city_outlined,
                                  isPaddingRight: false,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 0,
                                    right: 0,
                                  ),
                                  child: LabelDisplayCommon(
                                    maxLines: 1,
                                    body: item.siteAddress ?? " ",
                                    prefixIcon: Icons.location_on_outlined,
                                    isPaddingRight: false,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  IconData _getIconVisitorType(String visitorType) {
    switch (visitorType) {
      case 'APARTMENT':
        return Icons.home_work_outlined;
        break;
      case 'VISITOR':
        return Icons.assignment_ind_outlined;
        break;
      case 'INTERVIEW':
        return Icons.contacts_outlined;
        break;
      case 'INTERVIEW':
        return Icons.delivery_dining;
        break;
      default:
        return Icons.assignment_ind_outlined;
    }
  }

  Widget buildVisitor(BuildContext context, List<ItemInvitation> itemList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              left: AppDestination.PADDING_MAIN_HORIZONTAL,
              right: AppDestination.PADDING_MAIN_HORIZONTAL),
          child: Text(
            appLocalizations.visitorExpectedTodayTitle,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height / 8,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 10, right: 10),
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 20,
                );
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: itemList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  DetailVisitorLog detailVisitorLog = DetailVisitorLog(
                    fullname: itemList[index].visitorName,
                    emailAddress: itemList[index].visitorEmail,
                    numberPhone: itemList[index].visitorPhoneNumber,
                    company: itemList[index].visitorCompany,
                    branchName: itemList[index].branchName,
                    branchAddress: "",
                    inviteCode: itemList[index].inviteCode,
                    startDate: itemList[index].startDate,
                  );
                  // Show bottom sheet
                  showModalBottomSheet<void>(
                      builder: (_) {
                        return ChangeNotifierProvider(
                          create: (_) => DetailInviteVisitorLogNotifier(),
                          child: DetailInviteVisitorLogScreen(
                            detailVisitorLog: detailVisitorLog,
                            visitorTypeName: provider
                                        .listInvitationVisitorTypeName
                                        .isNotEmpty ==
                                    true
                                ? provider.listInvitationVisitorTypeName[index]
                                : null,
                            eInviteDetailVisitorLog:
                                E_INVITE_DETAIL_VISITOR_LOG.DASHBOARD,
                          ),
                        );
                      },
                      context: context,
                      isScrollControlled: true);
                },
                child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Stack(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height / 3,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7.0),
                                ),
                                color: context.bgCard,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        itemList[index].getStartJustTime(
                                            context, provider.langSaved),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width: 2,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              5.0,
                                            ), //         <--- border radius here
                                          ),
                                          color: AppColors.DARK_BLUE_TEXT,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                itemList[index]
                                                    .visitorName
                                                    .trim(),
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5
                                                    .copyWith(fontSize: 16),
                                              ),
                                            ),
                                            if (itemList[index]
                                                        .visitorTypeValue !=
                                                    null &&
                                                itemList[index]
                                                    .visitorTypeValue
                                                    .isNotEmpty)
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      _getIconVisitorType(
                                                          itemList[index]
                                                              .visitorType),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      child: AutoSizeText(
                                                        itemList[index]
                                                                .getVisitorTypeValue(
                                                              provider
                                                                  .langSaved,
                                                            ) ??
                                                            "",
                                                        //maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            )),
                      ],
                    )),
              ),
            )),
      ],
    );
  }

  String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  Widget buildMyVisitor(BuildContext context, List<ItemVisitor> itemList) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getDeviceType() == 'tablet' ? 3 : 2),
        shrinkWrap: true,
        itemCount: itemList.length,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                DetailVisitorLog detailVisitorLog = DetailVisitorLog(
                    fullname: itemList[index].fullName,
                    emailAddress: itemList[index].email,
                    numberPhone: itemList[index].phoneNumber,
                    company: itemList[index].fromCompany,
                    branchName: itemList[index].brachName,
                    branchAddress: '',
                    faceImg: itemList[index].nameImgLocal ??
                        itemList[index].faceCaptureFile,
                    signIn: itemList[index].signIn,
                    signOut: itemList[index].signOut,
                    feedback: itemList[index].feedback,
                    rating: itemList[index].rating);
                showModalBottomSheet<void>(
                    builder: (_) {
                      return ChangeNotifierProvider(
                        create: (_) => DetailHistoryVisitorLogNotifier(),
                        child: DetailHistoryVisitorLogScreen(
                            detailVisitorLog: detailVisitorLog),
                      );
                    },
                    context: context,
                    isScrollControlled: true);
              },
              child: Container(
                width: MediaQuery.of(context).size.height / 4.5,
                height: MediaQuery.of(context).size.height / 4.5,
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: FutureBuilder<File>(
                            future: Utilities().getLocalFile(
                                Constants.FOLDER_TEMP_VISITOR_LOG,
                                itemList[index].nameImgLocal,
                                null),
                            builder: (cx, snapshot) {
                              if (snapshot.hasData) {
                                return Image.memory(
                                  snapshot.data.readAsBytesSync(),
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.height / 4.5,
                                  height:
                                      MediaQuery.of(context).size.height / 4.5,
                                  errorBuilder: (cx, _, __) {
                                    return CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: Image.asset(
                                        'assets/images/default_avatar.png',
                                        width:
                                            MediaQuery.of(context).size.height /
                                                4.5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4.5,
                                        fit: BoxFit.cover,
                                      ),
                                      radius:
                                          MediaQuery.of(context).size.height /
                                              4.5,
                                    );
                                  },
                                );
                              } else {
                                if (itemList[index].faceCaptureFile == null ||
                                    itemList[index].faceCaptureFile.isEmpty) {
                                  return CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Image.asset(
                                      'assets/images/default_avatar.png',
                                      width:
                                          MediaQuery.of(context).size.height /
                                              4.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4.5,
                                      fit: BoxFit.cover,
                                    ),
                                    radius: MediaQuery.of(context).size.height /
                                        4.5,
                                  );
                                }
                                return CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.height /
                                        4.5,
                                    height: MediaQuery.of(context).size.height /
                                        4.5,
                                    imageUrl:
                                        itemList[index].faceCaptureFile ?? "",
                                    placeholder: (cx, url) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    });
                              }
                            },
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: BlurryContainer(
                        blur: 2,
                        padding: EdgeInsets.zero,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        bgColor: Colors.black,
                        width: MediaQuery.of(context).size.height / 4.5,
                        height: MediaQuery.of(context).size.height / 12,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  itemList[index].fullName,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        fontSize: 15,
                                        color: AppColors.BG_COLOR_LIGHT,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: itemList[index].phoneNumber == null
                                    ? Container()
                                    : Text(
                                        itemList[index].phoneNumber,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                              color: AppColors.BG_COLOR_LIGHT,
                                            ),
                                      ),
                              ),
                              Expanded(
                                child: RatingBar.builder(
                                  onRatingUpdate: (value) {},
                                  unratedColor: Colors.white38,
                                  itemSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context,
                                          multiplier: 1.85),
                                  initialRating: itemList[index].rating == null
                                      ? 0.0
                                      : itemList[index].rating.toDouble(),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star_border,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget buildNonEvent(String mes, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppDestination.PADDING_MAIN_HORIZONTAL,
          right: AppDestination.PADDING_MAIN_HORIZONTAL),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: context.bgCard,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        mes,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      width: 100,
                      height: 100,
                      child: FlareActor(
                        'assets/images/non_event.flr',
                        animation: "Idle",
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loading(BuildContext context, bool isLoad) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: isLoad,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 50.0,
                                height: 50.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 40.0,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String convertStringToTime(String date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  DateTime dateTimeIn = DateTime.parse(date);
  String timeInHour = DateFormat('HH:mm').format(dateTimeIn);
  return timeInHour;
}

class TimeCheckInCheckOut extends StatelessWidget {
  final String timecheckin;
  final String timecheckout;

  TimeCheckInCheckOut({this.timecheckin, this.timecheckout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Expanded(
        child: Text(
          timecheckin,
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: Color(0xffbababa), fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WidgetCheckIn extends StatefulWidget {
  String checkin;
  String timecheckin;
  String countCheckin;
  String isLate;

  WidgetCheckIn(
      {this.checkin, this.timecheckin, this.countCheckin, this.isLate});

  @override
  _WidgetCheckInState createState() => _WidgetCheckInState();
}

class _WidgetCheckInState extends State<WidgetCheckIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 130,
      width: MediaQuery.of(context).size.width * 0.46,
      decoration: BoxDecoration(
        color: context.bgCard,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 8),
        child: Selector<DashBoardNotifier, List<AttendanceInfoToday>>(
          builder: (context, data, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      widget.checkin,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Color(0xFF03be50),
                          ),
                    ),
                    Selector<DashBoardNotifier, AttendanceInfoTodayResponse>(
                      builder: (context, data, child) {
                        if (data?.isLate == true)
                          return Padding(
                            padding: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                    width: 0.5,
                                    color: Color(
                                      0xfff7b500,
                                    ),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 2.0, bottom: 2, left: 3, right: 3),
                                child: Text(
                                  widget.isLate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                        fontSize: 8,
                                        color:
                                            AppColors.CHECKOUT_BUTTON_BG_COLOR,
                                      ),
                                ),
                              ),
                            ),
                          );
                        else
                          return SizedBox();
                      },
                      selector: (cx, provider) => provider.data,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    widget.timecheckin,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          foreground: Paint()..shader = linearGradientCheckin,
                        ),
                  ),
                ),
                data.length > 1
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Container(
                          height: 35,
                          child: ListView.builder(
                            itemCount: data.length - 1,
                            itemBuilder: (context, index) {
                              return Text(
                                convertStringToTime(data[index + 1].timeIn) ==
                                        null
                                    ? '-'
                                    : convertStringToTime(
                                        data[index + 1].timeIn),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(
                                      color: AppColors.TEXT_COLOR_DARK,
                                      fontStyle: FontStyle.italic,
                                    ),
                                textAlign: TextAlign.start,
                              );
                            },
                          ),
                        ),
                      )
                    : SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, right: 5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                )
              ],
            );
          },
          selector: (cx, provider) => provider.totalCheckinCheckout,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WidgetCheckOut extends StatefulWidget {
  String checkout;
  String timecheckout;
  String countCheckout;

  WidgetCheckOut({this.checkout, this.timecheckout, this.countCheckout});

  @override
  _WidgetCheckOutState createState() => _WidgetCheckOutState();
}

class _WidgetCheckOutState extends State<WidgetCheckOut> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.46,
      decoration: BoxDecoration(
        color: context.bgCard,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Selector<DashBoardNotifier, List<AttendanceInfoToday>>(
        builder: (context, data, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: Text(
                    widget.checkout,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Color(0xffca974f)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 6.0,
                    right: 15,
                  ),
                  child: Text(
                    widget.timecheckout,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          foreground: Paint()..shader = linearGradientCheckout,
                        ),
                  ),
                ),
                if (data.length > 1)
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Container(
                      height: 35,
                      child: ListView.builder(
                        itemCount: data.length - 1,
                        itemBuilder: (context, index) {
                          return Text(
                            convertStringToTime(data[index + 1].timeOut) == null
                                ? '-'
                                : convertStringToTime(data[index + 1].timeOut),
                            style:
                                Theme.of(context).textTheme.headline3.copyWith(
                                      color: AppColors.TEXT_COLOR_DARK,
                                      fontStyle: FontStyle.italic,
                                    ),
                            textAlign: TextAlign.end,
                          );
                        },
                      ),
                    ),
                  ),
                Selector<DashBoardNotifier, String>(
                  builder: (context, data, child) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4, right: 15),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          data,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.DARK_BLUE_TEXT,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                  selector: (cx, provider) => provider.utilities
                      .formatHourToTime(
                          provider.appLocalizations, provider.totalWorkingDay),
                )
              ],
            ),
          );
        },
        selector: (cx, provider) => provider.totalCheckinCheckout,
      ),
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  double size;
  EventTicket item;
  Function(bool) onSelected;

  CustomCheckBox({
    this.size = 30,
    this.item,
    this.onSelected,
  });
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: widget.size, maxWidth: widget.size),
      child: RawMaterialButton(
        shape: CircleBorder(),
        child: SizedBox(
          height: widget.size,
          width: widget.size,
          child: CustomPaint(
            painter: CirclePainter(context.bgTemp),
            child: widget.item.isSelect
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                              360.0) //         <--- border radius here
                          ),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      size: widget.size,
                    ),
                  )
                : SizedBox(),
          ),
        ),
        onPressed: () {
          setState(() {
            widget.onSelected(widget.item.isSelect);
          });
        },
      ),
    );
  }
}

class CustomCheckBoxTitle extends StatefulWidget {
  double size;
  bool selected;
  String title;
  Function(bool) onSelected;

  CustomCheckBoxTitle({
    this.size = 30,
    this.selected,
    this.title,
    this.onSelected,
  });
  @override
  _CustomCheckBoxTitleState createState() => _CustomCheckBoxTitleState();
}

class _CustomCheckBoxTitleState extends State<CustomCheckBoxTitle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
        widget.onSelected(widget.selected);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ConstrainedBox(
              constraints:
              BoxConstraints(maxHeight: widget.size, maxWidth: widget.size),
              child: RawMaterialButton(
                shape: CircleBorder(),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CustomPaint(
                    painter: CirclePainter(context.bgTemp),
                    child: widget.selected
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(360.0) //         <--- border radius here
                                  ),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.check_circle,
                              size: 20,
                            ),
                          )
                        : SizedBox(),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    widget.selected = !widget.selected;
                  });
                  widget.onSelected(widget.selected);
                },
              ),
            ),
            SizedBox(width: 10,),
            Text(widget.title),
          ],
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Color color;

  CirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..color = color
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

final Shader linearGradientCheckin = LinearGradient(
  colors: <Color>[Color(0xFF0e8e35), Color(0xFF00ca57)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 0.0));

final Shader linearGradientCheckout = LinearGradient(
  colors: <Color>[Color(0xFF9b7300), Color(0xffb0b189)],
).createShader(Rect.fromLTWH(200.0, 0.0, 200.0, 0.0));

final Shader linearGradientWorkingtimeweek = LinearGradient(
  colors: <Color>[Color(0xff4c69c5), Color(0xff60adfa)],
).createShader(Rect.fromLTWH(200.0, 0.0, 200.0, 0.0));

final Shader linearGradientWorkingtimemonth = LinearGradient(
  colors: <Color>[Color(0xff06b39b), Color(0xff39dabc)],
).createShader(Rect.fromLTWH(200.0, 0.0, 200.0, 0.0));
