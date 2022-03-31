import 'package:auto_size_text/auto_size_text.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/AppDestination.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorInviteNotifier.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/SmartRefreshCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checkinpromobile/src/model/InvitationGroup.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';

import 'ItemVisitorLog.dart';

class ItemInvitation extends StatefulWidget {
  final List<InvitationGroup> listInvitation;
  final ItemLogType itemLogType;
  final Function itemClickFunc;
  final Function loadingMoreFunc;
  final Function pullRefreshFunc;

  ItemInvitation(
      {@required this.listInvitation,
      @required this.itemLogType,
      this.itemClickFunc,
      this.loadingMoreFunc,
      this.pullRefreshFunc});

  @override
  State<StatefulWidget> createState() => ItemInvitationState();
}

class ItemInvitationState extends State<ItemInvitation>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<ItemInvitation> {
  VisitorInviteNotifier provider;
  bool isSwitched = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    provider = Provider.of<VisitorInviteNotifier>(context, listen: false);
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
      child: RefreshConfiguration(
          footerTriggerDistance: 400,
          child: SmartRefresher(
              child: ListView.separated(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.listInvitation.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    var item = widget.listInvitation[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: AppDestination.PADDING_HORIZONTAL_LIST),
                          child: Text(
                            item.startDate,
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
                              itemCount: item.inviteNewVisitor.length,
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder:
                                  (BuildContext context, int indexChild) {
                                var child = item.inviteNewVisitor[indexChild];
                                return itemInvitation(child);
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
              controller: _refreshController)),
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

  Widget itemInvitation(InviteNewVisitor child) {
    return GestureDetector(
      onTap: () {
        widget.itemClickFunc(child);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(5.0) //         <--- border radius here
              ),
          color: context.bgCard,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        provider.utilities.convertStringToColor(child.color)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${child.getStartJustTime(context, provider.langSaved, is12h: false)}\n \n${child.getEndJustTime(context, provider.langSaved, is12h: false)}",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontSize: 15,
                      color: AppColors.TEXT_COLOR_DARK,
                      fontStyle: FontStyle.italic,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 70,
                width: 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: context.bgSliverAppBar,
                ),
              ),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          child.invitationName.trim(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 23,
                              child: AppImage.icHome,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: SizeConfig.safeBlockHorizontal * 45,
                              child: AutoSizeText(
                                child.branchName ?? "",
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
                //color: provider.utilities.convertStringToColor(child.color),
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
