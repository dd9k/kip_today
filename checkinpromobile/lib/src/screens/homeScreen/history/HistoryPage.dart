//import 'package:checkinpromobile/src/constants/AppColors.dart';
//import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
//import 'package:checkinpromobile/src/screens/MainScreen.dart';
//import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/ItemVisitorLog.dart';
//import 'package:checkinpromobile/src/widgetUtilities/Shimmer.dart';
//import 'package:flutter/material.dart';
//
//import 'HistoryNotifier.dart';
//
//class HistoryPage extends MainScreen {
//  @override
//  HistoryPageState createState() => HistoryPageState();
//
//  @override
//  String getNameScreen() {
//    return "HistoryPage";
//  }
//}
//
//class HistoryPageState extends MainScreenState<HistoryNotifier>
//    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<MainScreen> {
//  @override
//  bool get wantKeepAlive => true;
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    super.build(context);
//    return FutureBuilder(
//        future: provider.getExpected(context, "Asia/Saigon", 1, 10),
//        builder: (widget, snapshot) {
//          if (snapshot.hasData) {
//            return Column(
//              children: [
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Padding(
//                    padding: EdgeInsets.only(left: 10),
//                    child: Text(
//                      "Check in , Check out",
//                      style: TextStyle(
//                          fontSize: 13.0,
//                          fontFamily: AppTextStyles.montserratFont,
//                          color: AppColors.BLUE_COLOR,
//                          fontWeight: FontWeight.w500,
//                          decoration: TextDecoration.none),
//                    ),
//                  )
//                ),
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Padding(
//                    padding: EdgeInsets.only(left: 10),
//                    child: Text(
//                      "Total September, 155h",
//                      style: TextStyle(
//                          fontSize: 14.0,
//                          fontFamily: AppTextStyles.montserratFont,
//                          color: AppColors.TEXT_GRAY,
//                          fontWeight: FontWeight.w200,
//                          fontStyle: FontStyle.italic,
//                          decoration: TextDecoration.none
//                      ),
//                    ),
//                  )
//                ),
//                Expanded(
//                  child:  ItemVisitorLog(
//                    listVisitor: provider.listExpected,
//                    itemLogType: ItemLogType.HISTORY,
//                  ),
//                )
//
//              ],
//            );
//          }
//          return itemLoading();
//        });
//  }
//
//  Widget itemLoading() {
//    return Padding(
//      padding: EdgeInsets.only(left: 15, right: 15),
//      child: ListView.separated(
//          physics: NeverScrollableScrollPhysics(),
//          scrollDirection: Axis.vertical,
//          shrinkWrap: true,
//          itemCount: 5,
//          separatorBuilder: (BuildContext context, int index) {
//            return SizedBox(
//              height: 5,
//            );
//          },
//          itemBuilder: (BuildContext context, int index) {
//            return Container(
//              padding: EdgeInsets.all(10),
//              decoration: BoxDecoration(
//                color: Colors.white,
//                border: Border(
//                  bottom: BorderSide(
//                    //                   <--- left side
//                    color: Colors.black54,
//                    width: 1.0,
//                  ),
//                ),
//              ),
//              child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    Shimmer(
//                      baseColor: AppColors.BASE_LOADING,
//                      highlightColor: AppColors.HIGHLIGHT_LOADING,
//                      child: Container(
//                        color: AppColors.BACKGROUND_LOADING,
//                        width: 170,
//                        height: 15,
//                      ),
//                    ),
//                    SizedBox(
//                      height: 10,
//                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Icon(
//                          Icons.timer,
//                          size: 15,
//                          color: Colors.grey,
//                        ),
//                        SizedBox(
//                          width: 5,
//                        ),
//                        Shimmer(
//                          baseColor: AppColors.BASE_LOADING,
//                          highlightColor: AppColors.HIGHLIGHT_LOADING,
//                          child: Container(
//                            color: AppColors.BACKGROUND_LOADING,
//                            width: 150,
//                            height: 15,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ]),
//            );
//          }),
//    );
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//  }
//}
