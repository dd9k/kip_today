import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppDestination.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';
import 'package:checkinpromobile/src/model/ETPaymentType.dart';
import 'package:checkinpromobile/src/model/EventDetailInfo.dart';
import 'package:checkinpromobile/src/model/EventGuest.dart';
import 'package:checkinpromobile/src/model/EventTicketDetail.dart';
import 'package:checkinpromobile/src/model/FormatQRCode.dart';
import 'package:checkinpromobile/src/screens/EventDetail/EventDetailNotifier.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/print/PrinterPage.dart';
import 'package:checkinpromobile/src/screens/scanQR/ScanQRScreen.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/services/printService/PrinterModel.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/LabelDisplayCommon.dart';
import 'package:checkinpromobile/src/widgetUtilities/Loading.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/SmartRefreshCustom.dart';
import 'package:checkinpromobile/src/widgetUtilities/TemplatePrint.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:checkinpromobile/src/model/EventTicket.dart';
import 'package:checkinpromobile/src/model/ETOrderInfo.dart';
import 'package:checkinpromobile/src/model/ETOrderDetailInfo.dart';
import 'package:intl/intl.dart';
import 'package:checkinpromobile/src/screens/CreateGuest/CreateGuestScreen.dart';
import 'package:checkinpromobile/src/widgetUtilities/QRCode.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';

