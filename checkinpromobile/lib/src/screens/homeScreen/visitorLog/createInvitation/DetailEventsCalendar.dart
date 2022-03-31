import 'dart:io';

import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/model/Office.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/IconContainer.dart';
import 'package:checkinpromobile/src/widgetUtilities/TypeHead.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'addPeople/CreateUserScreen.dart';
import 'DropdownField.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'DetailEventsCalendarNotifier.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/model/VisitorType.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'addPeople/CreateUserNotifier.dart';
import 'package:expandable/expandable.dart';
import 'package:checkinpromobile/src/utilities/Validator.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';

class DetailEventsPage extends MainScreen {
  static const String route_name = '/DetailEventsPage';
  InviteNewVisitor inviteOld;
  bool isViewMode;

  DetailEventsPage({this.inviteOld, this.isViewMode});

  @override
  _DetailEventsPageState createState() => _DetailEventsPageState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _DetailEventsPageState extends MainScreenState<DetailEventCalendarNotifier> {
  bool statusAlert = false;
  bool statusEvent = false;
  bool statusItemUser = false;
  TextEditingController controller;
  Map<String, dynamic> formData;
  List<String> branchName = [];
  DateTime now = DateTime.now();

  List<ItemColor> listColor = List();
  GlobalKey<FormState> _formKey = GlobalKey();
  ExpandableController controllerExpand = ExpandableController(initialExpanded: false);
  FocusNode titleNode = FocusNode();
  FocusNode locationNode = FocusNode();
  FocusNode typeNode = FocusNode();
  String locationText = '';
  DetailEventsPage detailEventsPage;
  FocusNode tempFocus = FocusNode();
  bool isOpeningKeyboard = false;
  InviteNewVisitor inviteOld;
  bool isViewMode;

  @override
  void onKeyboardChange(bool visible) {
    isOpeningKeyboard = visible;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInit) {
      isInit = true;
      detailEventsPage = (widget as DetailEventsPage);
      inviteOld = provider.arguments['inviteOld'] as InviteNewVisitor;
      isViewMode = provider.arguments['isViewMode'] as bool;
      detailEventsPage.inviteOld = inviteOld;
      detailEventsPage.isViewMode = isViewMode;
      locationNode.addListener(() {
        if (locationNode.hasFocus) {
          provider.locationController.clear();
        } else {
          var isContain = false;
          for (Office office in provider.lstOffice) {
            if (office?.name?.toLowerCase()?.contains(provider.locationController.text?.toLowerCase()) == true) {
              isContain = true;
              break;
            }
          }
          if (!isContain) {
            provider.locationController.clear();
          }
        }
      });
      typeNode.addListener(() {
        if (typeNode.hasFocus) {
          provider.visitorTypeController.clear();
        } else {
          var isContain = false;
          for (VisitorType visitorType in provider.lstVisitorTypes) {
            if (provider.utilities
                    .getStringByLang(visitorType?.description, provider.langSaved)
                    ?.toLowerCase()
                    ?.contains(provider.visitorTypeController.text?.toLowerCase()) ==
                true) {
              isContain = true;
              break;
            }
          }
          if (!isContain) {
            provider.visitorTypeController.clear();
          }
        }
      });
      provider.isViewMode = isViewMode == true ? true : false;
      if (inviteOld?.guests?.isNotEmpty == true) {
        provider.lstNewVisitor.addAll(inviteOld.guests);
      }
      provider.langSaved = provider.parent.preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
      provider.startDateValue = inviteOld.getStringStartDay(provider.langSaved);

      provider.startTimeValue = inviteOld.getStringStartTime(provider.langSaved);

      provider.endTimeValue = inviteOld.getStringEndTime(provider.langSaved);

      provider.titleController = TextEditingController(text: inviteOld.invitationName);
      provider.locationController = TextEditingController(text: inviteOld.branchName);
      if (inviteOld?.branchId != null) {
        provider.doGetVisitorTypeByBranchId(
          context,
          inviteOld.branchId.toString(),
        );
      }
      provider.branchId = inviteOld.branchId;
      provider.visitorTypeController = TextEditingController(
          text: provider.utilities.getStringByLang(inviteOld.visitorTypeValue, provider.langSaved));
      provider.descriptions = TextEditingController(text: inviteOld.description);
      provider.reminderController = TextEditingController(text: provider.getByValue(inviteOld.valueReminder).title);
      provider.colorController = TextEditingController(text: appLocalizations.blueTitle);
      if (provider.isViewMode && (provider.descriptions?.text?.isNotEmpty != true)) {
        provider.descriptions.text = " ";
      }
      provider.expandedText = appLocalizations.viewMoreTitle;
      listColor
          .add(ItemColor(appLocalizations.blueTitle, provider.utilities.convertColorToString(AppColors.NORMAL_COLOR)));
      listColor.add(
          ItemColor(appLocalizations.yellowTitle, provider.utilities.convertColorToString(AppColors.PRIORITIZE_COLOR)));
      listColor.add(
          ItemColor(appLocalizations.redTitle, provider.utilities.convertColorToString(AppColors.EMERGENCY_COLOR)));
      provider.getAuthenProfile();
    }
  }

