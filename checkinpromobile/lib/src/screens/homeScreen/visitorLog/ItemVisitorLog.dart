import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppDestination.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/DetailVisitorLog.dart';
import 'package:checkinpromobile/src/model/LogGroup.dart';
import 'package:checkinpromobile/src/model/VisitorLog.dart';
import 'package:checkinpromobile/src/screens/DetailHistoryVisitorLog/DetailHistoryVisitorLogNotifier.dart';
import 'package:checkinpromobile/src/screens/DetailHistoryVisitorLog/DetailHistoryVisitorLogScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorLogNotifier.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/SmartRefreshCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum ItemLogType { VISITOR, HISTORY }

enum Status { EXPECT, IN, OUT }

class ItemVisitorLog extends StatefulWidget {
  final bool notYetCheckOut;
  final List<LogGroup> listVisitor;
  final ItemLogType itemLogType;
  final Function loadingMoreFunc;
  final Function pullRefreshFunc;

  ItemVisitorLog(
      {@required this.listVisitor,
      @required this.itemLogType,
      this.loadingMoreFunc,
      this.pullRefreshFunc,
      this.notYetCheckOut});

  @override
  State<StatefulWidget> createState() => ItemVisitorLogState();
}

class ItemVisitorLogState extends State<ItemVisitorLog>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<ItemVisitorLog> {
  VisitorLogNotifier provider;
  bool isSwitched = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    provider = Provider.of<VisitorLogNotifier>(context, listen: false);
    super.initState();
  }

  RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    locator<Utilities>()
        .printLog("build ItemVisitorLog......................................");
    return Container(
      padding: EdgeInsets.only(
          top: AppDestination.PADDING_TOP_LIST,
          bottom: AppDestination.PADDING_BOTTOM_LIST),
      width: double.infinity,
      child: SmartRefresher(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.listVisitor.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                var item = widget.listVisitor[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppDestination.PADDING_HORIZONTAL_LIST),
                      child: Text(
                        item.signIn,
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: AppColors.DARK_BLUE_TEXT),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: AppDestination.PADDING_HORIZONTAL_LIST,
                          right: AppDestination.PADDING_HORIZONTAL_LIST),
                      child: ListView.separated(
                          padding: const EdgeInsets.only(
                              bottom: AppDestination.PADDING_BOTTOM_ITEM),
                          separatorBuilder:
                              (BuildContext context, int indexChild) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: item.logVisitor.length,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int indexChild) {
                            var child = item.logVisitor[indexChild];
                            return itemVisitorLog(child);
                          }),
                    ),
                  ],
                );
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
          controller: _refreshController),
    );
  }

  _onRefresh() {
    widget.pullRefreshFunc(() {
      _refreshController.refreshCompleted();
    });
  }

  _onLoading(BuildContext context) {
    widget.loadingMoreFunc(() {
      _refreshController.loadComplete();
    });
  }

  Widget itemVisitorLog(VisitorLog visitorLog) {
    return GestureDetector(
      onTap: () {
        DetailVisitorLog detailVisitorLog = DetailVisitorLog(
            fullname: visitorLog.fullName,
            emailAddress: visitorLog.email,
            numberPhone: visitorLog.phoneNumber,
            company: visitorLog.fromCompany,
            branchName: visitorLog.branchName,
            branchAddress: '',
            faceImg: visitorLog.nameImgLocal ?? visitorLog.faceCaptureFile,
            signIn: visitorLog.signIn,
            signOut: visitorLog.signOut,
            feedback: visitorLog.feedback,
            rating: visitorLog.rating);
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
        padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(7.0) //         <--- border radius here
              ),
          color: context.bgCard,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                widget.notYetCheckOut
                    ? visitorLog.getInJustTime(context, provider.langSaved)
                    : visitorLog.getOutJustTime(context, provider.langSaved),
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontSize: 15),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 60,
                width: 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(7.0) //         <--- border radius here
                      ),
                  color: AppColors.BLACK_TEXT_COLOR,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 45,
                      height: 45,
                      imageUrl: visitorLog.getLinkFace() ?? "",
                      placeholder: (cx, url) {
                        return CircularProgressIndicator();
                      },
                      errorWidget: (context, url, error) {
                        if (visitorLog.getLinkFaceLocal().isNotEmpty) {
                          return FutureProvider<File>(
                            create: (_) {
                              return locator<Utilities>().getLocalFile(
                                  Constants.FOLDER_TEMP_VISITOR_LOG,
                                  visitorLog.nameImgLocal,
                                  null);
                            },
                            child: Consumer<File>(
                              builder: (_, value, __) {
                                if (value == null) {
                                  return CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/default_avatar.png'),
                                    radius: AdaptiveTextSize()
                                        .getadaptiveTextSize(context,
                                            multiplier: 1.85),
                                  );
                                }
                                return Image.memory(value.readAsBytesSync(),
                                    width: 45, height: 45, fit: BoxFit.cover);
                              },
                            ),
                          );
                        }
                        return CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/default_avatar.png'),
                          radius: AdaptiveTextSize()
                              .getadaptiveTextSize(context, multiplier: 1.85),
                        );
                      })),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        visitorLog?.fullName?.trim() ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 16),
                      ),
                      if (visitorLog.visitorTypeValue != null &&
                          visitorLog.visitorTypeValue.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                _getIconVisitorType(visitorLog.visitorType),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: SizeConfig.safeBlockHorizontal * 30,
                                child: AutoSizeText(
                                  visitorLog.getVisitorTypeValue(
                                          provider.langSaved) ??
                                      "",
                                  maxLines: 3,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        fontSize: 15,
                                        color: AppColors.DARK_BLUE_TEXT,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              )
            ],
          ),
        ),
      ),
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
}
