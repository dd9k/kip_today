import 'package:auto_size_text/auto_size_text.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/model/DetailVisitorLog.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/screens/DetailInviteVisitorLog/DetailInviteVisitorLogNotifier.dart';
import 'package:checkinpromobile/src/screens/DetailInviteVisitorLog/DetailInviteVisitorLogScreen.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/ItemVisitorInvitationNotifier.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/LabelDisplayCommon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ItemVisitorInvitationScreen extends MainScreen {
  static const String route_name = '/item-visitor-invitation-screen';

  @override
  ItemVisitorInvitationScreenState createState() =>
      ItemVisitorInvitationScreenState();

  @override
  String getNameScreen() {
    // TODO: implement getNameScreen
    throw UnimplementedError();
  }
}

class ItemVisitorInvitationScreenState
    extends MainScreenState<ItemVisitorInvitationNotifier>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<MainScreen> {
  ItemVisitorInvitationNotifier provider;
  bool isSwitched = true;

  double get maxHeight => 300 + MediaQuery.of(context).padding.top;

  double get minHeight => kToolbarHeight + MediaQuery.of(context).padding.top;

  bool isEmpty = false;

  TabController _tabController;

  int _indexTab = 0;

  @override
  bool get wantKeepAlive => true;

  final List<String> _tabItem = List();

  @override
  void initState() {
    provider =
        Provider.of<ItemVisitorInvitationNotifier>(context, listen: false);
    super.initState();
  }

  void _initTabController() {
    // Init tab
    _tabItem.clear();
    _tabItem.add(AppLocalizations.of(context).eventDetailTitle);
    _tabItem.add(AppLocalizations.of(context).eventGuestsTitle);
    _tabController = TabController(
        initialIndex: _indexTab, length: _tabItem.length, vsync: this);
    _tabController.addListener(() {
      _indexTab = _tabController.index;
    });
  }

  void _getArgument(BuildContext context) {
    var arguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    if (arguments != null) {
      provider.invitation = arguments['newVisitor'] as InviteNewVisitor;
      provider.getVisitorInvite(
          context, "Asia/Saigon", 1, 10, provider.invitation);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _initTabController();
    _getArgument(context);
    locator<Utilities>()
        .printLog("build ItemVisitorLog......................................");
    return Selector<ItemVisitorInvitationNotifier, bool>(
      builder: (cx, data, child) {
        return Container(
            //color: Colors.white,
            child: DefaultTabController(
          length: _tabItem.length,
          child: Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              leading: GestureDetector(
                onTap: () {
                  AppRouter.pop(context);
                },
                child: AppImage.backBtn,
              ),
              title: Text(
                provider.getTitle(context).toUpperCase(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
              bottom: TabBar(
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
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.album_outlined,
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 2),
                            child: Align(
                              child: Text(
                                _tabItem[0],
                                textAlign: TextAlign.center,
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
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.account_circle_outlined,
                                )),
                            padding: EdgeInsets.only(
                              right: 0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, top: 2),
                            child: Align(
                              child: Text(
                                _tabItem[1],
                                textAlign: TextAlign.center,
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
            body: TabBarView(
              controller: _tabController,
              children: [
                _buildTabDetail(),
                ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: provider.lstVisitorInvite.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 0,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return itemVisitorInvitation(index);
                    })
              ],
            ),
          ),
        ));
      },
      selector: (cx, provider) => provider.isLoading,
    );
  }

  Widget _buildTabDetail() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 10, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: context.bgCard,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 13, bottom: 17),
              child: Column(
                children: [
                  FutureBuilder(
                    future: locator<Utilities>().convertDateToStringLongDate(
                        provider.invitation.startDate, context),
                    builder: (cx, snapshot) {
                      return LabelDisplayCommon(
                        prefixIcon: Icons.access_time_outlined,
                        body: snapshot.data,
                        bodyColor: AppColors.MAIN_TEXT_COLOR,
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: LabelDisplayCommon(
                      prefixIcon:
                          _getIconVisitorType(provider.invitation.visitorType),
                      body: provider.visitorTypeName,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: LabelDisplayCommon(
                      prefixIcon: Icons.location_city_outlined,
                      body: provider.invitation.branchName,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: LabelDisplayCommon(
                      prefixIcon: Icons.location_on_outlined,
                      body: provider.invitation.branchAddress,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: LabelDisplayCommon(
                      prefixIcon: Icons.note_outlined,
                      body: provider.invitation.description,
                      maxLines: 3,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemVisitorInvitation(int index) {
    var visitorLog = provider.lstVisitorInvite[index];
    return InkWell(
        onTap: () {
          DetailVisitorLog detailVisitorLog = DetailVisitorLog(
              fullname: visitorLog.visitorName,
              emailAddress: visitorLog.visitorEmail,
              numberPhone: visitorLog.visitorPhoneNumber,
              company: visitorLog.visitorCompany,
              branchName: provider.siteName,
              branchAddress: '',
              inviteCode: visitorLog.inviteCode,
              startDate: provider.invitation.startDate);
          // Show bottom sheet
          showModalBottomSheet<void>(
              builder: (_) {
                return ChangeNotifierProvider(
                  create: (_) => DetailInviteVisitorLogNotifier(),
                  child: DetailInviteVisitorLogScreen(
                    detailVisitorLog: detailVisitorLog,
                    visitorTypeName: provider.visitorTypeName,
                    eInviteDetailVisitorLog:
                        E_INVITE_DETAIL_VISITOR_LOG.INVITATION,
                  ),
                );
              },
              context: context,
              isScrollControlled: true);
        },
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 10, right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: context.bgCard,
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 13, bottom: 17, right: 15),
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
                          visitorLog.visitorName,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.markunread_outlined,
                            ),
                            Expanded(
                              flex: 9,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5, top: 0),
                                child: AutoSizeText(
                                  (visitorLog.visitorEmail == null ||
                                          visitorLog.visitorEmail.isEmpty ==
                                              true)
                                      ? appLocalizations.noneContent
                                      : visitorLog.visitorEmail,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                          color: AppColors.DARK_BLUE_TEXT),
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.phone),
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 0),
                              child: Text(
                                (visitorLog.visitorPhoneNumber == null ||
                                        visitorLog.visitorPhoneNumber.isEmpty ==
                                            true)
                                    ? appLocalizations.noneContent
                                    : visitorLog.visitorPhoneNumber,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(color: AppColors.DARK_BLUE_TEXT),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: AdaptiveTextSize()
                          .getadaptiveTextSize(context, multiplier: 1.85),
                    ),
                    padding: EdgeInsets.only(top: 30),
                  ),
                ]),
          ),
        ));
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
}
