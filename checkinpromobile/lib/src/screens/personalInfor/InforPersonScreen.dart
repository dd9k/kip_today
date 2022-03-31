import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/screens/DomainPage/DomainNotifier.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomRadioButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/TextFieldCommon.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'InforPersonNotifier.dart';
import 'package:checkinpromobile/src/utilities/UtilityNotifier.dart';
import 'package:flutter/services.dart';

class InforPersonScreen extends MainScreen {
  static const String route_name = '/inforPersonScreen';
  @override
  InforPersonScreenState createState() => InforPersonScreenState();
  @override
  String getNameScreen() {
    return route_name;
  }
}

class InforPersonScreenState<T extends UtilityNotifier>
    extends MainScreenState<InforPersonNotifier> {
  T providerLanguage;
  DomainNotifier language;
  TextEditingController phoneController;
  String langCache;
  bool load = true;
  var isConnection = true;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<InforPersonNotifier>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    provider = Provider.of<InforPersonNotifier>(context, listen: false);
    if (load == true) {
      load = false;
      provider.getAuthenInfo(context);
      provider.getList(context);
    }
    var widthContainer = widthScreen * 90;
    return Selector<InforPersonNotifier, bool>(
        builder: (context, data, child) {
          return Selector<InforPersonNotifier, bool>(
            builder: (context, data, child) {
              return Container(
                color: context.bgSliverAppBar,
                child: SafeArea(
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar: CustomAppBar(
                        context: context,
                        index: -1,
                        provider: provider,
                        callbackLeftChild: () {
                          if (provider.isEdit == true) {
                            Utilities().showTwoButtonDialog(
                              context,
                              DialogType.QUESTION,
                              null,
                              appLocalizations.confirmNotifyTitle,
                              appLocalizations.confirmSaveProFile,
                              appLocalizations.noTitle,
                              appLocalizations.yesTitle,
                              () {
                                AppRouter.popWithArguments(context, arguments: {
                                  "reloadLang" : provider.reloadLang
                                });
                              },
                              () {
                                provider.onClickRight(context);
                              },
                            );
                          } else {
                            AppRouter.popWithArguments(context, arguments: {
                              "reloadLang" : provider.reloadLang
                            });
                          }
                        },
                        childRight: Selector<InforPersonNotifier, bool>(
                          builder: (context, data, child) {
                            return FutureBuilder<bool>(
                                future:
                                    locator<Utilities>().isConnectInternet(),
                                builder: (context, snapshot) {
                                  return snapshot.data == true
                                      ? Container(
                                          width: 50,
                                          height: 100,
                                          alignment: Alignment.centerRight,
                                          child: !data
                                              ? FlareActor(
                                                  'assets/images/pencil_icon_white.flr',
                                                  animation: "Edit Icon",
                                                  fit: BoxFit.cover,
                                                  color: AppColors.BLUE_COLOR,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  sizeFromArtboard: true,
                                                )
                                              : Icon(
                                                  Icons.save_outlined,
                                                ),
                                        )
                                      : SizedBox();
                                });
                          },
                          selector: (cx, provider) => provider.isEdit,
                        )),
                    body: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            children: <Widget>[
                              Selector<InforPersonNotifier, String>(
                                builder: (widget, data, child) {
                                  if (data == null) {
                                    return SizedBox(
                                      height: 10,
                                      width: 0,
                                    );
                                  } else {
                                    return Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, bottom: 20),
                                      child: Text(
                                        data,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    );
                                  }
                                },
                                selector: (buildContext, provider) =>
                                    provider.errorText,
                              ),
                              Selector<InforPersonNotifier, bool>(
                                  builder: (widget, data, child) {
                                    return Container(
                                      width: widthScreen * 100,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: context.bgCard,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                            width: widthContainer,
                                            child: ListView.separated(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                padding: EdgeInsets.zero,
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int indexChild) {
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                      left: 20.0,
                                                      right: 20,
                                                    ),
                                                    height:
                                                        data == true ? 10 : 1,
                                                    color: data == true
                                                        ? null
                                                        : context
                                                            .bgSliverAppBar,
                                                  );
                                                },
                                                itemCount:
                                                    provider.items.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int indexChild) {
                                                  var padding = data == true
                                                      ? EdgeInsets.symmetric(
                                                          vertical: 16.0,
                                                          horizontal: 10.0)
                                                      : EdgeInsets.symmetric(
                                                          vertical: 10.0,
                                                          horizontal: 10.0);
                                                  return Selector<
                                                      InforPersonNotifier,
                                                      bool>(
                                                    builder:
                                                        (context, data, child) {
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: context.bgCard,
                                                        ),
                                                        child: itemSetting(
                                                          indexChild,
                                                          padding,
                                                        ),
                                                      );
                                                    },
                                                    selector: (cxt, provider) =>
                                                        provider.isUpdateLang,
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  selector: (buildContext, provider) =>
                                      provider.isEdit)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            selector: (buildContext, modelProvider) => modelProvider.isLoading,
          );
        },
        selector: (buildContext, modelProvider) => modelProvider.isUpdateLang);
  }

  Widget itemSetting(int index, EdgeInsets padding) {
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 0),
      child: Selector<InforPersonNotifier, bool>(
        builder: (cx, isEdit, child) {
          bool editFiled = isEdit == true && provider.items[index].edit == true;
          switch (provider.items[index].type) {
            case InfoPersonSwitchType.GENDER:
              return Selector<InforPersonNotifier, String>(
                builder: (widget, data, child) {
                  return _buildExpand(
                    context,
                    provider.exController,
                    _expandGenderList(),
                    editFiled,
                    provider.singleValue,
                    provider.items[index].title,
                    null,
                    provider.listController[index],
                    false,
                    provider.listFocus[index],
                    70,
                    provider.listKey[index],
                    padding,
                    () {
                      if (index >= provider.items.length - 1) {
                        provider.utilities.hideKeyBoard(context);
                        return;
                      }
                      provider.items[index].data =
                          provider.listController[index].text;
                      FocusScope.of(context)
                          .requestFocus(provider.listFocus[index + 1]);
                    },
                    () {
                      showGenderPicker();
                    },
                  );
                },
                selector: (buildContext, provider) => provider.singleValue,
              );
            case InfoPersonSwitchType.LANGUAGE:
              return Selector<InforPersonNotifier, String>(
                builder: (widget, data, child) {
                  return _buildExpand(
                    context,
                    provider.exLanguaeController,
                    _expandLanguageList(),
                    editFiled,
                    provider.singlelanguageValue,
                    provider.items[index].title,
                    null,
                    provider.listController[index],
                    false,
                    provider.listFocus[index],
                    70,
                    provider.listKey[index],
                    padding,
                    () {
                      if (index >= provider.items.length - 1) {
                        provider.utilities.hideKeyBoard(context);
                        return;
                      }
                      provider.items[index].data =
                          provider.listController[index].text;
                      FocusScope.of(context)
                          .requestFocus(provider.listFocus[index + 1]);
                    },
                    () {
                      showLanguagePicker();
                    },
                  );
                },
                selector: (buildContext, provider) =>
                    provider.singlelanguageValue,
              );
            case InfoPersonSwitchType.PHONE:
              return _buildTextFiledRow(
                editFiled,
                provider.items[index].data,
                provider.items[index].title,
                null,
                provider.listController[index],
                false,
                provider.listFocus[index],
                70,
                provider.listKey[index],
                1,
                false,
                padding,
                () {
                  if (index >= provider.items.length - 1) {
                    provider.utilities.hideKeyBoard(context);
                    return;
                  }
                  provider.items[index].data =
                      provider.listController[index].text;
                  FocusScope.of(context)
                      .requestFocus(provider.listFocus[index + 1]);
                },
                () {},
              );
            default:
              return _buildTextFiledRow(
                editFiled,
                provider.items[index].data,
                provider.items[index].title,
                null,
                provider.listController[index],
                false,
                provider.listFocus[index],
                70,
                provider.listKey[index],
                1,
                false,
                padding,
                () {
                  if (index >= provider.items.length - 1) {
                    provider.utilities.hideKeyBoard(context);
                    return;
                  }
                  provider.items[index].data =
                      provider.listController[index].text;
                  FocusScope.of(context)
                      .requestFocus(provider.listFocus[index + 1]);
                },
                () {},
              );
          }
        },
        selector: (cx, provider) => provider.isEdit,
      ),
    );
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'VN';

  Widget _buildTextFiledRow(
    bool enable,
    String title,
    String hint,
    String errorText,
    TextEditingController controller,
    bool isPassword,
    FocusNode focusNode,
    int sizeRender,
    Key key,
    int maxLine,
    bool readOnly,
    EdgeInsets padding,
    Function onComplete,
    Function onTap,
  ) {
    controller.text = title.isEmpty ? " " : title;
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2),
        child: TextFieldPersonal(
          ontap: onTap,
          hint: hint,
          isPassword: isPassword,
          controller: controller,
          errorText: errorText,
          focusNode: focusNode,
          onComplete: onComplete,
          enabled: enable,
          border: InputBorder.none,
          maxLines: maxLine,
          readOnly: readOnly,
          fontSize:
              AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
          fontSizeHeader:
              AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
          padding: padding,
          labelColor: AppColors.LIGHT_GREY_TEXT,
          textColor: AppColors.DARK_BLUE_TEXT,
        ),
      ),
    );
  }

  Widget _expandGenderList() {
    return Padding(
        padding: EdgeInsets.only(top: 0, right: 41, left: 2),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.BLUE_COLOR),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: ListView.separated(
              padding: EdgeInsets.zero,
              separatorBuilder: (BuildContext context, int indexChild) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: provider.listGender.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int indexChild) {
                return _itemExpandGender(provider.listGender[indexChild].data);
              }),
        ));
  }

  Widget _expandLanguageList() {
    return Padding(
        padding: EdgeInsets.only(top: 0, right: 41, left: 2),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.BLUE_COLOR),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (BuildContext context, int indexChild) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: provider.language.length,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int indexChild) {
              return _itemExpandLanguage(provider.language[indexChild]);
            },
          ),
        ));
  }

  Widget _itemExpandGender(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomRadioButton(
            description: text,
            value: text,
            groupValue: provider.singleValue,
            onChanged: (value) => setState(
              () => provider.singleValue = value,
            ),
            textStyle: TextStyle(
                fontFamily: AppTextStyles.tahomaFont,
                color: AppColors.BLUE_COLOR,
                fontSize: AdaptiveTextSize()
                    .getadaptiveTextSize(context, multiplier: 1.85)),
          ),
        ],
      ),
    );
  }

  Widget _itemExpandLanguage(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomRadioButton(
            description: text,
            value: text,
            groupValue: provider.singlelanguageValue,
            onChanged: (value) => setState(
              () => provider.singlelanguageValue = value,
            ),
            textStyle: TextStyle(
                fontFamily: AppTextStyles.tahomaFont,
                color: AppColors.BLUE_COLOR,
                fontSize: AdaptiveTextSize()
                    .getadaptiveTextSize(context, multiplier: 1.85)),
          ),
        ],
      ),
    );
  }

  Widget _buildExpand(
      BuildContext context,
      ExpandableController exController,
      Widget expand,
      bool enable,
      String title,
      String hint,
      String errorText,
      TextEditingController controller,
      bool isPassword,
      FocusNode focusNode,
      int sizeRender,
      Key key,
      EdgeInsets padding,
      Function onComplete,
      Function onTap) {
    return Container(
      child: _buildTextFiledRow(
          enable,
          title,
          hint,
          errorText,
          controller,
          isPassword,
          focusNode,
          sizeRender,
          key,
          1,
          true,
          padding,
          onComplete,
          onTap),
    );
  }

  showGenderPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 200,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                    initialItem: provider.singleValue ==
                            AppLocalizations.of(context).male
                        ? 0
                        : provider.singleValue ==
                                AppLocalizations.of(context).female
                            ? 1
                            : 2),
                useMagnifier: true,
                backgroundColor: Colors.white,
                onSelectedItemChanged: (value) {
                  setState(() {
                    provider.singleValue = value == 0
                        ? AppLocalizations.of(context).male
                        : value == 1
                            ? AppLocalizations.of(context).female
                            : AppLocalizations.of(context).other;
                  });
                },
                itemExtent: 35.0,
                children: List<Widget>.generate(
                  provider.listGender.length,
                  (int index) {
                    return Center(
                      child: Text(
                        provider.listGender[index].data,
                        style: TextStyle(
                            color: AppColors.BLUE_COLOR, fontSize: 20),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }

  showLanguagePicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 200,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                    initialItem:
                        provider.singlelanguageValue == provider.VN ? 0 : 1),
                useMagnifier: true,
                backgroundColor: Colors.white,
                onSelectedItemChanged: (value) {
                  setState(() {
                    provider.singlelanguageValue =
                        value == 0 ? provider.VN : provider.US;
                  });
                },
                itemExtent: 35.0,
                children: List<Widget>.generate(provider.language.length,
                    (int index) {
                  return Center(
                    child: Text(
                      provider.language[index],
                      style:
                          TextStyle(color: AppColors.BLUE_COLOR, fontSize: 20),
                    ),
                  );
                }),
              ),
            ),
          );
        });
  }
}
