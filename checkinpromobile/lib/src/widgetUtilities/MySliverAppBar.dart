import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final TabController tabController;
  final List<String> tabItem;
  final String picCover;

  MySliverAppBar(
      {@required this.expandedHeight,
      @required this.tabController,
      @required this.tabItem,
      @required this.picCover});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double radius = 40;
    return Column(
      children: [
        if (picCover != null && picCover.isNotEmpty)
          Image.network(
            picCover,
            fit: BoxFit.cover,
          )
        else
          Container(
              color: Colors.grey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context).coverImageTitle,
                        style: TextStyle(
                            fontFamily: AppTextStyles.helveticaFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(AppLocalizations.of(context).coverImageContent,
                        style: TextStyle(
                          fontFamily: AppTextStyles.helveticaFont,
                          fontSize: 13,
                        ))
                  ],
                ),
              )),
        Container(
          // height: radius,
          // width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
            color: Colors.blue[600].withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TabBar(
            unselectedLabelColor: AppColors.BACKGROUND_MAIN,
            indicator: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlue[200], Colors.lightBlue[400]]),
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent),
            tabs: tabItem.map((item) {
              return Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(item),
                ),
              );
            }).toList(),
            controller: tabController,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight * 2;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
