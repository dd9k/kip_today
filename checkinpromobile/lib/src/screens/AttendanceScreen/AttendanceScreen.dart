import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppDestination.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/AttendanceGroup.dart';
import 'package:checkinpromobile/src/model/AttendanceGroupResult.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/CalendarItem.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:flutter/material.dart';
import 'AttendanceNotifier.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends MainScreen {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();

  @override
  String getNameScreen() {
    return "AttendanceScreen";
  }
}

class _AttendanceScreenState extends MainScreenState<AttendanceNotifier>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<MainScreen> {
  final GlobalKey key = GlobalKey(debugLabel: 'nest');
  String _itemDateSelect = '';

  bool _isFirstInit = true;

  @override
  bool get wantKeepAlive => true;

  int _indexTabSelected = -1;

  String langSaved = Constants.VN_CODE;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _initTabController() {
    provider.tabItem.clear();
    final currentYear = DateTime.now().year;
    for (var i = DateTime.now().month; i > 0; i--) {
      String zeroPrefix = '';
      if (i <= 9) {
        zeroPrefix = '0';
      }
      provider.tabItem
          .add(TabItemAttendance('$zeroPrefix$i-$currentYear', false));
      provider.attendanceGroupResult.add(AttendanceGroupResult());
    }
    _indexTabSelected = 0;
    provider.tabController = TabController(
        initialIndex: _indexTabSelected,
        length: provider.tabItem.length,
        vsync: this);
    // Load data init
    _itemDateSelect = '${DateTime.now().year}-${provider.tabItem[_indexTabSelected].title.split("-").first}-01';
    // Listener tab controller
    provider.tabController.addListener(() {
      if (provider.tabController.index != this._indexTabSelected) {
        _indexTabSelected = provider.tabController.index;
        _itemDateSelect = '${DateTime.now().year}-${provider.tabItem[_indexTabSelected].title.split("-").first}-01';
        // Load data
        provider.postAttendanceDetail(
            context, _itemDateSelect, _indexTabSelected);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_isFirstInit) {
      _isFirstInit = false;
      _initTabController();
      // Load data
      provider.postAttendanceDetail(
          context, _itemDateSelect, _indexTabSelected);
      langSaved =
          provider.parent.preferences.getString(Constants.KEY_LANGUAGE) ??
              Constants.LANG_DEFAULT;
    }
    return DefaultTabController(
      length: provider.tabItem.length,
      child: Container(
        child: NestedScrollView(
          key: key,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  expandedHeight: 0,
                  collapsedHeight: 0.00001,
                  toolbarHeight: 0,
                  elevation: 0,
                  backgroundColor: context.bgSliverAppBar,
                  centerTitle: true,
                  leading: null,
                  floating: false,
                  pinned: false,
                  snap: false,
                  bottom: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: context.bgSwapColor,
                    labelColor: AppColors.TITLE_APPBAR_COLOR,
                    controller: provider.tabController,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: AppColors.DARK_BLUE_TEXT,
                        width: 2.0,
                      ),
                    ),
                    tabs: provider.tabItem.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Tab(
                          child: Text(
                            item.title,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            controller: provider.tabController,
            children: provider.tabItem
                .asMap()
                .map(
                  (i, _) {
                    return MapEntry(
                      i,
                      RefreshIndicator(
                        //backgroundColor: Colors.red,
                        onRefresh: () => Future<void>(() {
                          provider.resetLoadData(i);
                          provider.postAttendanceDetail(
                              context, _itemDateSelect, _indexTabSelected);
                        }),
                        child: _buildListViewCalendar(i),
                      ),
                    );
                  },
                )
                .values
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildListViewCalendar(int indexTab) {
    double height = 23;
    return Selector<AttendanceNotifier, bool>(
      builder: (cx, isLoading, child) {
        return isLoading == false && provider.tabItem[indexTab].isLoaded == true
            ? Selector<AttendanceNotifier, List<AttendanceGroup>>(
                builder: (cx, data, child) {
                  if (data != null && data.isNotEmpty) {
                    return ListView.separated(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: provider.tabItem[indexTab].data.length + 1,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 5,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return buildSummary(indexTab, context);
                          }
                          var item = provider.tabItem[indexTab].data[index - 1];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  item.weekRange,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                        fontSize: 16,
                                        color: AppColors.TITLE_APPBAR_COLOR,
                                      ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: ListView.separated(
                                    padding: const EdgeInsets.only(
                                        bottom:
                                            AppDestination.PADDING_BOTTOM_ITEM),
                                    separatorBuilder:
                                        (BuildContext context, int indexChild) {
                                      return SizedBox(
                                        height: 10,
                                      );
                                    },
                                    itemCount: item.listDetail.length,
                                    physics: ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int indexChild) {
                                      var child = item.listDetail[indexChild];
                                      int length = child.attendanceList == null
                                          ? 1
                                          : child.attendanceList.length;
                                      return Calendar(
                                        totalWorkingTimeALlDay:
                                            child.getTotalWorkingTime(
                                          appLocalizations,
                                        ),
                                        day: child.dayOfMonth == null
                                            ? '-'
                                            : child.dayOfMonth,
                                        item: child.attendanceList == null
                                            ? 1
                                            : child.attendanceList.length,
                                        heightlist: length * height,
                                        lst: child.attendanceList,
                                        lang: langSaved,
                                        preferences:
                                            provider.parent.preferences,
                                        isLate: child.isLate,
//                                        isEnoughWorkingTime: child.isEnoughWorkingTime,
                                      );
                                    }),
                              ),
                            ],
                          );
                        });
                  } else {
                    return _buildLayoutNotFound();
                  }
                },
                selector: (cx, provider) => provider.items,
              )
            : Container(
                color: context.bgSliverAppBar.withOpacity(0.5),
                width: double.infinity,
                height: double.infinity,
                child: new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Center(child: new CircularProgressIndicator())),
              );
      },
      selector: (cx, provider) => provider.isLoading,
    );
  }

  Card buildSummary(int indexTab, BuildContext context) {
    return Card(
      color: context.bgSliverAppBar,
      elevation: 0,
      margin: EdgeInsets.only(top: 8.0, left: 15, right: 15),
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildLate(indexTab, context),
            buildNotOut(indexTab, context),
            buildTotal(indexTab, context),
          ],
        ),
      ),
    );
  }

  Widget buildTotal(int indexTab, BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            Utilities.capitalize(appLocalizations.totalTimeTitle),
            style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 13),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                width: 0.5,
                color: Color(0xff006dea),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2.0, bottom: 2, left: 4, right: 4),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${provider.utilities.roundStringDouble(provider.attendanceGroupResult[indexTab].totalWorkingTime)}',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: 13,
                            color: Color(0xff006dea),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEnough(int indexTab, BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            Utilities.capitalize(appLocalizations.enoughTimeTitle),
            style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 12),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                width: 0.5,
                color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2.0, bottom: 2, left: 4, right: 4),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${provider.attendanceGroupResult[indexTab].totalNotEnough}',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: 12,
                          color: AppColors.CHECKOUT_BUTTON_BG_COLOR),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNotOut(int indexTab, BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            appLocalizations.isNoOut,
            style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 13),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                width: 0.5,
                color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2.0, bottom: 2, left: 4, right: 4),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${provider.attendanceGroupResult[indexTab].totalNotCheckout}',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: 13,
                            color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLate(int indexTab, BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            appLocalizations.isLate,
            style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 13),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                width: 0.5,
                color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2, bottom: 2, left: 4, right: 4),
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text:
                          '${provider.attendanceGroupResult[indexTab].totalLate}',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: 13,
                            color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
                style: Theme.of(context).textTheme.headline5,
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
        disable: provider.isLoading,
        btnText: AppLocalizations.of(context).tryAgainButtonTitle,
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        onPressed: () {
          provider.doTryAgain(context, _itemDateSelect, _indexTabSelected);
        },
      ),
    );
  }

  final Shader linearGradientWorkingTimeMonth = LinearGradient(
    colors: <Color>[Color(0xff06b39b), Color(0xff39dabc)],
  ).createShader(Rect.fromLTWH(200.0, 0.0, 200.0, 0.0));

  final Shader linearGradientWorkingtimeweek = LinearGradient(
    colors: <Color>[Color(0xff4c69c5), Color(0xff60adfa)],
  ).createShader(Rect.fromLTWH(200.0, 0.0, 200.0, 0.0));
}
