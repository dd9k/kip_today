import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/utilities/PermissionCallBack.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/Loading.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:checkinpromobile/src/widgetUtilities/fswitch.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'SettingNotifier.dart';
import 'package:app_settings/app_settings.dart';

final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.blue[700], Colors.greenAccent[200]],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class SettingPage extends MainScreen {
  @override
  SettingPageState createState() => SettingPageState();

  @override
  String getNameScreen() {
    return "SettingPage";
  }
}

class SettingPageState extends MainScreenState<SettingNotifier> {
  var top = 0.0;
  GlobalKey<FSwitchState> _fswitchKey = GlobalKey<FSwitchState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<bool>(
      future: provider.getData(context, mounted),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: [
              Scaffold(
                  body: Selector<SettingNotifier, bool>(
                selector: (_, provider) => provider.isLoading,
                builder: (context, data, child) => Loading(
                  visible: data,
                  child: NestedScrollView(
                    key: UniqueKey(),
                    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          expandedHeight: 250.0,
                          floating: true,
                          pinned: true,
                          excludeHeaderSemantics: true,
                          backgroundColor: context.bgSliverAppBar,
                          flexibleSpace: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                            top = constraints.biggest.height;
                            return FlexibleSpaceBar(
                              collapseMode: CollapseMode.none,
                              centerTitle: true,
                              titlePadding: EdgeInsets.only(top: 0.0),
                              title: AnimatedOpacity(
                                duration: Duration(milliseconds: 300),
                                opacity: 1.0,
                                child: top <= 56.0 + Utilities().paddingTopSizeHeight
                                    ? Container(
                                        height: 56,
                                        child: titleAppBarCollapse(
                                            context,
                                            provider.authenProfile.employeeInfo.personalInfo.fullName,
                                            provider.authenProfile.employeeInfo.jobInfo.jobtitleName,
                                            50),
                                      )
                                    : Container(),
                              ),
                              background: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    color: context.bgColorAppBarSetting,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 20.0),
                                      child: _buildPicturePreview(
                                        provider.authenProfile.employeeInfo.personalInfo.fullName,
                                        provider.authenProfile.employeeInfo.jobInfo.jobtitleName,
                                        MediaQuery.of(context).size.width / 3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ];
                    },
                    body: ListView(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: buildGroup01(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: buildGroup02(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: buildGroup03(context),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: GestureDetector(
                            onTap: () => {
                              Utilities().showTwoButtonDialog(
                                context,
                                DialogType.QUESTION,
                                null,
                                appLocalizations.confirmNotifyTitle,
                                appLocalizations.confirmNotifySignout,
                                appLocalizations.noTitle,
                                appLocalizations.yesTitle,
                                () {},
                                () {
                                  provider.doSignout(context);
                                },
                              )
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 11),
                                  child: Icon(Icons.logout),
                                ),
                                titleGroup(context, appLocalizations.buttonLogoutText)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
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

  Widget itemSetting(int index, ItemSetting itemSetting, bool isLast) {
    return GestureDetector(
      onTap: () => provider.itemClick(context, itemSetting),
      child: Padding(
        padding: EdgeInsets.only(left: 13, right: 11),
        child: Container(
          decoration: BoxDecoration(
            color: context.bgCard,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          padding: EdgeInsets.only(left: 5, top: 10, bottom: 10, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    itemSetting.icon,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    appLocalizations.translate(itemSetting.title),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleLayout(double size, Widget child) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(360.0) //         <--- border radius here
              ),
          color: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(360.0)),
          child: OverflowBox(
            alignment: Alignment.center,
            child: child,
          ),
        ));
  }

  Widget _buildPicturePreview(String userName, String jobtitleName, double size) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                var isFirst = provider.parent.preferences.getBool(Constants.KEY_FIRST_STORAGE) ?? true;
                if (isFirst) {
                  if (await provider.requestPermission(() {}, true)) {
                    provider.parent.preferences.setBool(Constants.KEY_FIRST_STORAGE, false);
                    provider.getFromGallery(
                      context,
                      _buildAlertPermission(),
                      _buildAlertPermissionGotoSettings(),
                    );
                  } else {
                    var permissionCallBack = PermissionCallBack(() async {
                      provider.getFromGallery(context, _buildAlertPermission(), _buildAlertPermissionGotoSettings());
                    }, () async {
                      await showDialog(
                        context: context,
                        child: _buildAlertPermission(),
                      );
                    }, () async {
                      await showDialog(
                        context: context,
                        child: _buildAlertPermissionGotoSettings(),
                      );
                    });
                    List<PermissionGroup> permissions = List();
                    permissions = Platform.isAndroid == true ? [PermissionGroup.storage] : [PermissionGroup.photos];
                    await Utilities.requestPermission(context, permissions, permissionCallBack, true, true);
                  }
                } else {
                  provider.getFromGallery(
                    context,
                    _buildAlertPermission(),
                    _buildAlertPermissionGotoSettings(),
                  );
                }
              },
              child: Selector<SettingNotifier, String>(
                builder: (context, data, child) {
                  return FutureBuilder<Uint8List>(
                    future: provider.getAvatar(),
                    builder: (_, s) {
                      if (provider.savedAvatar == null) {
                        return _buildCircleLayout(
                            size,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/images/default_avatar.png'),
                              )),
                            ));
                      }
                      try {
                        return CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: Image.memory(provider.savedAvatar).image,
                          radius: size * 0.5,
                        );
                      } catch (_) {
                        return _buildCircleLayout(
                            size,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/images/default_avatar.png'),
                              )),
                            ));
                      }
                    },
                  );
                },
                selector: (buildContext, modelProvider) => modelProvider.valueImage,
              ),
            ),
            Selector<SettingNotifier, String>(
              builder: (context, data, child) {
                return (data == null || data == '')
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(left: 90, top: 110),
                        child: InkWell(
                          onTap: () async {
                            Utilities().showTwoButtonDialog(
                              context,
                              DialogType.QUESTION,
                              null,
                              appLocalizations.confirmNotifyTitle,
                              appLocalizations.deleteAvatar,
                              appLocalizations.noTitle,
                              appLocalizations.yesTitle,
                              () {},
                              () async {
                                provider.doDeleteAvatar(context);
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.bgCard,
                            ),
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            child: Icon(
                              Icons.delete,
                              size: 16,
                              color: Colors.red[300],
                            ),
                          ),
                        ),
                      );
              },
              selector: (buildContext, modelProvider) => modelProvider.valueImage,
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          userName == null ? "" : userName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        if (jobtitleName?.isNotEmpty == true)
          SizedBox(
            height: 5,
          ),
        if (jobtitleName?.isNotEmpty == true)
          AutoSizeText(
            jobtitleName == null ? "" : jobtitleName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        Selector<SettingNotifier, int>(
          builder: (context, data, child) {
            if (provider.countJoinDate > 0) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${appLocalizations.workedFor}",
                    style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 13),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${provider.countJoinDate} ${appLocalizations.day.toLowerCase()}",
                    style: Theme.of(context).textTheme.headline5.copyWith(color: provider.colorJoinDate),
                  ),
                ],
              );
            }
            return Container();
          },
          selector: (context, provider) => provider.countJoinDate,
        )
      ],
    );
  }

  Widget _buildAlertPermission() {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      title: Text(
        appLocalizations.accessLibrary,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      content: Container(
        height: 330,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                appLocalizations.accessImageGalley,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Text(
              appLocalizations.accessImageGalley1,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              appLocalizations.accessImageGalley2,
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                appLocalizations.allowAccess,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                appLocalizations.or,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      appLocalizations.goToSetting,
                      style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  AppImage.checkinPro,
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      appLocalizations.fineIcon,
                      style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Icon(Icons.art_track_outlined),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      appLocalizations.enableLibrary,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    child: RaisedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      color: AppColors.DARK_BLUE_TEXT,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        appLocalizations.btnSkip,
                        style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    child: RaisedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await provider.requestPermission(
                          () {
                            provider.getFromGallery(
                              context,
                              _buildAlertPermission(),
                              _buildAlertPermissionGotoSettings(),
                            );
                          },
                          false,
                        );
                        //   AppSettings.openAppSettings();
                      },
                      color: AppColors.DARK_BLUE_TEXT,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        appLocalizations.allowAccessbnt,
                        style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertPermissionGotoSettings() {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      title: Text(
        appLocalizations.accessLibrary,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      content: Container(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                appLocalizations.accessImageGalley,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Text(
              appLocalizations.accessImageGalley1,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              appLocalizations.accessImageGalley2,
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      appLocalizations.goToSetting,
                      style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  AppImage.checkinPro,
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      appLocalizations.fineIcon,
                      style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Icon(Icons.art_track_outlined),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      appLocalizations.enableLibrary,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    child: RaisedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      color: AppColors.DARK_BLUE_TEXT,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        appLocalizations.btnSkip,
                        style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    child: RaisedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        AppSettings.openAppSettings();
                      },
                      color: AppColors.DARK_BLUE_TEXT,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        appLocalizations.gotoSettingApp,
                        style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleAppBarCollapse(BuildContext context, String userName, String jobtitleName, double size) {
    return Container(
      color: context.bgSliverAppBar,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Selector<SettingNotifier, String>(
            builder: (context, data, child) {
              return FutureBuilder<Uint8List>(
                future: provider.getAvatar(),
                builder: (_, s) {
                  if (provider.savedAvatar == null) {
                    return _buildCircleLayout(
                        size,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/default_avatar.png'),
                          )),
                        ));
                  }
                  try {
                    return CircleAvatar(
                      backgroundColor: context.bgSliverAppBar,
                      backgroundImage: Image.memory(s.data).image,
                      radius: size * 0.5,
                    );
                  } catch (_) {
                    return _buildCircleLayout(
                        size,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/default_avatar.png'),
                          )),
                        ));
                  }
                },
              );
            },
            selector: (buildContext, modelProvider) => modelProvider.valueImage,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              userName == null ? "" : userName,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).appBarTheme.textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }

  Widget item(List<ItemSwitch> items, double widthBox) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            if (items[index].switchType != SwitchType.BIO_DETECT) {
              provider.switchNonAmiItem(context, mounted, items[index]);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: context.bgCard,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            margin: EdgeInsets.only(left: 13, right: 11),
            padding: EdgeInsets.only(left: 5, top: 10, right: 16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    items[index].icon,
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
                      ),
                    ),
                    items[index].switchType == SwitchType.BIO_DETECT
                        ? Selector<SettingNotifier, bool>(
                            builder: (cx, data, child) {
                              return FSwitch(
                                key: _fswitchKey,
                                open: items[index].isSelect,
                                width: 50.0,
                                height: 25.538,
                                childOffset: 3.0,
                                color: Colors.grey,
                                openColor: AppColors.MAIN_TEXT_COLOR,
                                onChanged: (v) {
                                  provider.switchNonAmiItem(
                                    context,
                                    mounted,
                                    items[index]..isSelect = v,
                                    callback: () {
                                      _fswitchKey.currentState.updateState(items[index].isSelect);
                                    },
                                  );
                                },
                                closeChild: Text(
                                  "",
                                  style: TextStyle(
                                      fontFamily: AppTextStyles.tahomaFont, color: Colors.white, fontSize: 11),
                                ),
                                openChild: Text(
                                  "",
                                  style: TextStyle(
                                      fontFamily: AppTextStyles.tahomaFont, color: Colors.white, fontSize: 11),
                                ),
                              );
                            },
                            selector: (cx, provider) => provider.itemSwitchs[index].isSelect)
                        : Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: AppColors.TITLE_APPBAR_COLOR,
                          ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildGroup01(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        titleGroup(context, appLocalizations.titleMyProfile),
        ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (BuildContext context, int indexChild) {
            return Container();
          },
          itemCount: provider.itemAccounts.length,
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int indexChild) {
            return itemSetting(
                indexChild, provider.itemAccounts[indexChild], indexChild == provider.itemAccounts.length - 1);
          },
        ),
      ],
    );
  }

  Widget buildGroup02(BuildContext context) {
    var percentBox = isPortrait ? 80 : 80;
    return Selector<SettingNotifier, bool>(
      builder: (context, data, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 11.0),
              child: titleGroup(context, appLocalizations.settingTitle),
            ),
            item(provider.itemSwitchs, widthScreen * percentBox),
          ],
        );
      },
      selector: (buildContext, modelProvider) => modelProvider.reloadLang,
    );
  }

  Widget buildGroup03(BuildContext context) {
    var percentBox = isPortrait ? 80 : 80;
    return Selector<SettingNotifier, List<ItemAboutApp>>(
      builder: (context, data, child) {
        return Column(
          children: [
            titleGroup(context, "About apps"),
            itemAbout(data, percentBox.toDouble()),
          ],
        );
      },
      selector: (buildContext, modelProvider) => modelProvider.itemAbouts,
    );
  }

  Widget itemAbout(List<ItemAboutApp> items, double widthBox) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => {
            if (index == 2)
              {
                provider.launchURL(),
              }
          },
          child: Container(
            decoration: BoxDecoration(
              color: context.bgCard,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            margin: EdgeInsets.only(left: 13, right: 11),
            child: Padding(
              padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    items[index].title ?? "",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    items[index].info ?? "",
                    style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 10),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget titleGroup(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(left: 13.0, bottom: 11),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline4.copyWith(color: AppColors.TITLE_APPBAR_COLOR),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

const double _kCurveHeight = 35;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(p, Paint()..shader = linearGradient);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
