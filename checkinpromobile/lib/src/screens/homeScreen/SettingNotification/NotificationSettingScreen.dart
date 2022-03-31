import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/widgetUtilities/fswitch.dart';
import '../../MainScreen.dart';
import 'NotificationSettingNotifier.dart' as Noti;
import 'NotificationSettingNotifier.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NotificationSettingScreen extends MainScreen {
  static const String route_name = '/NotificationSettingScreen';
  @override
  NotificationSettingState createState() => NotificationSettingState();

  @override
  String getNameScreen() {
    return "NotificationSettingScreen";
  }
}

class NotificationSettingState
    extends MainScreenState<NotificationSettingNotifier> {
  var top = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double id;
    final Map<String, Object> receivedData =
        ModalRoute.of(context).settings.arguments;

    if (receivedData != null) {
      id = receivedData['id'] as double;
    }
    provider.getSaveItems(context);

    super.build(context);
    var percentBox = isPortrait ? 80 : 80;
    return Container(
      color: context.bgSliverAppBar,
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            context: context,
            index: -1,
            provider: provider,
          ),
          body: Selector<NotificationSettingNotifier, bool>(
            builder: (context, isLoading, child) {
              if (!isLoading) {
                if (provider.isNoInternet) {
                  return _buildLayoutNoConnectInternet();
                }
                return Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 13, right: 11),
                        padding: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: context.bgCard,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        alignment: Alignment.topCenter,
                        child: Selector<NotificationSettingNotifier,
                                List<ItemNotificationSwitch>>(
                            builder: (context, data, child) {
                              if (data.isEmpty || data != null) {
                                return MediaQuery.removePadding(
                                  context: context,
                                  child: item(data, widthScreen * percentBox),
                                  removeBottom: true,
                                  removeTop: true,
                                );
                              }
                              return CircularProgressIndicator();
                            },
                            selector: (buildContext, modelProvider) =>
                                modelProvider.items),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  color: Colors.grey[300].withOpacity(0.5),
                  width: double.infinity,
                  height: double.infinity,
                  child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          new Center(child: new CircularProgressIndicator())),
                );
              }
            },
            selector: (cx, provider) => provider.isLoading,
          ),
        ),
      ),
    );
  }

  Widget item(List<ItemNotificationSwitch> items, double widthBox) {
    return ListView.builder(
      padding: EdgeInsets.all(0.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 32, top: 23, bottom: 12, right: 33),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              items[index].image == null
                  ? ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return AppColors.colorIcon;
                      },
                      child: Icon(
                        items[index].icon,
                      ))
                  : items[index].image,
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      items[index].title ?? "",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              )),
              items[index].switchType == Noti.SwitchType.SMS
                  ? GestureDetector(
                      onTap: () => {provider.launchURL()},
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade900),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  3.0) //                 <--- border radius here
                              ),
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              appLocalizations.contactContent,
                              style: TextStyle(
                                  fontFamily: AppTextStyles.tahomaFont,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context,
                                          multiplier: 1.85),
                                  color: Colors.green.shade900),
                            )),
                      ),
                    )
                  : Selector<NotificationSettingNotifier, bool>(
                      builder: (context, data, child) {
                        return FSwitch(
                          open: items[index].isSelect,
                          width: 50.0,
                          height: 25.538,
                          childOffset: 3.0,
                          color: Colors.grey,
                          openColor: AppColors.MAIN_TEXT_COLOR,
                          onChanged: (v) {
                            provider.switchItem(context, items[index]);
                            // setState(() {
                            //   items[index].isSelect = !items[index].isSelect;
                            // });
                          },
                          closeChild: Text(
                            "",
                            style: TextStyle(
                                fontFamily: AppTextStyles.tahomaFont,
                                color: Colors.white,
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context)),
                          ),
                          openChild: Text(
                            "",
                            style: TextStyle(
                                fontFamily: AppTextStyles.tahomaFont,
                                color: Colors.white,
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context)),
                          ),
                        );
                      },
                      selector: (cxt, provider) => provider.reloadSwitch,
                    ),
              Selector<NotificationSettingNotifier, bool>(
                builder: (context, data, child) {
                  if (items[index].isSelect == true &&
                      (items[index].switchType == Noti.SwitchType.ZALO ||
                          items[index].switchType == Noti.SwitchType.VIBER)) {
                    return GestureDetector(
                      onTap: () => {
                        Utilities().showTwoButtonDialog(
                          context,
                          DialogType.QUESTION,
                          null,
                          appLocalizations.confirmNotifyTitle,
                          appLocalizations.confirmChangeAccountViberZalo,
                          appLocalizations.noTitle,
                          appLocalizations.yesTitle,
                          () {},
                          () {
                            provider.switchItemZaLoViber(context, items[index]);
                          },
                        )
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.cached,
                            size: 32,
                          ),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
                selector: (cxt, provider) => provider.reloadSwitch,
              ),
            ],
          ),
        );
      },
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
        disable: provider.isLoading,
        btnText: AppLocalizations.of(context).tryAgainButtonTitle,
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        onPressed: () {
          provider.doTryAgain(context);
        },
      ),
    );
  }
}
