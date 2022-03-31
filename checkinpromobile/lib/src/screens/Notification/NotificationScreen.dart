import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/DetailVisitorLog.dart';
import 'package:checkinpromobile/src/screens/DetailHistoryVisitorLog/DetailHistoryVisitorLogNotifier.dart';
import 'package:checkinpromobile/src/screens/DetailHistoryVisitorLog/DetailHistoryVisitorLogScreen.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/Notification/NotificationNotifier.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/SmartRefreshCustom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../model/Notification.dart' as notify;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/services.dart';

class NotificationScreen extends MainScreen {
  static const route_name = 'notification-screen';
  @override
  NotificationScreenState createState() => NotificationScreenState();

  @override
  String getNameScreen() {
    return "NotificationPage";
  }
}

class NotificationScreenState extends MainScreenState<NotificationNotifier>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<MainScreen> {
  bool isSwitched = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    provider.getAPINotifications(context);
    locator<Utilities>().printLog(
        "build NotificationScreen......................................");
    return Container(
        color: context.bgSliverAppBar,
        // decoration: BoxDecoration(gradient: AppColors.linearGradientAppMain),
        child: SafeArea(
          bottom: false,
          child: Scaffold(
              appBar: CustomAppBar(
                context: context,
                index: -1,
                provider: provider,
                childRight: AppImage.icDoubleCheck,
                callbackLeftChild: () {
                  provider.onClickLeft(context);
                },
              ),
              body: Selector<NotificationNotifier, bool>(
                builder: (cx, data, child) {
                  if (data) {
                    return itemLoading();
                  } else {
                    return Selector<NotificationNotifier, bool>(
                      builder: (cx, data, child) {
                        return Selector<NotificationNotifier,
                            List<notify.Notification>>(
                          builder: (widget, data, child) {
                            if (provider.isNoInternet) {
                              return _buildLayoutNoConnectInternet();
                            }
                            if (data == null || data.isEmpty) {
                              return _buildLayoutNotFound();
                            }
                            return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      locator<Utilities>().paddingTopSizeHeight,
                                ),
                                child: SmartRefresher(
                                    child: ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount:
                                            provider.lstNotifications.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            height: 0,
                                          );
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return _buildSlideItemNotification(
                                              index);
                                        }),
                                    onRefresh: _onRefresh,
                                    onLoading: () {
                                      _onLoading(context);
                                    },
                                    header: MaterialClassicHeader(
                                      distance: 40,
                                    ),
                                    footer: SmartRefreshFooter(),
                                    enablePullDown: true,
                                    enablePullUp: true,
                                    controller: _refreshController));
                          },
                          selector: (cx, provider) => provider.lstNotifications,
                        );
                      },
                      selector: (cx, provider) => provider.isDelete,
                    );
                  }
                },
                selector: (cx, provider) => provider.isLoading,
              )),
        ));
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
                appLocalizations.noResultsFoundTitle,
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

  Widget _buildLayoutNoConnectInternet() {
    return Container(
      color: AppColors.BACKGROUND_MAIN,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_wifi_off_outlined,
              size: SizeConfig.devicePixelRatio * 30.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                appLocalizations.noInternet,
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

  _onRefresh() {
    provider.resetNotificationsData();
    provider.getAPINotifications(context, callbackFn: () {
      _refreshController.refreshCompleted();
    });
  }

  _onLoading(BuildContext context) {
    provider.getAPINotifications(context, callbackFn: () {
      _refreshController.loadComplete();
    });
  }

  Widget _buildSlideItemNotification(int index) {
    var item = provider.lstNotifications[index];
    return Slidable.builder(
      key: Key('${item.identifierNotification}'),
      direction: Axis.horizontal,
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        closeOnCanceled: true,
        onDismissed: (actionType) {
          if (actionType == SlideActionType.primary) {
          } else {
            provider.deleteNotificationById(context, item);
          }
        },
        dismissThresholds: <SlideActionType, double>{
          SlideActionType.primary: 1.0
        },
      ),
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.25,
      child: _itemNotification(item),
      actionDelegate: SlideActionBuilderDelegate(
          actionCount: 1,
          builder: (context, index, animation, renderingMode) {
            return IconSlideAction(
              foregroundColor: Colors.white,
              caption: item.isRead == 0
                  ? appLocalizations.statusReadTitle
                  : appLocalizations.statusUnReadTitle,
              color: renderingMode == SlidableRenderingMode.slide
                  ? Colors.lightBlue.withOpacity(animation.value)
                  : Colors.lightBlue[400],
              icon: item.isRead == 0
                  ? Icons.mark_chat_read
                  : Icons.mark_as_unread,
              onTap: () async {
                provider.updateStatusReadById(
                    context, item, item.isRead == 1 ? 0 : 1);
              },
            );
          }),
      secondaryActionDelegate: SlideActionBuilderDelegate(
          actionCount: 1,
          builder: (context, index, animation, renderingMode) {
            return IconSlideAction(
              caption: appLocalizations.deleteTitle,
              color: renderingMode == SlidableRenderingMode.slide
                  ? Colors.red.withOpacity(animation.value)
                  : Colors.red[400],
              icon: Icons.delete_forever,
              onTap: () {
                var state = Slidable.of(context);
                state.dismiss();
              },
            );
          }),
    );
  }

  Widget _itemNotification(notify.Notification item) {
    return GestureDetector(
      onTap: () {
        provider.isLoadingNotification = true;
        // Update status is read item
        provider.updateStatusReadById(context, item, 1);
        // Move to next screen
        DetailVisitorLog detailVisitorLog = DetailVisitorLog(
            fullname: item.infoVisitor.fullName,
            emailAddress: item.infoVisitor.email,
            numberPhone: item.infoVisitor.phoneNumber,
            company: item.infoVisitor.fromCompany,
            branchName: item.infoVisitor.siteName,
            branchAddress: '',
            faceImg: item.infoVisitor.faceCaptureFile,
            signIn: item.infoVisitor.signIn);
        // Show modal sheet
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
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: context.bgCard,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[300],
                width: 1.0,
              ),
            )),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                    imageUrl: item.infoVisitor.faceCaptureFile ?? "",
                    placeholder: (cx, url) {
                      return CircularProgressIndicator();
                    },
                    errorWidget: (context, url, error) => CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/default_avatar.png'),
                      radius: 35,
                    ),
                  )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Selector<NotificationNotifier, bool>(
                        builder: (cx, sts, child) {
                          return Text(
                            item?.title ?? "",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: AppTextStyles.tahomaFont,
                                color: context.textColor
                                    .withOpacity(item.isRead == 1 ? 0.6 : 1.0),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none),
                          );
                        },
                        selector: (cx, provider) => provider.statusAllRead,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Selector<NotificationNotifier, bool>(
                        builder: (cx, sts, child) {
                          return AutoSizeText(item.data,
                              maxLines: 4,
                              minFontSize: 8,
                              maxFontSize: 14,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: AppTextStyles.tahomaFont,
                                  color: context.textColor.withOpacity(
                                      item.isRead == 1 ? 0.6 : 1.0),
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.none));
                        },
                        selector: (cx, provider) => provider.statusAllRead,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Selector<NotificationNotifier, bool>(
                        builder: (cx, sts, child) {
                          return Text(
                            item.getDate(appLocalizations),
                            style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: AppTextStyles.tahomaFont,
                                color: AppColors.MAIN_TEXT_COLOR
                                    .withOpacity(item.isRead == 1 ? 0.6 : 1.0),
                                decoration: TextDecoration.none),
                          );
                        },
                        selector: (cx, provider) => provider.statusAllRead,
                      ),
                    ]),
              ),
              Selector<NotificationNotifier, bool>(
                builder: (cx, sts, child) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: item.isRead == 0
                              ? AppImage.icCircleStatusUnRead
                              : AppImage.icCircleStatusRead,
                          color: Colors.transparent,
                          height: 50,
                          width: 10,
                        )),
                  );
                },
                selector: (cx, provider) {
                  return provider.statusAllRead;
                },
              )
            ]),
      ),
    );
  }

  Widget _buildBtnTryAgainRefresh() {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
      child: RaisedGradientButton(
        isLoading: true,
        btnController: provider.btnTryAgainController,
        disable: provider.isLoading,
        btnText: appLocalizations.tryAgainButtonTitle,
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        onPressed: () {
          provider.doTryAgain(context);
        },
      ),
    );
  }
}
