import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/BranchInfor.dart';
import 'package:checkinpromobile/src/model/EventGuest.dart';
import 'package:checkinpromobile/src/model/VisitorType.dart';
import 'package:checkinpromobile/src/screens/EventDetail/EventDetailScreen.dart';
import 'package:checkinpromobile/src/screens/Line.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/InviteVisitor/InviteVisitorPopupNotifier.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/TextFieldCommon.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InviteVisitorPopupScreen extends MainScreen {
  static const String route_name = '/add-invitation-visitor';

  @override
  _InviteVisitorPopupScreenState createState() =>
      _InviteVisitorPopupScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _InviteVisitorPopupScreenState
    extends MainScreenState<InviteVisitorPopupNotifier> {
  String langSaved = '';
  final CarouselController _controller = CarouselController();
  final GlobalKey<LineAnimationState> _lineAnimationStep1State =
      GlobalKey<LineAnimationState>();
  final GlobalKey<LineAnimationState> _lineAnimationStep2State =
      GlobalKey<LineAnimationState>();
  double progressLineStep1 = 0.0;
  double progressLineStep2 = 0.0;

  final GlobalKey<DropdownSearchState<void>> _dropDownVisitorTypeGlobalState =
      GlobalKey<DropdownSearchState<void>>();

  @override
  void initState() {
    super.initState();
    _getLang();
    final provider =
        Provider.of<InviteVisitorPopupNotifier>(context, listen: false);
    provider.doGetBranches(context);
  }

  void onPageChange(int index, CarouselPageChangedReason changeReason) {}

  Future<void> _getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    langSaved =
        prefs.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
  }

  @override
  Widget build(BuildContext context) {
    locator<SizeConfig>().init(context);
    final provider =
        Provider.of<InviteVisitorPopupNotifier>(context, listen: false);
    provider.getListStep1(context);
    provider.getListStep2(context);
    provider.addItemReviewSection(context);

    List<Widget> items = [
      _buildStepSection1Input(context, provider),
      _buildStepSection2Input(context, provider),
      _buildStepSection3Review(context, provider),
    ];
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        color: context.bgSliverAppBar,
        child: SafeArea(
          top: true,
          bottom: true,
          child: Scaffold(
            appBar: CustomAppBar(
              context: context,
              index: -1,
              provider: provider,
              callbackLeftChild: () {
                if (provider.checkIsDirtyData()) {
                  Utilities().showTwoButtonDialog(
                    context,
                    DialogType.QUESTION,
                    null,
                    appLocalizations.confirmNotifyTitle,
                    appLocalizations.confirmNotifySaveContent,
                    appLocalizations.noTitle,
                    appLocalizations.yesTitle,
                    () {},
                    () {
                      AppRouter.pop(context);
                    },
                  );
                } else {
                  AppRouter.pop(context);
                }
              },
            ),
            body: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Center(
                                    child: _buildStepTimeLine(provider),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  CarouselSlider(
                                    items: items,
                                    options: CarouselOptions(
                                      onPageChanged: onPageChange,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.5,
                                      viewportFraction: 1.0,
                                      // disableCenter: true,
                                      aspectRatio: 2.0,
                                      scrollPhysics:
                                          NeverScrollableScrollPhysics(),
                                      autoPlay: false,
                                    ),
                                    carouselController: _controller,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (provider.stepCount > 1)
                                      _buildBtnPrevious()
                                    else
                                      Container(),
                                    _buildBtnNext()
                                  ],
                                ),
                              ),
                            ])))),
          ),
        ),
      ),
    );
  }

  Widget _buildStepSection1Input(
      BuildContext cx, InviteVisitorPopupNotifier provider) {
    return SingleChildScrollView(
      child: Wrap(children: [
        Center(
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int indexChild) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: provider.itemsStep1.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int indexChild) {
                return Center(
                  child: _buildInputFieldFormStep1(indexChild, provider),
                );
              }),
        ),
      ]),
    );
  }

  Widget _buildStepSection2Input(
      BuildContext cx, InviteVisitorPopupNotifier provider) {
    return SingleChildScrollView(
      child: Wrap(children: [
        Center(
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int indexChild) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: provider.itemsStep2.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int indexChild) {
                return Center(
                  child: _buildInputFieldFormStep2(indexChild, provider),
                );
              }),
        ),
      ]),
    );
  }

  Widget _buildStepSection3Review(
      BuildContext cx, InviteVisitorPopupNotifier provider) {
    locator<SizeConfig>().init(context);
    return SingleChildScrollView(
      child: Wrap(children: [
        Center(
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int indexChild) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: provider.lstInviteVisitorReviewSections.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int indexChild) {
                if (indexChild == 0) {
                  // Block invite information
                  return itemInviteInfoBlockReviewSection(provider, indexChild);
                } else {
                  // Block guests invite
                  return itemGuestsInviteBlockReviewSection(
                      provider, indexChild);
                }
              }),
        ),
      ]),
    );
  }

  Widget itemInviteInfoBlockReviewSection(
      InviteVisitorPopupNotifier provider, int index) {
    final item = provider.lstInviteVisitorReviewSections[index];
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: 5, bottom: 20),
          child: Text(
            item.title,
            style: TextStyle(
              color: AppColors.TEXT_GRAY,
              fontSize: AdaptiveTextSize()
                  .getadaptiveTextSize(context, multiplier: 1.85),
              fontFamily: AppTextStyles.tahomaFont,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 100,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int indexChild) {
                  return SizedBox(height: 20);
                },
                itemCount: item.items.length,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int indexChild) {
                  return itemInviteInfoTextFieldReviewSection(
                      indexChild, provider, item);
                }),
          ),
        )
      ],
    );
  }

  Widget itemInviteInfoTextFieldReviewSection(
      int index,
      InviteVisitorPopupNotifier provider,
      InviteVisitorReviewSection inviteVisitorItem) {
    final topPadding = index <= 0 ? 10.0 : 0.0;
    final bottomPadding =
        index >= inviteVisitorItem.items.length - 1 ? 30.0 : 0.0;
    int maxLines = 1;
    if (inviteVisitorItem.items[index].type == 'notes') {
      maxLines = 3;
    }
    return Padding(
        padding: EdgeInsets.only(
            top: topPadding, left: 0, right: 0, bottom: bottomPadding),
        child: TextFieldCommon(
            maxLines: maxLines,
            controller: null,
            focusNode: AlwaysDisabledFocusNode(),
            initialValue: inviteVisitorItem.listController[index].text,
            errorText: null,
            hint: inviteVisitorItem.items[index].title));
  }

  Widget itemGuestsInviteBlockReviewSection(
      InviteVisitorPopupNotifier provider, int index) {
    final item = provider.lstInviteVisitorReviewSections[index];
    // Add item guest info to list
    provider.eventGuests.clear();
    provider.eventGuests.add(EventGuest.normal(
        item.listController[0].text,
        item.listController[1].text,
        item.listController[2].text,
        null,
        null,
        null,
        item.listController[3].text));
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0, left: 5, bottom: 5),
          child: Text(
            item.title,
            style: TextStyle(
              color: AppColors.TEXT_GRAY,
              fontSize: AdaptiveTextSize()
                  .getadaptiveTextSize(context, multiplier: 1.85),
              fontFamily: AppTextStyles.tahomaFont,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 100,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int indexChild) {
                  return SizedBox(height: 20);
                },
                itemCount: provider.eventGuests.length,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int indexChild) {
                  return itemGuestsListReviewSection(indexChild, provider);
                }),
          ),
        )
      ],
    );
  }

  Widget itemGuestsListReviewSection(
      int index, InviteVisitorPopupNotifier provider) {
    final itemGuest = provider.eventGuests[index];
    return Container(
      padding: EdgeInsets.only(top: 20, right: 5, left: 5, bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              //                   <--- left side
              color: Colors.grey[300],
              width: 1.0,
            ),
          )),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      itemGuest.visitorName,
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, multiplier: 2.0),
                          fontFamily: AppTextStyles.tahomaFont,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.markunread_outlined,
                          //color: AppColors.ICON_COLOR,
                        ),
                        Expanded(
                          flex: 9,
                          child: Padding(
                              padding: EdgeInsets.only(left: 5, top: 0),
                              child: SizedBox(
                                width: 200,
                                child: AutoSizeText(
                                    (itemGuest.visitorEmail == null ||
                                            itemGuest.visitorEmail.isEmpty ==
                                                true)
                                        ? appLocalizations.noneContent
                                        : itemGuest.visitorEmail,
                                    maxLines: 3,
                                    style: TextStyle(
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context,
                                                multiplier: 1.85),
                                        fontFamily: AppTextStyles.tahomaFont,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none)),
                              )),
                        ),
                        Spacer()
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.phone),
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 0),
                          child: Text(
                            (itemGuest.visitorPhoneNumber == null ||
                                    itemGuest.visitorPhoneNumber.isEmpty ==
                                        true)
                                ? appLocalizations.noneContent
                                : itemGuest.visitorPhoneNumber,
                            style: TextStyle(
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context,
                                        multiplier: 1.85),
                                fontFamily: AppTextStyles.tahomaFont,
                                color: Colors.black87,
                                decoration: TextDecoration.none),
                          ),
                        )
                      ],
                    ),
                    if (itemGuest.fromCompany != null &&
                        itemGuest.fromCompany.isNotEmpty)
                      SizedBox(
                        height: 10,
                      ),
                    if (itemGuest.fromCompany != null &&
                        itemGuest.fromCompany.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.apartment_outlined),
                          Padding(
                            padding: EdgeInsets.only(left: 5, top: 0),
                            child: Text(
                              (itemGuest.fromCompany == null ||
                                      itemGuest.fromCompany.isEmpty == true)
                                  ? appLocalizations.noneContent
                                  : itemGuest.fromCompany,
                              style: TextStyle(
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context,
                                          multiplier: 1.85),
                                  fontFamily: AppTextStyles.tahomaFont,
                                  color: Colors.black87,
                                  decoration: TextDecoration.none),
                            ),
                          )
                        ],
                      ),
                  ]),
            ),
          ]),
    );
  }

  Widget _buildStepTimeLine(InviteVisitorPopupNotifier provider) {
    Widget buildCompletedNode() {
      return CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.MAIN_TEXT_COLOR,
        child: Icon(
          Icons.check,
          color: AppColors.WHITE_LESS,
        ),
      );
    }

    Widget buildPendingNode() {
      return CircleAvatar(
        radius: 15,
        backgroundColor: Colors.yellowAccent[700],
        child: Icon(
          Icons.radio_button_checked,
          color: AppColors.WHITE_LESS,
        ),
      );
    }

    Widget buildNotActiveNode() {
      return CircleAvatar(
        radius: 15,
        backgroundColor: Colors.grey[400],
        child: Icon(
          Icons.radio_button_checked,
          color: Colors.white38,
        ),
      );
    }

    return Wrap(
      spacing: 0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Builder(builder: (cx) {
              if (provider.stepCurrentIndex <= 1) {
                return buildPendingNode();
              }
              return buildCompletedNode();
            })),
        Stack(
          children: [
            SizedBox(
                width: 100,
                child: LineAnimation(
                  progress: 1.0,
                  isAnimation: false,
                )),
            SizedBox(
                width: 100,
                child: LineAnimation(
                  key: _lineAnimationStep1State,
                  progress: 0,
                  isAnimation: true,
                  color: AppColors.MAIN_TEXT_COLOR,
                ))
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Builder(builder: (cx) {
              if (provider.stepCurrentIndex < 2) {
                return buildNotActiveNode();
              }
              if (provider.stepCurrentIndex == 2) {
                return buildPendingNode();
              }
              return buildCompletedNode();
            })),
        Stack(
          children: [
            SizedBox(
                width: 100,
                child: LineAnimation(
                  progress: 1.0,
                  isAnimation: false,
                )),
            SizedBox(
                width: 100,
                child: LineAnimation(
                  key: _lineAnimationStep2State,
                  progress: 0,
                  isAnimation: true,
                  color: AppColors.MAIN_TEXT_COLOR,
                ))
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Builder(builder: (cx) {
              if (provider.stepCurrentIndex < 3) {
                return buildNotActiveNode();
              }
              if (provider.stepCurrentIndex == 3) {
                return buildPendingNode();
              }
              return buildCompletedNode();
            })),
      ],
    );
  }

  Widget _buildInputFieldFormStep1(
      int index, InviteVisitorPopupNotifier provider) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Form(
          key: provider.itemsStep1[index].key,
          child: Builder(builder: (cx) {
            if (provider.itemsStep1[index].type == 'dropdown') {
              return _buildDropdownFieldStep1(index, provider);
            }
            if (provider.itemsStep1[index].type == 'notes') {
              return Container(
                  height: 30.0 * 3,
                  child: _buildTextFieldStep1(index, provider, maxLines: 3));
            }
            return _buildTextFieldStep1(index, provider);
          })),
    );
  }

  Widget _buildTextFieldStep1(int index, InviteVisitorPopupNotifier provider,
      {int maxLines = 1}) {
    return FocusScope(
        onFocusChange: (focus) {
          if (focus &&
              provider.itemsStep1[index].title.toLowerCase() ==
                  AppLocalizations.of(context).timeTitle.toLowerCase()) {
            locator<Utilities>().hideKeyBoard(context);
            if (provider.listControllerStep1[index].text.isEmpty) {
              provider.listControllerStep1[index].text = ' ';
            }
            DatePicker.showDateTimePicker(context, showTitleActions: true,
                onConfirm: (date) {
              FocusScope.of(context)
                  .requestFocus(provider.listFocusStep1[index + 1]);
              String formattedDate =
                  DateFormat(Constants.FORMAT_STRING_DATE).format(date);
              provider.listControllerStep1[index].text = formattedDate;
              provider.itemsStep1[index].value = date;
            }, onCancel: () {
              if (provider.listControllerStep1[index].text == ' ') {
                provider.listControllerStep1[index].text = '';
              }
              FocusScope.of(context)
                  .requestFocus(provider.listFocusStep1[index + 1]);
            }, onDismiss: () {
              Future.delayed(Duration(milliseconds: 0)).then((_) {
                if (provider.listControllerStep1[index].text == ' ') {
                  provider.listControllerStep1[index].text = '';
                }
              });
            },
                currentTime: provider.itemsStep1[index].value,
                locale: langSaved == Constants.EN_CODE
                    ? LocaleType.en
                    : LocaleType.vi);
          }
        },
        child: TextFieldCommon(
          controller: provider.listControllerStep1[index],
          validator: provider.itemsStep1[index].validator,
          focusNode: provider.listFocusStep1[index],
          errorText: null,
          maxLines: maxLines,
          hint: provider.itemsStep1[index].title,
          onComplete: () {
            if (index >= provider.itemsStep1.length - 1) {
              locator<Utilities>().hideKeyBoard(context);
            }
            FocusScope.of(context)
                .requestFocus(provider.listFocusStep1[index + 1]);
          },
        ));
  }

  Widget _buildDropdownFieldStep1(
      int index, InviteVisitorPopupNotifier provider) {
    if (provider.itemsStep1[index].title.toLowerCase() ==
        AppLocalizations.of(context).siteTitle.toLowerCase()) {
      return Selector<InviteVisitorPopupNotifier, List<BranchInfor>>(
        builder: (context, data, child) {
          return DropdownSearch<BranchInfor>(
            validator: (v) =>
                v == null ? appLocalizations.enterSiteContent : null,
            mode: Mode.MENU,
            showSelectedItem: true,
            items: data,
            label: provider.itemsStep1[index].title,
            itemAsString: (item) => item.branchName,
            showClearButton: true,
            selectedItem: provider.itemsStep1[index].value,
            onChanged: (item) {
              provider.listControllerStep1[index].text = item.branchName;
              provider.itemsStep1[index].value = item;
              provider.timeZoneOffsetHourForbranch = item.timeZoneOffsetHour;
              provider.doGetVisitorTypeByBranchId(
                  context, item.branchId.toInt().toString());
              _dropDownVisitorTypeGlobalState.currentState.clear();
            },
            compareFn: (BranchInfor i, BranchInfor s) => i.isEqual(s),
            style: TextStyle(
              fontFamily: AppTextStyles.tahomaFont,
              fontSize: AdaptiveTextSize()
                  .getadaptiveTextSize(context, multiplier: 1.85),
            ),
            dropdownSearchDecoration: InputDecoration(
                labelText: provider.itemsStep1[index].title,
                errorText: null,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                fillColor: Colors.transparent,
                labelStyle: TextStyle(
                  color: AppColors.BLUE_COLOR,
                  fontFamily: AppTextStyles.tahomaFont,
                  fontSize: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 1.85),
                ),
                errorStyle: TextStyle(
                  fontFamily: AppTextStyles.tahomaFont,
                  fontSize: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 1.85),
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColors.RED_COLOR,
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.BLUE_COLOR)),
                border: OutlineInputBorder()),
          );
        },
        selector: (cx, provider) => provider.lstBranches,
      );
    }
    return Selector<InviteVisitorPopupNotifier, List<VisitorType>>(
      builder: (context, data, child) {
        return DropdownSearch<VisitorType>(
          key: _dropDownVisitorTypeGlobalState,
          validator: (v) =>
              v == null ? appLocalizations.enterVisitorTypeContent : null,
          mode: Mode.MENU,
          showSelectedItem: true,
          items: data,
          label: provider.itemsStep1[index].title,
          itemAsString: (item) => item.settingName,
          showClearButton: true,
          selectedItem: provider.itemsStep1[index].value,
          onChanged: (item) {
            provider.listControllerStep1[index].text = item.settingName;
            provider.itemsStep1[index].value = item;
          },
          compareFn: (VisitorType i, VisitorType s) => i.isEqual(s),
          style: TextStyle(
            fontFamily: AppTextStyles.tahomaFont,
            fontSize: AdaptiveTextSize()
                .getadaptiveTextSize(context, multiplier: 1.85),
          ),
          dropdownSearchDecoration: InputDecoration(
              labelText: provider.itemsStep1[index].title,
              errorText: null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              fillColor: Colors.transparent,
              labelStyle: TextStyle(
                color: AppColors.BLUE_COLOR,
                fontFamily: AppTextStyles.tahomaFont,
                fontSize: AdaptiveTextSize()
                    .getadaptiveTextSize(context, multiplier: 1.85),
              ),
              errorStyle: TextStyle(
                fontFamily: AppTextStyles.tahomaFont,
                fontSize: AdaptiveTextSize()
                    .getadaptiveTextSize(context, multiplier: 1.85),
              ),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.RED_COLOR,
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.BLUE_COLOR)),
              border: OutlineInputBorder()),
        );
      },
      selector: (cx, provider) => provider.lstVisitorTypes,
    );
  }

  Widget _buildInputFieldFormStep2(
      int index, InviteVisitorPopupNotifier provider) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Form(
          key: provider.itemsStep2[index].key,
          child: FocusScope(
              child: TextFieldCommon(
            controller: provider.listControllerStep2[index],
            validator: provider.itemsStep2[index].validator,
            focusNode: provider.listFocusStep2[index],
            errorText: null,
            hint: provider.itemsStep2[index].title,
            onComplete: () {
              if (index >= provider.itemsStep2.length - 1) {
                locator<Utilities>().hideKeyBoard(context);
              }
              FocusScope.of(context)
                  .requestFocus(provider.listFocusStep2[index + 1]);
            },
          ))),
    );
  }

  Widget _buildBtnPrevious() {
    final provider =
        Provider.of<InviteVisitorPopupNotifier>(context, listen: false);

    return Container(
      // padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      width: MediaQuery.of(context).size.width / 3,
      child: RaisedGradientButton(
        height: 40,
        isLoading: true,
        btnController: provider.btnPrevController,
        disable: provider.isLoading,
        btnText: AppLocalizations.of(context).prevButtonTitle,
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        onPressed: () {
          locator<Utilities>().hideKeyBoard(context);
          setState(() {
            provider.stepCount = provider.stepCount - 1;
            _controller.previousPage();
          });
          provider.btnPrevController.stop();
        },
      ),
    );
  }

  Widget _buildBtnNext() {
    final provider =
        Provider.of<InviteVisitorPopupNotifier>(context, listen: false);
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: RaisedGradientButton(
        height: 40,
        isLoading: true,
        btnController: provider.btnNextController,
        disable: provider.isLoading,
        btnText: provider.stepCount == 3
            ? AppLocalizations.of(context).inviteTitle
            : AppLocalizations.of(context).nextButtonTitle,
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        onPressed: () {
          locator<Utilities>().hideKeyBoard(context);
          // Handle validate input
          if (provider.stepCount == 1) {
            for (var item in provider.itemsStep1) {
              if (!item.key.currentState.validate()) {
                provider.btnNextController.stop();
                return;
              }
            }
          }
          if (provider.stepCount == 2) {
            for (var item in provider.itemsStep2) {
              if (!item.key.currentState.validate()) {
                provider.btnNextController.stop();
                return;
              }
            }
          }
          if (provider.stepCount >= 3) {
            provider.addNewInvistor(context);
            return;
          }
          // Handle animation timeline
          if (provider.stepCount == 1) {
            if (progressLineStep1 == 0.0) {
              progressLineStep1 = 1.0;
              _lineAnimationStep1State.currentState
                  .animated(progressLineStep1, onCompleteAnimation: () {});
            }
          }
          if (provider.stepCount == 2) {
            if (progressLineStep2 == 0.0) {
              progressLineStep2 = 1.0;
              _lineAnimationStep2State.currentState
                  .animated(progressLineStep2, onCompleteAnimation: () {});
            }
          }
          // Update step count
          setState(() {
            provider.stepCount = provider.stepCount + 1;
            // Setup animation
            if (provider.stepCurrentIndex < 3 &&
                provider.stepCount > provider.stepCurrentIndex) {
              provider.stepCurrentIndex = provider.stepCurrentIndex + 1;
            }
            _controller.nextPage();
          });
          provider.btnNextController.stop();
        },
      ),
    );
  }
}
