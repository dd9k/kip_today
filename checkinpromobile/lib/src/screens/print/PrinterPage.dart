import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppDestination.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/services/printService/PrinterModel.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'PrinterNotifier.dart';

class PrinterPage extends MainScreen {
  static const String route_name = '/PrinterScreen';

  @override
  PrinterPageState createState() => PrinterPageState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class PrinterPageState extends MainScreenState<PrinterNotifier>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<MainScreen> {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
//    var provider = Provider.of<PrintNotifier>(context, listen: false);
//    provider.checkConnect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var provider = Provider.of<PrinterNotifier>(context, listen: false);
    SizeConfig().init(context);
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var percentBoxHeight = isPortrait ? 60 : 80;
    return Container(
      color: context.bgSliverAppBar,
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            context: context,
            index: -1,
            provider: provider,
            childRight: Icon(
              Icons.refresh_rounded,
              color: AppColors.MAIN_TEXT_COLOR,
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Selector<PrinterNotifier, bool>(
                    builder: (context, data, child) {
                      return FutureBuilder<List<PrinterModel>>(
                        builder: (context, data) {
                          if (data.connectionState == ConnectionState.waiting ||
                              !data.hasData ||
                              data.data.isEmpty) {
                            if (data.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Align(
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator()),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        AppLocalizations.of(context)
                                            .searchPrinter,
                                        style: TextStyle(
                                            fontSize: AdaptiveTextSize()
                                                .getadaptiveTextSize(context,
                                                    multiplier: 1.85),
                                            fontFamily:
                                                AppTextStyles.tahomaFont))
                                  ],
                                ),
                              );
                            }
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.print,
                                    size: AdaptiveTextSize()
                                        .getadaptiveTextSize(context,
                                            multiplier: 1.85),
                                    color: AppColors.HINT_TEXT_COLOR,
                                  ),
                                  Text(AppLocalizations.of(context).noPrinter,
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context,
                                                  multiplier: 1.85),
                                          fontFamily:
                                              AppTextStyles.tahomaFont)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          }
                          return Container(
                            height: double.infinity,
                            padding:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Selector<PrinterNotifier, bool>(
                              builder: (widget, data, child) => Container(
                                height: SizeConfig.blockSizeHorizontal *
                                    percentBoxHeight,
                                // width: SizeConfig.blockSizeHorizontal * percentBox,
                                alignment: Alignment.topCenter,
                                child: layoutSettingPrint(),
                              ),
                              selector: (buildContext, provider) =>
                                  provider.isReload,
                            ),
                          );
                        },
                        future: provider.findAllPrinter(context),
                      );
                    },
                    selector: (buildContext, provider) => provider.isLoading,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget layoutSettingPrint() {
    var provider = Provider.of<PrinterNotifier>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(0.0),
            shrinkWrap: true,
            itemCount: provider.devices.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 70,
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.print,
                            size: AdaptiveTextSize()
                                .getadaptiveTextSize(context, multiplier: 3.0),
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Text(
                                  '${provider.devices[index].model}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.tahomaFont,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context,
                                            multiplier: 2.0),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${provider.devices[index].ipAddress}',
                                  style: TextStyle(
                                      fontFamily: AppTextStyles.tahomaFont,
                                      fontSize: AdaptiveTextSize()
                                          .getadaptiveTextSize(context,
                                              multiplier: 1.85),
                                      color: AppColors.MAIN_TEXT_COLOR),
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: 40,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Expanded(
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                width: 7,
                                                height: 7,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              40.0)),
                                                  color: provider.devices[index]
                                                          .isConnect
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    provider.devices[index]
                                                            .isConnect
                                                        ? AppLocalizations.of(
                                                                context)
                                                            .connected
                                                        : AppLocalizations.of(
                                                                context)
                                                            .disconnected,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .tahomaFont,
                                                        fontSize: AdaptiveTextSize()
                                                            .getadaptiveTextSize(
                                                                context,
                                                                multiplier:
                                                                    1.85),
                                                        color:
                                                            Colors.grey[700])),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              provider.devices[index].isConnect
                                  ? SizedBox(
                                      width: 100,
                                      height: 30,
                                      child: RaisedButton(
                                        onPressed: () {
                                          if (provider
                                              .devices[index].isConnect) {
                                            provider.printTest(context,
                                                provider.devices[index]);
                                          }
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0)),
                                        padding: const EdgeInsets.all(0.0),
                                        child: Ink(
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: const [
                                                Color(0xff0359D4),
                                                Color(0xff0294B4)
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)),
                                          ),
                                          child: Container(
                                            constraints: const BoxConstraints(
                                                minWidth: 88.0,
                                                minHeight: 36.0),
                                            // min sizes for Material buttons
                                            alignment: Alignment.center,
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .printTest,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: AdaptiveTextSize()
                                                    .getadaptiveTextSize(
                                                        context,
                                                        multiplier: 1.6),
                                                fontFamily:
                                                    AppTextStyles.tahomaFont,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 100,
                                height: 30,
                                child: RaisedButton(
                                  onPressed: () {
                                    provider.connectPrinter(
                                        context, provider.devices[index]);
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient:
                                          !provider.devices[index].isConnect
                                              ? LinearGradient(
                                                  colors: [
                                                    Color(0xff0359D4),
                                                    Color(0xff0294B4)
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                )
                                              : LinearGradient(
                                                  colors: [
                                                    Color(0xFFC32B2B),
                                                    Color(0xFFC11B2B)
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                    ),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                          minWidth: 88.0, minHeight: 36.0),
                                      // min sizes for Material buttons
                                      alignment: Alignment.center,
                                      child: Text(
                                        provider.devices[index].isConnect
                                            ? AppLocalizations.of(context)
                                                .disconnect
                                            : AppLocalizations.of(context)
                                                .connect,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context,
                                                  multiplier: 1.6),
                                          fontFamily: AppTextStyles.tahomaFont,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