// ignore: must_be_immutable
class EventDetailScreen extends MainScreen {
  static const String route_name = '/eventDetailScreen';
  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _EventDetailScreenState extends MainScreenState<EventDetailNotifier>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<MainScreen> {
  TabController _tabController;
  RefreshController _refreshController = RefreshController();

  final List<String> _tabItem = List();

  final eventNameController = TextEditingController();
  final contactPersonController = TextEditingController();
  final branchNameController = TextEditingController();
  final visitorTypeController = TextEditingController();
  final siteNameController = TextEditingController();
  final siteAddressController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final descriptionController = TextEditingController();
  final searchGuestController = TextEditingController();

  GlobalKey<FormState> searchKey = GlobalKey();

  String searchTextGuest = '';
  FocusNode _textSearchFocusNode = FocusNode();

  final _controller = ScrollController();

  double get maxHeight => 200 + MediaQuery.of(context).padding.top;

  double get minHeight => kToolbarHeight + MediaQuery.of(context).padding.top;

  bool isEmpty = true;

  @override
  bool get wantKeepAlive => true;

  bool isFirstInit = true;

  bool _isOpaqueLayoutSearch = false;
  bool _isVisibleLayoutSearch = false;

  bool _enablePullDown = true;
  bool _enablePullUp = true;

  Function(bool) isTicket;
  EventTicket eventTicket;
  Uint8List coverImageEvent;
  int eventId;
  @override
  void initState() {
    // TODO: implement initState
    _getEmployeeId();
    super.initState();
  }

  void _getEmployeeId() async {
    final preferences = await SharedPreferences.getInstance();
    var authentication =
        preferences.getString(Constants.KEY_EMPLOYEE_DATA) ?? "";
    provider.employeeId =
        Authenticate.fromJson(jsonDecode(authentication)).employeeInfo.id;
  }

  void _initTabController() {
    // Init tab
    _tabItem.clear();
    _tabItem.add(appLocalizations.eventDetailTitle);
    _tabItem.add(provider.isEventTicket
        ? appLocalizations.ticketOrder
        : appLocalizations.eventGuestsTitle);
    if (provider.isEventTicket) {
      _tabItem.add(provider.appLocalizations.orderPaidBy);
    }
    _tabController = TabController(length: _tabItem.length, vsync: this);

    _tabController.animation.addListener(() {
      if (_tabController.offset != 0) {
        if (_tabController.index == 1 && _tabController.offset < 0) {
          provider.updateTabBar(-1);
        }
        if (_tabController.index == 0 && _tabController.offset > 0) {
          provider.updateTabBar(1);
        }
      } else {
        provider.updateTabBar(_tabController.index);
      }
    });

    _tabController.addListener(() {
      setState(() {
        print(_tabController.index);
        if (_tabController.index == 0) {
          _enablePullDown = false;
          _enablePullUp = false;
        } else {
          _enablePullDown = true;
          _enablePullUp = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    locator<Utilities>()
        .printLog('Build EventDetailScreen....................');
    provider.initData();
    if (provider.arguments != null) {
      eventTicket = provider.arguments["eventTicket"] as EventTicket;
      eventId = provider.arguments["eventId"] as int;
      coverImageEvent = provider.arguments["coverImageEvent"] as Uint8List;
      provider.startDateEventTicket = provider.utilities
          .convertDateToStringDate(
              eventTicket?.startDate, context, provider.parent.preferences,
              isToday: false);
      provider.endDateEventTicket = provider.utilities.convertDateToStringDate(
          eventTicket?.endDate, context, provider.parent.preferences,
          isToday: false);
    }
    if (isFirstInit) {
      locator<Utilities>()
          .printLog('Build isFirstInit EventDetailScreen....................');
      isFirstInit = false;
      _initTabController();
      // Call API get event detail information
      provider.getEventDetailInfo(context, eventId);
      // Clear guests
      provider.resetEventGuestsData();
      // Call API get event guests
      provider.getEventGuests(context, eventId);
    } else {
      // If scanQR scan checkin for guest event
      if (locator<Utilities>().lstEventGuestCheckedScan != null &&
          locator<Utilities>().lstEventGuestCheckedScan.isNotEmpty) {
        // Update all guest had been checkin status
        provider.updateCheckInForGuestByScanQR(
            locator<Utilities>().lstEventGuestCheckedScan);
      }
    }
    return Stack(children: <Widget>[
      Selector<EventDetailNotifier, PrinterModel>(
        builder: (cx, data, child) {
          return Scaffold(
              backgroundColor: Colors.transparent,
              body: RepaintBoundary(
                key: provider.repaintBoundary,
                child: Container(
                  height: AppDestination.CARD_HEIGHT,
                  width: AppDestination.CARD_WIGHT,
                  color: Colors.white,
                  child: new Center(
                      child: _cardTemplate(
                          provider?.model?.badgeTemplateId ?? "1")),
                ),
              ));
        },
        selector: (cx, provider) => provider.printModel,
      ),
      provider.isEventTicket
          ? Selector<EventDetailNotifier, bool>(
              builder: (cx, data, child) {
                return Loading(visible: data, child: _buildLayoutMain(eventId));
              },
              selector: (cx, provider) => provider.isLoadingCheckIn,
            )
          : Selector<EventDetailNotifier, bool>(
              builder: (cx, data, child) {
                return Loading(visible: data, child: _buildLayoutMain(eventId));
              },
              selector: (cx, provider) => provider.isLoading,
            ),
      Selector<EventDetailNotifier, bool>(
          builder: (__, data, _) {
            if (data) {
              return Container(
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: _buildProgressDownloadPopupLayout());
            } else {
              return Container();
            }
          },
          selector: (cx, provider) => provider.isDownloadingLocal),
    ]);
  }

  Widget _buildProgressDownloadPopupLayout() {
    return Container(
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        margin: EdgeInsets.only(left: 10, right: 10),
        padding: EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Selector<EventDetailNotifier, double>(
              builder: (_, data, __) {
                return LinearProgressIndicator(
                  value: data,
                );
              },
              selector: (_, provider) => provider.percentDownloading,
            ),
            SizedBox(height: 30),
            Selector<EventDetailNotifier, String>(
              builder: (_, data, __) {
                return Text(data,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: AppColors.MAIN_TEXT_COLOR,
                        fontWeight: FontWeight.normal,
                        fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context),
                        fontFamily: AppTextStyles.tahomaFont));
              },
              selector: (_, provider) => provider.downloadStatusTitle,
            )
          ],
        ));
  }

  Widget _cardTemplate(String badgeIndex) {
    return Selector<EventDetailNotifier, EventGuest>(
      builder: (context, data, child) => TemplatePrint(
        visitorName: provider.guestPrinter?.visitorName ?? "",
        phoneNumber: provider.guestPrinter?.visitorPhoneNumber ?? "",
        fromCompany: provider.guestPrinter?.fromCompany ?? "",
        visitorType: provider.guestPrinter?.visitorType ?? "",
        indexTemplate: badgeIndex,
        printerModel: provider.printModel,
        inviteCode: provider.guestPrinter?.inviteCode ?? "",
      ),
      selector: (buildContext, provider) => provider.guestPrinter,
    );
  }

  List<Widget> _buildActionSilverAppBarHeader() {
    final width =
        AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 5);
    final height =
        AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 10);
    final paddingTop = MediaQuery.of(context).padding.top > 0 ? 30.0 : 0.0;
    return [
      Selector<EventDetailNotifier, bool>(
        builder: (context, isSearchOpen, child) => Visibility(
          child: Container(
            padding: EdgeInsets.only(top: paddingTop, left: 10),
            width: width,
            height: height,
            // padding: EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () => AppRouter.pop(context),
              child: AppImage.backBtnWhite,
            ),
          ),
          visible: !isSearchOpen,
        ),
        selector: (buildContext, provider) => provider.isSearchOpen,
      ),
      Spacer(),
      if (!provider.isEventTicket)
        Selector<EventDetailNotifier, bool>(
          builder: (context, isSearchOpen, child) => Visibility(
            child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.only(top: paddingTop),
              child: IconButton(
                onPressed: () {
                  provider.getEventGuestAllOnline(context, provider.model.id);
                },
                icon: Icon(
                  Icons.save_alt_outlined,
                  color: Colors.white,
                  size: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 3),
                ),
              ),
            ),
            visible: !isSearchOpen,
          ),
          selector: (buildContext, provider) => provider.isSearchOpen,
        ),
      if (provider.isEventTicket)
        Selector<EventDetailNotifier, int>(
          builder: (context, index, child) => Visibility(
            visible: (index != 0 && index != -1),
            child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.only(top: paddingTop),
              child: IconButton(
                icon: Icon(
                  Icons.sync,
                  color: Colors.white,
                  size: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 3),
                ),
                onPressed: () {
                  _refreshController.requestRefresh();
                  _onRefresh(null);
                },
              ),
            ),
          ),
          selector: (buildContext, provider) => provider.selectedBarIndex,
        ),
      Selector<EventDetailNotifier, bool>(
        builder: (context, isSearchOpen, child) => Visibility(
          child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.only(top: paddingTop),
            child: IconButton(
              onPressed: () {
                // Init list
                if (!provider.isEventTicket) {
                  locator<Utilities>().lstEventGuestCheckedScan = List();
                  AppRouter.pushToWithArguments(
                      context, ScanQRScreen.route_name,
                      arguments: {
                        'badgeTemplateId': provider.model.badgeTemplateId,
                        'isPrint': provider.model.isPrint,
                        'eventId': provider.model.id,
                        'branchId': provider.model.branchId * 1.0,
                        'employeeId': provider.employeeId
                      });
                } else {
                  AppRouter.pushToWithArguments(
                      context, ScanQRScreen.route_name,
                      arguments: {
                        'eventTicketId': eventTicket.id,
                        'isEventTicket': true,
                        'eventDetail': provider.eventDetail
                      }).then((value) {
                    provider.getOrderFromData(eventTicket.id, null);
                  });
                }
              },
              icon: Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: AdaptiveTextSize()
                    .getadaptiveTextSize(context, multiplier: 3),
              ),
            ),
          ),
          visible: !isSearchOpen,
        ),
        selector: (buildContext, provider) => provider.isSearchOpen,
      ),
      if (provider.isEventTicket && provider.bookingLink?.isNotEmpty == true)
        Container(
          width: width,
          height: height,
          padding: EdgeInsets.only(top: paddingTop),
          child: IconButton(
            icon: Icon(
              Icons.qr_code,
              color: Colors.white,
              size: AdaptiveTextSize()
                  .getadaptiveTextSize(context, multiplier: 3),
            ),
            onPressed: () async {
              await showDialog(
                context: context,
                child: _buildQRCode(
                    provider.bookingLink, appLocalizations.scanQrBooking),
              );
            },
          ),
        ),
      if (!provider.isEventTicket)
        Selector<EventDetailNotifier, bool>(
          builder: (context, isSearchOpen, child) => Visibility(
            child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.only(top: paddingTop),
              child: IconButton(
                icon: Icon(
                  Icons.local_printshop_outlined,
                  color: Colors.white,
                  size: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 3),
                ),
                onPressed: () {
                  AppRouter.pushTo(context, PrinterPage.route_name);
                },
              ),
            ),
            visible: !isSearchOpen,
          ),
          selector: (buildContext, provider) => provider.isSearchOpen,
        ),
      if (provider.isEventTicket)
        Container(
          width: width,
          height: height,
          padding: EdgeInsets.only(top: paddingTop),
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: AdaptiveTextSize()
                  .getadaptiveTextSize(context, multiplier: 3),
            ),
            onPressed: () {
              if ((provider.eventDetail?.ticketInfo?.remainingTicketQuantity ??
                      -1) <=
                  0) {
                Utilities().showErrorPop(
                    context,
                    appLocalizations.noTicketError,
                    Constants.AUTO_HIDE_LESS,
                    () {},
                    callbackDismiss: () {});
              } else {
                AppRouter.pushToWithArguments(
                        context, CreateGuestScreen.route_name,
                        arguments: {
                          'eventDetail': provider.eventDetail,
                        },
                        transitionType: TransitionType.inFromBottom,
                        transitionDuration: Duration(milliseconds: 500))
                    .then((value) {
//                  if (isReload == true) {
                  provider.getOrderFromData(eventTicket.id, null);
//                  }
                });
              }
            },
          ),
        ),
      Selector<EventDetailNotifier, int>(
        builder: (context, index, child) => Visibility(
          visible: (index != 0 && index != -1),
          child: Selector<EventDetailNotifier, bool>(
            builder: (context, isSearchOpen, child) => Container(
              width: width,
              height: height,
              padding: EdgeInsets.only(top: paddingTop),
              child: IconButton(
                icon: Icon(
                  isSearchOpen
                      ? Icons.search_off_outlined
                      : Icons.search_outlined,
                  color: Colors.white,
                  size: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 3),
                ),
                onPressed: () {
                  if (!provider.isEventTicket) {
                    provider.openOrCloseSearch();
                    if (provider.isSearchOpen) {
                      Future.delayed(Duration(milliseconds: 400), () {
                        FocusScope.of(context)
                            .requestFocus(_textSearchFocusNode);
                      });
                    } else {
                      _textSearchFocusNode.unfocus();
                      searchGuestController.text = '';
                      setState(() {
                        _isOpaqueLayoutSearch = false;
                      });
                    }
                  } else {
                    provider.openOrCloseSearch();
                    if (provider.isSearchOpen) {
                      Future.delayed(Duration(milliseconds: 400), () {
                        FocusScope.of(context)
                            .requestFocus(_textSearchFocusNode);
                      });
                    } else {
                      _textSearchFocusNode.unfocus();
                      searchGuestController.text = '';
                      provider.getOrderFromData(eventTicket.id, null);
                    }
                  }
                },
              ),
            ),
            selector: (buildContext, provider) => provider.isSearchOpen,
          ),
        ),
        selector: (buildContext, provider) => provider.selectedBarIndex,
      ),
    ];
  }

  Widget _buildQRCode(String image, String title) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          height: 250,
          child: QRCode(sizeQRCode: 250, data: image),
        ),
      ),
    );
  }

  Widget _buildLayoutMain(int id) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: Stack(
            children: [
              DefaultTabController(
                length: _tabItem.length,
                child: NestedScrollView(
                  controller: _controller,
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
//                        backgroundColor: context.bgSliverAppBar,
                        toolbarHeight: AdaptiveTextSize()
                                .getadaptiveTextSize(context, multiplier: 10) -
                            MediaQuery.of(context).padding.top,
                        expandedHeight:
                            maxHeight - MediaQuery.of(context).padding.top,
                        pinned: true,
                        automaticallyImplyLeading: false,
                        elevation: 0,
                        flexibleSpace: (coverImageEvent == null)
                            ? buildErrorCover(context)
                            : Container(
                                height: maxHeight,
                                child: Image.memory(coverImageEvent,
                                    fit: BoxFit.cover,
                                    errorBuilder: (cx, _, __) {
                                  return buildErrorCover(context);
                                }),
                              ),
                      ),
                      SliverPersistentHeader(
                        delegate: _SliverAppBarDelegate(
                          TabBar(
                            unselectedLabelColor: context.bgSwapColor,
                            labelColor: AppColors.TITLE_APPBAR_COLOR,
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                color: AppColors.DARK_BLUE_TEXT,
                                width: 2.0,
                              ),
                            ),
                            tabs: _tabItem.map((item) {
                              IconData icon = Icons.album_outlined;
                              if (item ==
                                  provider.appLocalizations.ticketOrder) {
                                icon = Icons.format_list_numbered;
                              } else if (item ==
                                  provider.appLocalizations.eventGuestsTitle) {
                                icon = Icons.account_circle_outlined;
                              } else if (item ==
                                  provider.appLocalizations.orderPaidBy) {
                                icon = Icons.assignment_turned_in;
                              }
                              return Tab(
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(icon),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Align(
                                        child: Text(item,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily:
                                                    AppTextStyles.tahomaFont,
                                                fontSize: AdaptiveTextSize()
                                                    .getadaptiveTextSize(context,
                                                        multiplier: 1.85))),
                                        alignment: Alignment.center,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                            controller: _tabController,
                          ),
                        ),
                        pinned: true,
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      _buildTabOne(),
                      Selector<EventDetailNotifier, bool>(
                        builder: (_, data, __) {
                          if (data) {
                            return Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(),
                              ),
                              color: AppColors.BACKGROUND_MAIN,
                            );
                          } else {
                            if (provider.isNoInternet) {
                              return _buildLayoutNoConnectInternet();
                            } else {
                              return SmartRefresher(
                                onRefresh: () {
                                  _onRefresh(id);
                                },
                                onLoading: () {
                                  _onLoading(id);
                                },
                                // header: MaterialClassicHeader(
                                //   distance: 40,
                                // ),
                                footer: SmartRefreshFooter(),
                                enablePullDown: _enablePullDown,
                                enablePullUp: _enablePullUp,
                                controller: _refreshController,
                                child: provider.isEventTicket
                                    ? _buildTabTwoEventTicket()
                                    : _buildTabTwo(id),
                              );
                            }
                          }
                        },
                        selector: (_, provider) => provider.isLoadingGuest,
                      ),
                      if (provider.isEventTicket) _buildTabThreeEventTicket()
                    ],
                  ),
                ),
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: _buildActionSilverAppBarHeader()),
                  color: Colors.black.withOpacity(0.5)),
              Selector<EventDetailNotifier, bool>(
                builder: (context, isSearchOpen, child) => AnimatedClipRect(
                    open: isSearchOpen,
                    horizontalAnimation: true,
                    verticalAnimation: false,
                    alignment: Alignment.topLeft,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    reverseCurve: Curves.easeIn,
                    child: _buildTextFieldSearch(id)),
                selector: (buildContext, provider) => provider.isSearchOpen,
              ),
              if (!provider.isEventTicket)
                Selector<EventDetailNotifier, bool>(
                  builder: (context, isSearchOpen, child) => Visibility(
                    visible: isSearchOpen,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: AdaptiveTextSize()
                              .getadaptiveTextSize(context, multiplier: 10)),
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  selector: (buildContext, provider) => provider.isSearchOpen,
                ),
              AnimatedOpacity(
                onEnd: () {
                  if (!_isOpaqueLayoutSearch)
                    setState(() {
                      _isVisibleLayoutSearch = false;
                    });
                },
                child: Visibility(
                  child: _buildSearchSectionLayout(id),
                  visible: _isVisibleLayoutSearch,
                ),
                duration: Duration(milliseconds: 200),
                opacity: _isOpaqueLayoutSearch ? 1.0 : 0.0,
              )
            ],
          ),
        ));
  }

  Container buildErrorCover(BuildContext context) {
    return Container(
      color: context.bgCard,
      child: Padding(
        padding:
            EdgeInsets.only(top: locator<Utilities>().paddingTopSizeHeight),
        child: Center(
          child: Text(
            AppLocalizations.of(context).coverImageContent,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontSize: 18, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }

  Widget _buildTabOne() {
    return Selector<EventDetailNotifier, EventDetailInfo>(
      builder: (cx, data, child) {
        return Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: _buildDetailInfoEvent(),
        );
      },
      selector: (cx, provider) => provider.model,
    );
  }

  Widget _buildDetailInfoEvent() {
    return Wrap(
      spacing: 20,
      direction: Axis.vertical,
      children: <Widget>[
        _buildLabelInfoEvents(
          provider.isEventTicket
              ? eventTicket?.eventName ?? ""
              : provider.model.eventName,
          Icons.ac_unit_outlined,
          fontWeight: FontWeight.bold,
        ),
        _buildLabelInfoEvents(
          provider.isEventTicket
              ? eventTicket?.organizersName ?? ""
              : provider.model.contactPersonName,
          Icons.person,
        ),
        if (!provider.isEventTicket)
          _buildLabelInfoEvents(
            provider.isEventTicket
                ? eventTicket?.siteName ?? ""
                : provider.model.branchName,
            Icons.location_city_outlined,
          ),
        if (!provider.isEventTicket)
          _buildLabelInfoEvents(
              provider.visitorTypeName, Icons.assignment_ind_rounded),
        _buildLabelInfoEvents(
            provider.isEventTicket
                ? eventTicket?.siteName ?? ""
                : provider.model.siteName,
            Icons.apartment_outlined),
        _buildLabelInfoEvents(
          provider.isEventTicket
              ? eventTicket?.siteAddress ?? ""
              : provider.model.siteAddress,
          Icons.location_on_outlined,
        ),
        _buildLabelInfoEvents(
          provider.isEventTicket
              ? provider?.startDateEventTicket ?? ""
              : provider.startDateEvent,
          Icons.login,
        ),
        _buildLabelInfoEvents(
          provider.isEventTicket
              ? provider?.endDateEventTicket ?? ""
              : provider.endDateEvent,
          Icons.logout,
        ),
        _buildLabelInfoEvents(
            provider.isEventTicket
                ? eventTicket?.description ?? ""
                : provider.model.description,
            Icons.event_outlined),
      ],
    );
  }

  Widget _buildLabelInfoEvents(String value, IconData icon,
      {int maxLines = 2, FontWeight fontWeight}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        right: 0,
      ),
      child: LabelDisplayCommon(
        maxLines: maxLines,
        fontWeight: fontWeight,
        body: value ?? " ",
        prefixIcon: icon,
      ),
    );
  }

  Widget _buildSearchSectionLayout(int id) {
    return Padding(
        padding: EdgeInsets.only(
          top: AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 10),
        ),
        child: Container(
            color: Colors.white,
            child: Selector<EventDetailNotifier, bool>(
              builder: (context, data, child) {
                if (data == null) {
                  return Container();
                }
                if (data) {
                  return itemLoadingForSearchGuests();
                } else {
                  return Selector<EventDetailNotifier, List<EventGuest>>(
                      builder: (widget, data, child) {
                        if (data.isEmpty || data == null) {
                          return Container(
                            color: AppColors.BACKGROUND_MAIN,
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
                                      AppLocalizations.of(context)
                                          .noResultsFoundTitle,
                                      style: TextStyle(
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context,
                                                multiplier: 1.85),
                                        fontFamily: AppTextStyles.tahomaFont,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return SmartRefresher(
                            onLoading: () {
                              _onLoadingSearch(id);
                            },
                            header: MaterialClassicHeader(
                              distance: 40,
                            ),
                            footer: SmartRefreshFooter(),
                            enablePullDown: false,
                            enablePullUp: true,
                            controller: _refreshController,
                            child: ListView.separated(
                                physics: AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: provider.lstSearchGuest.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 0,
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return _itemEventGuest(
                                      provider.lstSearchGuest[index], index);
                                }),
                          );
                        }
                      },
                      selector: (cx, provider) => provider.lstSearchGuest);
                }
              },
              selector: (context, provider) => provider.isLoadingSearchGuest,
            )));
  }

  Widget itemLoadingForSearchGuests() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
      color: AppColors.BACKGROUND_MAIN,
    );
  }

  Widget _buildTabTwo(int idEvent) {
    return Selector<EventDetailNotifier, List<EventGuest>>(
        builder: (widget, data, child) {
          return ListView.separated(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: provider.lstGuest.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 0,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return _itemEventGuest(provider.lstGuest[index], index);
              });
        },
        selector: (cx, provider) => provider.lstGuest);
  }

  Widget _itemEventGuest(EventGuest item, int index) {
    return Container(
      padding: EdgeInsets.only(
          top: index > 0 ? 20 : 10, left: 15, right: 15, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
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
            Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      item.visitorName,
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, multiplier: 2.0),
                          fontFamily: AppTextStyles.tahomaFont,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.markunread_outlined),
                        Expanded(
                          flex: 9,
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, top: 1.5),
                            child: AutoSizeText(
                                (item.visitorEmail == null ||
                                        item.visitorEmail.isEmpty == true)
                                    ? appLocalizations.noneContent
                                    : item.visitorEmail,
                                maxLines: 3,
                                minFontSize: 8,
                                maxFontSize: 16,
                                style: TextStyle(
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context,
                                            multiplier: 1.85),
                                    fontFamily: AppTextStyles.tahomaFont,
                                    color: (item.visitorEmail == null ||
                                            item.visitorEmail.isEmpty == true)
                                        ? Colors.grey
                                        : Colors.black,
                                    fontStyle: (item.visitorEmail == null ||
                                            item.visitorEmail.isEmpty == true)
                                        ? FontStyle.italic
                                        : FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none)),
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 1.5),
                          child: Text(
                            (item.visitorPhoneNumber == null ||
                                    item.visitorPhoneNumber.isEmpty == true)
                                ? appLocalizations.noneContent
                                : item.visitorPhoneNumber,
                            style: TextStyle(
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context,
                                        multiplier: 1.85),
                                fontFamily: AppTextStyles.tahomaFont,
                                color: (item.visitorPhoneNumber == null ||
                                        item.visitorPhoneNumber.isEmpty == true)
                                    ? Colors.grey
                                    : Colors.black,
                                fontStyle: (item.visitorPhoneNumber == null ||
                                        item.visitorPhoneNumber.isEmpty == true)
                                    ? FontStyle.italic
                                    : FontStyle.normal,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
            Selector<EventDetailNotifier, bool>(
              builder: (cx, data, child) {
                return Expanded(
                    flex: 0,
                    child: Column(children: [
                      Padding(
                        child: _buildBtnCheckinEvent(item, index),
                        padding: EdgeInsets.only(top: 20, left: 0),
                      ),
                      if (item.checkinStatus == 1)
                        Selector<EventDetailNotifier, bool>(
                          builder: (cx, data, child) {
                            return AbsorbPointer(
                              absorbing: data,
                              child: GestureDetector(
                                onTap: () {
                                  provider.doPrinter(context, item);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: !data
                                            ? Colors.blue[400].withOpacity(0.5)
                                            : Colors.grey[850].withOpacity(0.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    padding: EdgeInsets.only(
                                        right: 12,
                                        top: 12,
                                        bottom: 12,
                                        left: 12),
                                    child: Icon(Icons.local_print_shop_rounded,
                                        size: 16)),
                              ),
                            );
                          },
                          selector: (cx, provider) => provider.isWaitingPrinter,
                        )
                    ]));
              },
              selector: (cx, provider) => provider.statusCheckin,
            ),
          ]),
    );
  }

  Widget _buildTabTwoEventTicket() {
    return Selector<EventDetailNotifier, bool>(
      builder: (cx, data, child) {
        if (provider.listOrderInfo?.isEmpty != false) {
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
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      AppLocalizations.of(context).noResultsFoundTitle,
                      style: TextStyle(
                        fontSize: AdaptiveTextSize()
                            .getadaptiveTextSize(context, multiplier: 1.85),
                        fontFamily: AppTextStyles.tahomaFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: provider.listOrderInfo.length,
            itemBuilder: (BuildContext context, int index) {
              var etOrderInfo = provider.listOrderInfo[index];
              return GestureDetector(
                onTap: () async {
                  showModalBottomSheet<void>(
                    builder: (_) {
                      return TicketOrderDetail(etOrderInfo, paymentType: provider.eventDetail.paymentTypes, langSaved: provider.langSaved, onPaid: (reload) {
                        provider.paidForOrder(etOrderInfo,
                            callBackDone: reload);
                      }, onCheckInAll: (reload) {
                        provider.checkInEventOrder(
                            etOrderInfo,
                            etOrderInfo?.orderDetails,
                            eventId.toDouble(),
                            false,
                            callBackDone: reload);
                      }, onCheckIn: (etOrderDetailInfo, reload) {
                        provider.checkInEventTicket(etOrderInfo,
                            etOrderDetailInfo, eventTicket.id, false,
                            callBackDone: reload);
                      });
                    },
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                  );
                },
                child:
                    _buildItemTicketEvent(provider.listOrderInfo[index], false),
              );
            });
      },
      selector: (cx, provider) => provider.reloadListOrder,
    );
  }

  Widget _buildTabThreeEventTicket() {
    double sum = 0;
    if (provider.listOrderInfoPaid?.isNotEmpty == true) {
      for (int index = 0; index < provider.listOrderInfoPaid.length; index++) {
        sum += provider.listOrderInfoPaid[index].totalAmount;
      }
    }

    return Selector<EventDetailNotifier, bool>(
      builder: (cx, data, child) {
        if (provider.listOrderInfoPaid?.isEmpty != false) {
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
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      AppLocalizations.of(context).noResultsFoundTitle,
                      style: TextStyle(
                        fontSize: AdaptiveTextSize()
                            .getadaptiveTextSize(context, multiplier: 1.85),
                        fontFamily: AppTextStyles.tahomaFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: provider.listOrderInfoPaid.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: appLocalizations.ticketTotalReceived,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              fontSize: 20,
                              color: context.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '${Constants.formatCurrency.format(sum)}',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              fontSize: 21,
                              color: context.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }
              var etOrderInfo = provider.listOrderInfoPaid[index - 1];
              return GestureDetector(
                onTap: () async {
                  showModalBottomSheet<void>(
                    builder: (_) {
                      return TicketOrderDetail(etOrderInfo, paymentType: provider.eventDetail.paymentTypes, langSaved: provider.langSaved, onPaid: (reload) {
                        provider.paidForOrder(etOrderInfo,
                            callBackDone: reload);
                      }, onCheckInAll: (reload) {
                        provider.checkInEventOrder(etOrderInfo,
                            etOrderInfo?.orderDetails, eventId.toDouble(), true,
                            callBackDone: reload);
                      }, onCheckIn: (etOrderDetailInfo, reload) {
                        provider.checkInEventTicket(etOrderInfo,
                            etOrderDetailInfo, eventTicket.id, true,
                            callBackDone: reload);
                      });
                    },
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                  );
                },
                child: _buildItemTicketEvent(
                    provider.listOrderInfoPaid[index - 1], true),
              );
            });
      },
      selector: (cx, provider) => provider.reloadListOrder,
    );
  }

  Widget _buildItemTicketEvent(ETOrderInfo orderInfor, bool isPaidList) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: context.bgCard,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (orderInfor?.guestName?.isNotEmpty == true)
                      Text(
                        "#" + orderInfor?.orderNo ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 15, color: Color(0xFF545454)),
                      ),
                    if (orderInfor?.guestName?.isNotEmpty == true)
                      Text(
                        orderInfor?.guestName ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    if (orderInfor?.guestName?.isNotEmpty == true)
                      SizedBox(
                        height: 2,
                      ),
                    if (orderInfor?.guestEmail?.isNotEmpty == true)
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: AppColors.DARK_BLUE_TEXT,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Flexible(
                            child: Text(
                              orderInfor?.guestEmail ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ],
                      ),
                    if (orderInfor?.guestEmail?.isNotEmpty == true)
                      SizedBox(
                        height: 2,
                      ),
                    if (orderInfor?.guestPhone?.isNotEmpty == true)
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: AppColors.DARK_BLUE_TEXT,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            orderInfor?.guestPhone ?? "",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    if (orderInfor?.guestPhone?.isNotEmpty == true)
                      SizedBox(
                        height: 2,
                      ),
                    Row(
                      children: [
                        Icon(
                          Icons.add_shopping_cart_rounded,
                          color: AppColors.DARK_BLUE_TEXT,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          orderInfor?.getQuantityString() ?? "",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          AppLocalizations.of(context).ticket,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_sharp,
                          color: AppColors.DARK_BLUE_TEXT,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Flexible(
                          child: Text(
                            orderInfor?.getAmountString() ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (!orderInfor.isUsed())
              Container(
                width: 100,
                padding: const EdgeInsets.only(right: 10),
                child: RaisedButton(
                  color: Colors.transparent,
                  elevation: 0,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    if (orderInfor.isPaid()) {
                      provider.checkInEventOrder(
                          orderInfor,
                          orderInfor?.orderDetails,
                          eventId.toDouble(),
                          isPaidList);
                    } else {
                      provider.paidForOrder(orderInfor);
                    }
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: orderInfor.isPaid()
                          ? AppColors.CHECKIN_BUTTON_BG_COLOR
                          : Colors.blue,
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 2,
                        bottom: 2,
                        right: 2,
                      ),
                      child: Text(
                        orderInfor.isPaid()
                            ? appLocalizations.checkIn
                            : appLocalizations.payOrder,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ),
            if (orderInfor.isUsed())
              AbsorbPointer(
                absorbing: true,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: RaisedButton(
                    color: Colors.transparent,
                    elevation: 0,
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          bottom: 2,
                          right: 2,
                        ),
                        child: Text(
                          appLocalizations.checkedIn,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: AppColors.CHECKIN_BUTTON_BG_COLOR,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget lineGroup(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 1.5,
            child: Container(
              height: 1,
              color: AppColors.LINE_COLOR,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildBtnCheckinEvent(EventGuest item, int index) {
    if (item.checkinStatus == 1) {
      return Center(
          child: Icon(
        Icons.check,
        color: Colors.greenAccent[700],
      ));
    }
    return GestureDetector(
      onTap: () {
        provider.actionCheckinEventGuest(context, item, index);
      },
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(Size(100, 30)),
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
          decoration: BoxDecoration(
            color: AppColors.CHECKIN_BUTTON_BG_COLOR,
            borderRadius: BorderRadius.all(
                Radius.circular(5.0) //         <--- border radius here
                ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.login,
                    color: Colors.white,
                    size: AdaptiveTextSize()
                        .getadaptiveTextSize(context, multiplier: 1.85),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    appLocalizations.checkInTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AdaptiveTextSize()
                          .getadaptiveTextSize(context, multiplier: 1.6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onRefresh(int id) async {
    if (!provider.isEventTicket) {
      provider.resetEventGuestsData();
      provider.getEventGuests(context, id, callbackFn: () {
        _refreshController.refreshCompleted();
        // setState(() {
        //   _itemCount = provider.lstGuest.length;
        // });
      });
    } else {
      provider.getEventTicketOrder(eventTicket.id, () {
        _refreshController.refreshCompleted();
      });
    }
  }

  _onLoading(int id) {
    if (!provider.isEventTicket) {
      provider.getEventGuests(context, id, callbackFn: () {
        _refreshController.loadComplete();
        // setState(() {
        //   _itemCount = provider.lstGuest.length;
        // });
      });
    } else {
      _refreshController.loadComplete();
    }
  }

  _onLoadingSearch(int id) {
    if (!provider.isEventTicket) {
      provider.getEventSearchGuests(context, id, searchText: searchTextGuest, isLoadMore: true,
          callbackFn: () {
        _refreshController.loadComplete();
      });
    } else {
      _refreshController.loadComplete();
    }
  }

  Widget _buildTextFieldSearch(int idEvent) {
    return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top > 0 ? 32 : 10,
            right: 50,
            left: 10),
        child: Form(
            key: searchKey,
            child: TextFormField(
              textInputAction: TextInputAction.search,
              focusNode: _textSearchFocusNode,
              controller: searchGuestController,
              style: TextStyle(
                fontFamily: AppTextStyles.tahomaFont,
                fontSize: AdaptiveTextSize()
                    .getadaptiveTextSize(context, multiplier: 1.85),
              ),
              onChanged: (value) {
                if (!provider.isEventTicket) {
                  searchTextGuest = value;
                  provider.resetEventSearchGuestsData();
                  provider.getEventSearchGuests(context, idEvent, isLoadMore: false,
                      searchText: value);

                  if (value.isNotEmpty) {
                    setState(() {
                      _isOpaqueLayoutSearch = true;
                      _isVisibleLayoutSearch = true;
                    });
                  } else {
                    setState(() {
                      _isOpaqueLayoutSearch = false;
                    });
                  }
                  provider.resetLoadingSearchNull();
                } else {
                  provider.getOrderFromData(eventTicket.id, value);
                }
              },
              decoration: new InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: AppColors.BACKGROUND_MAIN,
                prefixIcon: new Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchGuestController.clear();
                    provider.resetEventSearchGuestsData();
                    setState(() {
                      _isOpaqueLayoutSearch = false;
                    });
                    provider.resetLoadingSearchNull();
                  },
                  icon: Icon(Icons.clear),
                ),
                labelText: appLocalizations.guestSearchTitle,
                labelStyle: TextStyle(
                  fontFamily: AppTextStyles.tahomaFont,
                  fontSize: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 1.85),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColors.RED_COLOR,
                )),
                border: OutlineInputBorder(),
              ),
            )));
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
                AppLocalizations.of(context).noInternet,
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
      child: RaisedGradientButton(
        isLoading: true,
        btnController: provider.btnTryAgainController,
        disable: provider.isLoadingGuest,
        btnText: AppLocalizations.of(context).tryAgainButtonTitle,
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        onPressed: () {
          provider.doTryAgainForGuest(context, this.eventId);
        },
      ),
    );
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class AnimatedClipRect extends StatefulWidget {
  @override
  _AnimatedClipRectState createState() => _AnimatedClipRectState();

  final Widget child;
  final bool open;
  final bool horizontalAnimation;
  final bool verticalAnimation;
  final Alignment alignment;
  final Duration duration;
  final Duration reverseDuration;
  final Curve curve;
  final Curve reverseCurve;

  ///The behavior of the controller when [AccessibilityFeatures.disableAnimations] is true.
  final AnimationBehavior animationBehavior;

  AnimatedClipRect({
    this.child,
    this.open,
    this.horizontalAnimation = true,
    this.verticalAnimation = true,
    this.alignment = Alignment.center,
    this.duration,
    this.reverseDuration,
    this.curve = Curves.linear,
    this.reverseCurve,
    this.animationBehavior = AnimationBehavior.normal,
  });
}

class _AnimatedClipRectState extends State<AnimatedClipRect>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: widget.duration ?? const Duration(milliseconds: 500),
        reverseDuration: widget.reverseDuration ??
            (widget.duration ?? const Duration(milliseconds: 500)),
        vsync: this,
        value: widget.open ? 1.0 : 0.0,
        animationBehavior: widget.animationBehavior);
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
      reverseCurve: widget.reverseCurve ?? widget.curve,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.open
        ? _animationController.forward()
        : _animationController.reverse();

    return ClipRect(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, child) {
          return Align(
            alignment: widget.alignment,
            heightFactor: widget.verticalAnimation ? _animation.value : 1.0,
            widthFactor: widget.horizontalAnimation ? _animation.value : 1.0,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: context.bgSliverAppBar,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class TicketOrderDetail extends StatefulWidget {
  Function(Function) onPaid;
  Function(ETOrderDetailInfo, Function) onCheckIn;
  Function(Function) onCheckInAll;
  ETOrderInfo etOrderInfo;
  List<ETPaymentType> paymentType;
  String langSaved;

  TicketOrderDetail(this.etOrderInfo,
      {@required this.onPaid,
      @required this.onCheckIn,
      @required this.onCheckInAll,
      @required this.paymentType,
        @required this.langSaved});

  @override
  State<StatefulWidget> createState() => TicketOrderDetailState();
}

class TicketOrderDetailState extends State<TicketOrderDetail> {
  Function(Function) get onPaid => widget.onPaid;
  Function(ETOrderDetailInfo, Function) get onCheckIn => widget.onCheckIn;
  Function(Function) get onCheckInAll => widget.onCheckInAll;
  ETOrderInfo get etOrderInfo => widget.etOrderInfo;
  bool isVisible = false;
  List<ETPaymentType> get paymentType => widget.paymentType;
  String get langSaved => widget.langSaved;

  @override
  Widget build(BuildContext context) {
    List<ETOrderDetailInfo> etOrderDetailInfo = etOrderInfo.orderDetails;
    double sumQuantity = 0;
    double sumAmount = 0;
    double sumDiscount = 0;
    double sumPriceTicket = 0;

    for (var index = 0; index < etOrderDetailInfo?.length ?? 0; index++) {
      if (etOrderDetailInfo[index].quantity != null) {
        sumQuantity += etOrderDetailInfo[index].quantity;
        sumAmount += etOrderDetailInfo[index].getTotalAMount();
        sumDiscount += etOrderDetailInfo[index].getDiscoutnt();
        sumPriceTicket += etOrderDetailInfo[index].getPriceTicket();
      }
    }
    return Container(
      color: context.bgSliverAppBar,
      padding: EdgeInsets.fromLTRB(0, Utilities().paddingTopSizeHeight, 0, 0),
      child: SafeArea(
        child: Loading(
            visible: isVisible,
            child: Container(
              color: context.bgSliverAppBar,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: context.bgSliverAppBar,
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFB2B2B2),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: AppImage.backBtn,
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(
                            AppLocalizations.of(context).eventDetailTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.DARK_BLUE_TEXT),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: etOrderDetailInfo.length + 2,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return buildTitle(context);
                          }
                          if (index == etOrderDetailInfo.length + 1) {
                            if (sumPriceTicket == 0) {
                              return Container();
                            }
                            return buildSummary(context, sumPriceTicket,
                                sumDiscount, sumAmount);
                          }
                          return _buildItemEventTicket1(
                              context, etOrderInfo, etOrderDetailInfo[index - 1]);
                        },
                      ),
                    ),
                  ),
                  buildFooter(context, sumAmount)
                ],
              ),
            )),
      ),
    );
  }

  Container buildFooter(BuildContext context, double sumAmount) {
    return Container(
      decoration: BoxDecoration(
        color: context.bgSliverAppBar,
        border: Border(
          top: BorderSide(
            color: Color(0xFFB2B2B2),
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        alignment: Alignment.topLeft,
        color: context.bgSliverAppBar,
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          AppLocalizations.of(context).ticketSumAmount,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          Constants.formatCurrency.format(sumAmount),
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: AbsorbPointer(
                absorbing: etOrderInfo.isUsed(),
                child: RaisedButton(
                  color: Colors.transparent,
                  elevation: 0,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    reloadOrder();
                    if (etOrderInfo.isPaid()) {
                      onCheckInAll(reloadOrder);
                    } else {
                      onPaid(reloadOrder);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: etOrderInfo.isUsed()
                          ? context.bgMain
                          : (etOrderInfo.isPaid()
                              ? AppColors.CHECKIN_BUTTON_BG_COLOR
                              : Colors.blue),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: Text(
                        etOrderInfo.isUsed()
                            ? AppLocalizations.of(context).checkedIn
                            : (etOrderInfo.isPaid()
                                ? AppLocalizations.of(context).checkIn
                                : AppLocalizations.of(context).payOrder),
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: etOrderInfo.isUsed()
                                  ? AppColors.CHECKIN_BUTTON_BG_COLOR
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: context.bgSliverAppBar,
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               if (etOrderInfo?.guestName?.isNotEmpty == true) Text(
                etOrderInfo.guestName,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              if (etOrderInfo?.guestPhone?.isNotEmpty == true) Text(
                etOrderInfo.guestPhone,
                style: Theme.of(context).textTheme.headline5,
              ),
              if (etOrderInfo?.guestEmail?.isNotEmpty == true) Text(
                etOrderInfo.guestEmail,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getPaymentTypeValue() {
    for (int i =0 ;i < paymentType.length; i++) {
      if (etOrderInfo.paymentType == paymentType[i].settingCode) {
        return Utilities().getStringByLang(paymentType[i].settingValue, langSaved);
      }
    }
    return "";
  }

  Widget buildSummary(BuildContext context, double sumPriceTicket,
      double sumDiscount, double sumAmount) {
    String paymentTypeValue = getPaymentTypeValue();
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
            color: context.bgSliverAppBar,
          ),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 15,
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (paymentTypeValue.isNotEmpty) Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        AppLocalizations.of(context).etPaymentType,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        AppLocalizations.of(context).ticketTotally,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        AppLocalizations.of(context).ticketsDiscount,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 15),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context).ticketSumAmount,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (paymentTypeValue.isNotEmpty) Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        paymentTypeValue,
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        Constants.formatCurrency.format(sumPriceTicket),
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        Constants.formatCurrency.format(sumDiscount),
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 15),
                      ),
                    ),
                    Text(
                      Constants.formatCurrency.format(sumAmount),
                      textAlign: TextAlign.end,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemEventTicket1(BuildContext context, ETOrderInfo etOrderInfo,
      ETOrderDetailInfo etOrderDetailInfo) {
    FormatQRCode formatQRCode =
        FormatQRCode(FormatQRCode.EVENT_TICKET, etOrderDetailInfo.inviteCode);
    String data = jsonEncode(formatQRCode);
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: context.bgSliverAppBar,
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFB2B2B2),
                width: 1.0,
              ),
              top: BorderSide(
                color: Color(0xFFB2B2B2),
                width: 1.0,
              ),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.bgCard,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            child: QRCode(
                              funcDownload: () async {
                                await showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    contentPadding: EdgeInsets.only(
                                        left: 20, right: 20, bottom: 20),
                                    title: Text(
                                      AppLocalizations.of(context).scanQRCheck,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Container(
                                        height: 250,
                                        child:
                                            QRCode(sizeQRCode: 250, data: data),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              sizeQRCode: 100,
                              data: data,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  etOrderDetailInfo.inviteCode,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).ticketType,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      etOrderDetailInfo.ticketName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  (etOrderDetailInfo?.ticketIsFree == 1)
                                      ? AppLocalizations.of(context).ticketFree
                                      : etOrderDetailInfo.getPriceString(),
                                  style: Theme.of(context).textTheme.headline5.copyWith(
                                      fontSize: 14,
                                      color: (etOrderDetailInfo?.ticketIsFree == 1)
                                          ? AppColors.CHECKIN_BUTTON_BG_COLOR
                                          : context.textColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (!etOrderDetailInfo.isUsed() && etOrderInfo.isPaid())
                        RaisedButton(
                          color: Colors.transparent,
                          elevation: 0,
                          padding: const EdgeInsets.all(5),
                          onPressed: () {
                            reloadOrder();
                            onCheckIn(etOrderDetailInfo, reloadOrder);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: AppColors.CHECKIN_BUTTON_BG_COLOR,
                            ),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5.0,
                                right: 5,
                                top: 5,
                                bottom: 5,
                              ),
                              child: Text(
                                AppLocalizations.of(context).checkIn,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (etOrderDetailInfo?.ticketIsFree == 1)
                SizedBox(
                  height: 10,
                ),
              if (etOrderDetailInfo?.ticketIsFree != 1)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5.0, top: 10, bottom: 10),
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * 100,
                    height: 1.0,
                    color: Color(0xFFECECEC),
                  ),
                ),
              if (etOrderDetailInfo?.ticketIsFree != 1)
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).ticketSumAmount +
                                ' (${etOrderDetailInfo.getQuantityString()} ${AppLocalizations.of(context).ticket}):',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            AppLocalizations.of(context).ticketsDiscount + ':',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            AppLocalizations.of(context).ticketsIntoMoney + ':',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            etOrderDetailInfo.getTotalAmountQuantityString(),
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            etOrderDetailInfo.getAmountDiscountString(),
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            etOrderDetailInfo.getAmountString(),
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  reloadOrder() {
    setState(() {
      isVisible = !isVisible;
    });
  }
}
