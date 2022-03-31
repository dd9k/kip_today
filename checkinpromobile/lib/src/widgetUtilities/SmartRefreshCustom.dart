import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SmartRefreshFooter extends StatefulWidget {
  SmartRefreshFooter({Key key}) : super(key: key);

  @override
  _SmartRefreshFooterState createState() {
    // TODO: implement createState
    return _SmartRefreshFooterState();
  }
}

class _SmartRefreshFooterState extends State<SmartRefreshFooter> {
  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("");
        } else if (mode == LoadStatus.loading) {
          body = CircularProgressIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text("");
        } else if (mode == LoadStatus.canLoading) {
          body = Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SpinKitDualRing(
                color: AppColors.MAIN_TEXT_COLOR,
                lineWidth: 2.0,
                size: 20,
              ),
              SizedBox(
                width: 15,
              ),
              Text(AppLocalizations.of(context).loadMoreTitle,
                  style: TextStyle(fontFamily: AppTextStyles.tahomaFont))
            ],
          ));
        } else {
          body = Text("");
        }
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}