  final String formatted = DateFormat.jm().format(DateTime.now());
  bool isInit = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!isOpeningKeyboard) {
            FocusScope.of(context).requestFocus(tempFocus);
          }
        },
        child: Container(
          color: context.bgSliverAppBar,
          padding: EdgeInsets.fromLTRB(0, provider.utilities.paddingTopSizeHeight, 0, 0),
          child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Scaffold(
                appBar: CustomAppBar(
                  index: -1,
                  provider: provider,
                  context: context,
                  isHaveSizeButton: true,
                  childRight: !provider.isViewMode == true
                      ? Wrap(
                          alignment: WrapAlignment.end,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            IconContainer(
                                icon: Icons.save,
                                onTap: () {
                                  FocusScope.of(context).requestFocus(tempFocus);
                                  if (provider.parent.isConnection) {
                                    provider.sendInvitation(InvitationStatus.DRAFT);
                                  } else {
                                    provider.utilities.showOneButtonDialog(context, DialogType.ERROR, null, "",
                                        provider.appLocalizations.noInternet, provider.appLocalizations.btnOk, () {});
                                  }
                                }),
                            IconContainer(
                                icon: Icons.send,
                                onTap: () {
                                  FocusScope.of(context).requestFocus(tempFocus);
                                  if (provider.parent.isConnection) {
                                    provider.sendInvitation(InvitationStatus.SENT);
                                  } else {
                                    provider.utilities.showOneButtonDialog(context, DialogType.ERROR, null, "",
                                        provider.appLocalizations.noInternet, provider.appLocalizations.btnOk, () {});
                                  }
                                }),
                            Container(
                              width: 5,
                            ),
                          ],
                        )
                      : Opacity(
                          opacity: 0,
                          child: Wrap(
                            alignment: WrapAlignment.end,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              IconContainer(icon: Icons.save, onTap: () {}),
                              IconContainer(icon: Icons.send, onTap: () {}),
                              Container(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                  childLeft: Wrap(
                    alignment: WrapAlignment.end,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        width: 5,
                      ),
                      IconContainer(
                          icon: Icons.arrow_back,
                          child: AppImage.backBtn,
                          onTap: () {
                            FocusScope.of(context).requestFocus(tempFocus);
                            if (!provider.isViewMode &&
                                (provider.titleController.text != '' ||
                                    provider.locationController.text != '' ||
                                    provider.descriptions.text != '' ||
                                    provider.visitorTypeController.text != '')) {
                              Utilities().showTwoButtonDialog(
                                context,
                                DialogType.QUESTION,
                                null,
                                appLocalizations.saveThemeContent,
                                appLocalizations.saveThemeContent,
                                appLocalizations.noTitle,
                                appLocalizations.yesTitle,
                                () {
                                  inviteOld.isSent = false;
                                  Navigator.pop(context);
                                },
                                () {
                                  if (provider.parent.isConnection) {
                                    provider.addNewInvite(InvitationStatus.DRAFT);
                                  } else {
                                    provider.utilities.showOneButtonDialog(context, DialogType.ERROR, null, "",
                                        provider.appLocalizations.noInternet, provider.appLocalizations.btnOk, () {});
                                  }
                                },
                              );
                            } else {
                              Navigator.pop(context);
                            }
                          }),
                      Opacity(
                        opacity: 0,
                        child: IconContainer(icon: Icons.send),
                      ),
                    ],
                  ),
                ),
                body: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (locationText != '') {
                      provider.locationController.clear();
                    }
                  },
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                          child: Container(
                            color: context.bgCard,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  _titleWidget(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _buidLocation(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _buidVisitorType(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _buildExpanded(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _buildStartDateTimePicker(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _buildEndDateTimePicker(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  _buildErrorDateTime(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _buildColors(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _buildAlert(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _buildNote(context),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Selector<DetailEventCalendarNotifier, bool>(
                          builder: (cx, data, child) {
                            return Positioned.fill(
                              child: Visibility(
                                visible: data,
                                child: Center(child: CircularProgressIndicator()),
                              ),
                            );
                          },
                          selector: (cx, provider) => provider.isLoading,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ));
  }

  Widget _buildErrorDateTime() {
    return Selector<DetailEventCalendarNotifier, bool>(
      builder: (context, data, child) {
        if (provider.validatorEndTime == false) {
          return Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              appLocalizations.errorFormat,
              style: Theme.of(context).textTheme.headline5.copyWith(color: AppColors.RED_COLOR),
            ),
          );
        } else {
          return SizedBox();
        }
      },
      selector: (cx, provider) => provider.validatorEndTime,
    );
  }

  Row _buildNote(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            enabled: !provider.isViewMode,
            controller: provider.descriptions,
            maxLines: 1,
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontSize: 18.0,
              height: 1.25,
              color: context.bgSwapColor,
            ),
            decoration: InputDecoration(
              icon: AppImage.icDescribeInvitation,
              fillColor: provider.isViewMode ? context.isModeView : context.bgCard,
              filled: true,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: context.isModeViewDisable),
              ),
              labelText: appLocalizations.notesTitle,
              labelStyle: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: provider.isViewMode ? context.isModeViewText : context.bgColorlabelStyle),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpanded() {
    return ExpandableNotifier(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: !provider.isViewMode ? buildListEdit() : buildListView(),
          ),
        ],
      ),
    );
  }

  Widget buildListView() {
    return Container(
      child: InputDecorator(
        decoration: InputDecoration(
          icon: AppImage.icListGuestsInvitation,
          fillColor: context.isModeView,
          filled: true,
          labelText: appLocalizations.listVisitor + '*',
          labelStyle: Theme.of(context).textTheme.headline5.copyWith(color: context.isModeViewText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.isModeViewDisable,
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ItemUserWidget(
                visitor: provider.lstNewVisitor.first,
                langSaved: provider.langSaved,
                invitation: inviteOld,
              ),
            ),
            if (provider.lstNewVisitor.length > 1)
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    builder: (_) {
                      return ChangeNotifierProvider(
                        create: (_) => CreateUserNotifier(),
                        child: _buildListVisitor(),
                      );
                    },
                    context: context,
                    isScrollControlled: true,
                  ).then(
                    (value) {
                      provider.reloadExpand(!controllerExpand.expanded);
                    },
                  );
                },
                child: Text(
                  appLocalizations.viewMoreTitle + '(${provider.lstNewVisitor.length - 1})',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: AppColors.DARK_BLUE_TEXT,
                      ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Column buildListEdit() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ScrollOnExpand(
          scrollOnExpand: true,
          scrollOnCollapse: false,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                ExpandablePanel(
                  tapHeaderToExpand: this.provider.isViewMode,
                  hasIcon: this.provider.isViewMode,
                  controller: controllerExpand..expanded = provider.lstNewVisitor.length > 1 ? false : true,
                  header: GestureDetector(
                    onTap: !provider.isViewMode
                        ? () {
                            showModalBottomSheet<void>(
                              builder: (_) {
                                return ChangeNotifierProvider(
                                  create: (_) => CreateUserNotifier(),
                                  child: CreateUserPage(
                                    lstNewVisitor: provider.lstNewVisitor,
                                    invitation: inviteOld,
                                    isViewMode: provider.isViewMode,
                                  ),
                                );
                              },
                              context: context,
                              isScrollControlled: true,
                              isDismissible: false,
                            ).then((value) {
                              provider.reloadExpand(!controllerExpand.expanded);
                            });
                          }
                        : null,
                    child: TextFormField(
                      enabled: false,
                      textAlign: TextAlign.start,
                      textCapitalization: TextCapitalization.none,
                      style: Theme.of(context).textTheme.bodyText2,
                      decoration: InputDecoration(
                        icon: AppImage.icListGuestsInvitation,
                        contentPadding: EdgeInsets.only(left: 10),
                        labelText: appLocalizations.listVisitor,
                        suffixIcon: provider.isViewMode
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AppImage.icAddInvitation,
                              ),
                        labelStyle: Theme.of(context).textTheme.headline5.copyWith(color: AppColors.TEXT_COLOR_DARK),
                      ),
                    ),
                  ),
                  collapsed: Selector<DetailEventCalendarNotifier, bool>(
                    builder: (context, data, child) {
                      return Container(
                        child: provider.lstNewVisitor.length > 0
                            ? Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                  right: 10,
                                  bottom: 5,
                                ),
                                child: ItemUserWidget(
                                  visitor: provider.lstNewVisitor.first,
                                  langSaved: provider.langSaved,
                                  invitation: inviteOld,
                                  ontap: () {
                                    provider.lstNewVisitor.removeAt(0);
                                    provider.updateExpandedText(!controllerExpand.expanded);
                                    provider.reloadExpand(!controllerExpand.expanded);
                                  },
                                ),
                              )
                            : null,
                      );
                    },
                    selector: (cx, provider) => provider.updateExpand,
                  ),
                  expanded: Selector<DetailEventCalendarNotifier, bool>(
                    builder: (cx, data, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          for (var visitor in provider.lstNewVisitor)
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5,
                                right: 10,
                                bottom: 5,
                              ),
                              child: ItemUserWidget(
                                visitor: visitor,
                                ontap: () {
                                  provider.lstNewVisitor.remove(visitor);
                                  provider.reloadExpand(!controllerExpand.expanded);
                                },
                                langSaved: provider.langSaved,
                                invitation: inviteOld,
                              ),
                            ),
                          if (provider.lstNewVisitor.length > 1 && provider.isViewMode)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  provider.expandedText,
                                  style: Theme.of(context).textTheme.headline5.copyWith(
                                        color: AppColors.DARK_BLUE_TEXT,
                                      ),
                                ),
                              ),
                            )
                        ],
                      );
                    },
                    selector: (cx, provider) => provider.updateExpand,
                  ),
                  builder: (_, collapsed, expanded) {
                    return Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: ExpandableThemeData(
                        crossFadePoint: 0,
                        tapHeaderToExpand: provider.isViewMode,
                        hasIcon: provider.isViewMode,
                      ),
                    );
                  },
                ),
                Selector<DetailEventCalendarNotifier, bool>(
                  builder: (context, data, child) {
                    if (provider.lstNewVisitor.length > 1) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: GestureDetector(
                          onTap: () {
                            controllerExpand..expanded = !controllerExpand.expanded;
                            provider.updateExpandedText(!controllerExpand.expanded);
                          },
                          child: Selector<DetailEventCalendarNotifier, String>(
                            builder: (context, data, child) {
                              return Text(
                                data,
                                style: Theme.of(context).textTheme.headline5.copyWith(color: AppColors.DARK_BLUE_TEXT),
                              );
                            },
                            selector: (cx, provider) => provider.expandedText,
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                  selector: (cx, provider) => provider.updateExpand,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Selector<DetailEventCalendarNotifier, bool>(
            builder: (context, data, child) {
              if (provider.validator == false) {
                if (provider.lstNewVisitor.length == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      appLocalizations.listVisitorEmpty,
                      style: Theme.of(context).textTheme.headline5.copyWith(color: AppColors.RED_COLOR),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              } else {
                return SizedBox();
              }
            },
            selector: (cx, provider) => provider.validator)
      ],
    );
  }

  Widget _buildListVisitor() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                appLocalizations.listVisitor.toUpperCase(),
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            for (var visitor in provider.lstNewVisitor)
              Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  right: 10,
                  bottom: 5,
                ),
                child: ItemUserWidget(
                  visitor: visitor,
                  langSaved: provider.langSaved,
                  invitation: inviteOld,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildColors() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: TypeAheadField<ItemColor>(
        hideSuggestionsOnKeyboardHide: false,
        noItemsFoundBuilder: (context) => Container(),
        getImmediateSuggestions: true,
        hideOnLoading: true,
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.bgColorlabelStyle,
              width: 1,
            ),
          ),
          constraints: BoxConstraints(
            maxHeight: SizeConfig.safeBlockVertical * 40,
          ),
        ),
        textFieldConfiguration: TextFieldConfiguration(
          enabled: !provider.isViewMode,
          decoration: InputDecoration(
            icon: Selector<DetailEventCalendarNotifier, String>(
              builder: (context, data, child) {
                return Icon(
                  Icons.circle,
                  size: 26,
                  color: provider.utilities.convertStringToColor(data),
                );
              },
              selector: (cx, provider) => provider.stringColor,
            ),
            fillColor: provider.isViewMode ? context.isModeView : context.bgCard,
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: context.isModeViewDisable),
            ),
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              size: AdaptiveTextSize().getadaptiveTextSize(
                context,
                multiplier: 3.0,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 5.0,
            ),
            labelText: appLocalizations.prioritylevel,
            hintStyle: TextStyle(),
            labelStyle: Theme.of(context).textTheme.headline5.copyWith(
                  color: provider.isViewMode ? context.isModeViewText : context.bgColorlabelStyle,
                ),
          ),
          readOnly: true,
          showCursor: false,
          onTap: () {},
          onSubmitted: (_) async {},
          controller: provider.colorController,
          style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 14),
        ),
        suggestionsCallback: (String pattern) {
          return listColor;
        },
        transitionBuilder: (context, suggestionsBox, controller) {
          return suggestionsBox;
        },
        itemBuilder: (context, ItemColor suggestion) {
          return TextFormField(
            textAlign: TextAlign.start,
            textCapitalization: TextCapitalization.none,
            style: Theme.of(context).textTheme.bodyText2,
            enabled: false,
            controller: TextEditingController()..text = suggestion?.title,
            decoration: InputDecoration(
              icon: Icon(
                Icons.circle,
                size: 26,
                color: provider.utilities.convertStringToColor(suggestion?.stringColor),
              ),
              contentPadding: EdgeInsets.only(left: 5),
            ),
          );
        },
        onSuggestionSelected: (ItemColor suggestion) async {
          provider.colorController.text = suggestion.title;
          provider.updateColor(suggestion.stringColor, suggestion.title);
        },
      ),
    );
  }

  Widget _buildAlert() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: TypeAheadField<ItemReminder>(
        hideSuggestionsOnKeyboardHide: false,
        noItemsFoundBuilder: (context) => Container(),
        getImmediateSuggestions: true,
        hideOnLoading: true,
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.bgColorlabelStyle,
              width: 1,
            ),
          ),
          constraints: BoxConstraints(
            maxHeight: SizeConfig.safeBlockVertical * 40,
          ),
        ),
        textFieldConfiguration: TextFieldConfiguration(
          enabled: !provider.isViewMode,
          decoration: InputDecoration(
            icon: AppImage.icAlertInvitation,
            fillColor: provider.isViewMode ? context.isModeView : context.bgCard,
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: context.isModeViewDisable),
            ),
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              size: AdaptiveTextSize().getadaptiveTextSize(
                context,
                multiplier: 3.0,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            labelText: appLocalizations.reminderTitle,
            hintStyle: TextStyle(),
            labelStyle: Theme.of(context).textTheme.headline5.copyWith(
                  color: provider.isViewMode ? context.isModeViewText : context.bgColorlabelStyle,
                ),
          ),
          readOnly: true,
          showCursor: false,
          onTap: () {},
          onSubmitted: (_) async {},
          controller: provider.reminderController..text,
          style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 14),
        ),
        suggestionsCallback: (String pattern) {
          return [
            ItemReminder(appLocalizations.noTitle, null),
            ItemReminder(appLocalizations.reminder5, 300000),
            ItemReminder(appLocalizations.reminder15, 900000),
            ItemReminder(appLocalizations.reminder30, 1800000),
          ];
        },
        transitionBuilder: (context, suggestionsBox, controller) {
          return suggestionsBox;
        },
        itemBuilder: (context, ItemReminder suggestion) {
          return TextFormField(
            textAlign: TextAlign.start,
            textCapitalization: TextCapitalization.none,
            style: Theme.of(context).textTheme.bodyText2,
            enabled: false,
            controller: TextEditingController()..text = suggestion?.title,
            decoration: InputDecoration(
              icon: AppImage.icAlertInvitation,
              contentPadding: EdgeInsets.only(left: 5),
            ),
          );
        },
        onSuggestionSelected: (ItemReminder suggestion) async {
          if (suggestion.milliseconds != null && Platform.isAndroid) {
            if (await Constants.REMINDER_CHANNEL.invokeMethod(Constants.ACTION_REMINDER_CHECK)) {
              provider.reminderController.text = suggestion.title;
              provider.valueReminder = suggestion.milliseconds;
            } else {
              Utilities().showTwoButtonDialog(
                context,
                DialogType.WARNING,
                null,
                '',
                appLocalizations.dialogReminderCheck,
                appLocalizations.btnSkip,
                appLocalizations.btnOk,
                () {},
                () async {
                  await Constants.REMINDER_CHANNEL.invokeMethod(Constants.ACTION_REMINDER_GRANT);
                },
              );
            }
          } else {
            provider.reminderController.text = suggestion.title;
            provider.valueReminder = suggestion.milliseconds;
          }
        },
      ),
    );
  }

  Widget _buildStartDateTimePicker() {
    return Container(
      height: 50,
      child: DateTimePicker(
        selectableDayPredicate: (DateTime val) {
          DateTime now = DateTime.now();
          var removeTimeDate = DateTime(val.year, val.month, val.day);
          var removeTimeDateNow = DateTime(now.year, now.month, now.day);
          return removeTimeDate.compareTo(removeTimeDateNow) >= 0;
        },
        enabled: !provider.isViewMode,
        initialValue: provider.startDateValue,
        type: DateTimePickerType.date,
        locale: Locale(provider.langSaved),
        dateMask: Constants.FORMAT_DAY_BASIC,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        style: TextStyle(
          fontSize: 18.0,
          height: 1.25,
          color: context.bgSwapColor,
        ),
        decoration: InputDecoration(
          icon: AppImage.icDateInvitation,

          fillColor: provider.isViewMode ? context.isModeView : context.bgCard,
          filled: true,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: context.isModeViewDisable),
          ),
          labelText: appLocalizations.joinDate,
          errorMaxLines: 2,
          contentPadding: EdgeInsets.only(left: 10),
          //border: InputBorder.none,
          hintStyle: TextStyle(
            color: context.bgSwapColor,
            fontSize: 16,
          ),
          labelStyle: Theme.of(context).textTheme.headline5.copyWith(
                color: provider.isViewMode ? context.isModeViewText : context.bgColorlabelStyle,
              ),
          errorStyle: TextStyle(
            fontFamily: AppTextStyles.helveticaFontLight,
            fontSize: AdaptiveTextSize().getadaptiveTextSize(
              context,
              multiplier: 1.6,
            ),
          ),
        ),
        onChanged: (val) {
          provider.startDateValue = val;
        },
      ),
    );
  }

  Widget _buildEndDateTimePicker() {
    return Selector<DetailEventCalendarNotifier, String>(
      builder: (context, data, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    child: DateTimePicker(
                      initialEntryMode: DatePickerEntryMode.input,
                      validator: Validator(context).validateTitle,
                      enabled: !provider.isViewMode,
                      type: DateTimePickerType.time,
                      initialValue: provider.startTimeValue,
                      locale: Locale(provider.langSaved),
                      style: TextStyle(
                        fontSize: 18.0,
                        height: 1.25,
                        color: context.bgSwapColor,
                      ),
                      decoration: InputDecoration(
                        icon: AppImage.icStartTimeInvitation,
                        fillColor: provider.isViewMode ? context.isModeView : context.bgCard,
                        filled: true,
                        labelText: appLocalizations.startTime,
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: context.isModeViewDisable),
                        ),
                        errorMaxLines: 2,
                        contentPadding: EdgeInsets.only(left: 10),
                        //border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: context.bgSwapColor,
                          fontSize: 16,
                        ),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: provider.isViewMode ? context.isModeViewText : context.bgColorlabelStyle),
                        errorStyle: TextStyle(
                          fontFamily: AppTextStyles.helveticaFontLight,
                          fontSize: AdaptiveTextSize().getadaptiveTextSize(
                            context,
                            multiplier: 1.6,
                          ),
                        ),
                      ),
                      onChanged: (val) {
                        provider.startTimeValue = val;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    child: DateTimePicker(
                      initialEntryMode: DatePickerEntryMode.input,
                      enabled: !provider.isViewMode,
                      type: DateTimePickerType.time,
                      locale: Locale(provider.langSaved),
                      initialValue: provider.endTimeValue,
                      style: TextStyle(
                        fontSize: 18.0,
                        height: 1.25,
                        color: context.bgSwapColor,
                      ),
                      decoration: InputDecoration(
                        icon: AppImage.icStartTimeInvitation,
                        fillColor: provider.isViewMode ? context.isModeView : context.bgCard,
                        filled: true,
                        labelText: appLocalizations.endTime,
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: context.isModeViewDisable),
                        ),
                        errorMaxLines: 2,
                        contentPadding: EdgeInsets.only(left: 10),
                        //border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: context.bgSwapColor,
                          fontSize: 16,
                        ),

                        labelStyle: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: provider.isViewMode ? context.isModeViewText : context.bgColorlabelStyle),
                        errorStyle: TextStyle(
                          fontFamily: AppTextStyles.helveticaFontLight,
                          fontSize: AdaptiveTextSize().getadaptiveTextSize(
                            context,
                            multiplier: 1.6,
                          ),
                        ),
                      ),
                      onChanged: (val) {
                        provider.endTimeValue = val;
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
      selector: (cx, provider) => provider.errorTime,
    );
  }

  Widget _buidVisitorType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Selector<DetailEventCalendarNotifier, List<VisitorType>>(
            builder: (context, data, child) {
              return Form(
                key: provider.visitorTypeKey,
                child: DropDownField(
                  focusNode: typeNode,
                  enabled: !provider.isViewMode,
                  validator: Validator(context).validateVisitorType,
                  controller: provider.visitorTypeController,
                  onComplete: () {
                    FocusScope.of(context).requestFocus(tempFocus);
                  },
                  onValueChanged: (value) {
                    provider.visitorTypeSelected = value;
                    provider.visitorTypeKey.currentState.validate();
                    FocusScope.of(context).requestFocus(tempFocus);
                    if (provider.lstNewVisitor.isEmpty) {
                      showModalBottomSheet<void>(
                              builder: (_) {
                                return ChangeNotifierProvider(
                                  create: (_) => CreateUserNotifier(),
                                  child: CreateUserPage(
                                    lstNewVisitor: provider.lstNewVisitor,
                                    invitation: inviteOld,
                                    isViewMode: provider.isViewMode,
                                  ),
                                );
                              },
                              context: context,
                              isScrollControlled: true)
                          .then((value) {
                        provider.reloadExpand(!controllerExpand.expanded);
                      });
                    }
                  },
                  textStyle: Theme.of(context).textTheme.headline5,
                  items: provider.lstVisitorTypes,
                  itemValues: provider.lstVisitorValues,
                  effectiveDecoration: InputDecoration(
                    icon: AppImage.icGuestsInvitation,
                    fillColor: provider.isViewMode ? context.isModeView : context.bgCard,
                    filled: true,
                    errorMaxLines: 2,
                    contentPadding: EdgeInsets.only(left: 10),
                    hintStyle: Theme.of(context).textTheme.headline5.copyWith(color: AppColors.TEXT_COLOR_DARK),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: provider.isViewMode ? context.isModeViewText : context.bgColorlabelStyle),
                    labelText: appLocalizations.visitorType + '*',
                  ),
                ),
              );
            },
            selector: (cx, provider) => provider.lstVisitorTypes),
        if (typeNode.hasFocus == true && provider.locationController.text == '')
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text(
              appLocalizations.notSelectLocation,
              style: Theme.of(context).textTheme.headline5.copyWith(color: AppColors.RED_COLOR),
            ),
          )
      ],
    );
  }

  Widget _buidLocation() {
    return Form(
      key: provider.sitesKey,
      child: DropDownField(
        itemsVisibleInDropdown: provider.lstOffice.length > 3 ? 3 : provider.lstOffice.length,
        focusNode: locationNode,
        enabled: !provider.isViewMode,
        validator: Validator(context).validateSites,
        controller: provider.locationController,
        textStyle: Theme.of(context).textTheme.headline5,
        items: provider.lstOffice,
        onChange: (string) {
          locationText = string;
        },
        onComplete: () {
          FocusScope.of(context).requestFocus(typeNode);
        },
        onValueChanged: (value) {
          provider.sitesKey.currentState.validate();
          provider.timeZoneOffsetHourForBranch = value.timeZoneOffsetHour ?? 7;
          provider.officeSelected = value;

          provider.doGetVisitorTypeByBranchId(
            context,
            value.id.toString(),
          );
          FocusScope.of(context).requestFocus(typeNode);
        },
        itemValues: provider.lstBrancheValues,
        effectiveDecoration: InputDecoration(
          icon: AppImage.icLocationInvitation,
          fillColor: provider.isViewMode ? context.isModeView : context.bgCard,
          filled: true,
          errorMaxLines: 2,
          contentPadding: EdgeInsets.only(left: 10),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: context.isModeViewDisable),
          ),
          labelStyle: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: provider.isViewMode ? context.isModeViewText : context.bgColorlabelStyle),
          labelText: appLocalizations.siteTitle + '*',
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Form(
      key: provider.titleKey,
      child: TextFormField(
        focusNode: titleNode,
        enabled: !provider.isViewMode,
        validator: Validator(context).validateTitle,
        textAlign: TextAlign.start,
        textCapitalization: TextCapitalization.none,
        controller: provider.titleController,
        style: Theme.of(context).textTheme.bodyText2,
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(locationNode);
        },
        onChanged: (value) {
          provider.titleKey.currentState.validate();
        },
        decoration: InputDecoration(
          icon: AppImage.icEditInvitation,
          fillColor: provider.isViewMode ? context.isModeView : context.bgCard,
          filled: true,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: context.isModeViewDisable),
          ),
          labelText: appLocalizations.subjectTitle + '*',
          errorMaxLines: 2,
          contentPadding: EdgeInsets.only(left: 10),
          labelStyle: Theme.of(context).textTheme.headline5.copyWith(
                color: provider.isViewMode ? context.isModeViewText : context.bgColorlabelStyle,
              ),
          errorStyle: TextStyle(
            fontFamily: AppTextStyles.helveticaFontLight,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class ItemColor {
  String title;
  String stringColor;

  ItemColor(this.title, this.stringColor);
}

class ItemReminder {
  String title;
  int milliseconds;

  ItemReminder(this.title, this.milliseconds);
}
