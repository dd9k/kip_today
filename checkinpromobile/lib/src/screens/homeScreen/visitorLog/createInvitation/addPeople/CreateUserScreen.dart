import 'dart:typed_data';

import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/model/DetailVisitorLog.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/screens/DetailInviteVisitorLog/DetailInviteVisitorLogNotifier.dart';
import 'package:checkinpromobile/src/screens/DetailInviteVisitorLog/DetailInviteVisitorLogScreen.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AvatarWithName.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/TypeHead.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/utilities/Validator.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'CreateUserNotifier.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:provider/provider.dart';
import 'package:checkinpromobile/src/model/NewVisitor.dart';
import 'package:flutter/cupertino.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/IconContainer.dart';
import 'package:flutter/services.dart';

class CreateUserPage extends MainScreen {
  List<NewVisitor> lstNewVisitor = List();
  InviteNewVisitor invitation;
  bool isViewMode = true;
  CreateUserPage({this.lstNewVisitor, this.invitation, this.isViewMode});

  @override
  _CreateUserPageState createState() => _CreateUserPageState();

  @override
  String getNameScreen() {
    return "CreateUserPage";
  }
}

class _CreateUserPageState extends MainScreenState<CreateUserNotifier> {
  RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerCompany = TextEditingController();

  String visitorAvatarFileName;
  bool hasFuture = false;
  GlobalKey<FormState> _emailKey = GlobalKey();
  GlobalKey<FormState> _phoneKey = GlobalKey();

  FocusNode emailNode = FocusNode();
  FocusNode nameNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode companyNode = FocusNode();
  FocusNode tempFocus = FocusNode();

  List<NewVisitor> get _lstNewVisitor =>
      (widget as CreateUserPage).lstNewVisitor;

  InviteNewVisitor get _invitation => (widget as CreateUserPage).invitation;

  bool get _isViewMode => (widget as CreateUserPage).isViewMode;

  String _langSaved;

  bool isInit = false;
  bool isOpeningKeyboard = false;

  @override
  void onKeyboardChange(bool visible) {
    isOpeningKeyboard = visible;
  }

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      isInit = true;
      _langSaved =
          provider.parent.preferences.getString(Constants.KEY_LANGUAGE) ??
              Constants.LANG_DEFAULT;
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(tempFocus);
      },
      child: Container(
        color: context.bgSliverAppBar,
        padding: EdgeInsets.fromLTRB(
            0, provider.utilities.paddingTopSizeHeight, 0, 0),
        child: Scaffold(
          appBar: CustomAppBar(
              index: -1,
              provider: provider,
              context: context,
              childLeft: SizedBox(),
              childRight: IconContainer(icon: Icons.save)),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                color: context.bgCard,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Selector<CreateUserNotifier, String>(
                        builder: (context, errorName, child) {
                          return TypeAheadField<NewVisitor>(
                            hideSuggestionsOnKeyboardHide: false,
                            noItemsFoundBuilder: (context) => Container(),
                            getImmediateSuggestions: true,
                            hideOnLoading: true,
                            hideOnEmpty: true,
                            hideOnError: true,
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
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 10.0),
                                labelText: appLocalizations.fullname + '*',
                                //hintStyle: TextStyle(),
                                errorText: errorName,
                                labelStyle: TextStyle(
                                  fontFamily: AppTextStyles.helveticaFontLight,
                                  color: AppColors.TEXT_COLOR_DARK,
                                  fontSize: 14,
                                ),
                                errorStyle: TextStyle(
                                  fontFamily: AppTextStyles.helveticaFontLight,
                                  fontSize: 14,
                                ),
                              ),
                              readOnly: false,
                              showCursor: true,
                              onTap: () {},
                              onEditingComplete: () {
                                provider.validateName(controllerName.text);
                                FocusScope.of(context).requestFocus(emailNode);
                              },
                              focusNode: nameNode,
                              onSubmitted: (_) async {},
                              controller: controllerName,
                              onChanged: (text) {
                                provider.validateName(controllerName.text);
                              },
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontSize: 14),
                            ),
                            suggestionsCallback: (String pattern) {
                              provider.resetInviteData();
                              if (pattern?.isNotEmpty == true &&
                                  pattern.length > 1) {
                                return provider.getHint(pattern);
                              }
                              return null;
                            },
                            transitionBuilder:
                                (context, suggestionsBox, controller) {
                              return suggestionsBox;
                            },
                            itemBuilder: (context, NewVisitor suggestion) {
                              return suggestion?.visitorName != null
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                        top: 10,
                                        bottom: 5,
                                        right: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          FutureBuilder<Uint8List>(
                                            future: Utilities().getSavedNetworkImage(
                                                suggestion.visitorAvatarFileName,
                                                suggestion.visitorName + suggestion.visitorEmail,
                                                Provider.of<Database>(context, listen: false)),
                                            builder: (_, s) {
                                              if (!s.hasData ||
                                                  s.data == null) {
                                                return AvatarWithName(
                                                    fullName:
                                                        suggestion.visitorName,
                                                    size: 43);
                                              }
                                              try {
                                                return Container(
                                                  height: 43,
                                                  width: 43,
                                                  child: CircleAvatar(
                                                    radius: 360.0,
                                                    backgroundImage:
                                                        Image.memory(s.data)
                                                            .image,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                  ),
                                                );
                                              } catch (_) {
                                                return AvatarWithName(
                                                    fullName:
                                                        suggestion.visitorName,
                                                    size: 43);
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                suggestion?.visitorName,
                                                style: TextStyle(
                                                  fontFamily: AppTextStyles
                                                      .helveticaFontLight,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: AdaptiveTextSize()
                                                      .getadaptiveTextSize(
                                                          context),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                suggestion?.visitorEmail,
                                                style: TextStyle(
                                                  fontFamily: AppTextStyles
                                                      .helveticaFontLight,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: AdaptiveTextSize()
                                                      .getadaptiveTextSize(
                                                          context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container();
                            },
                            onSuggestionSelected:
                                (NewVisitor suggestion) async {
                              controllerName.text = suggestion.visitorName;
                              controllerEmail.text = suggestion.visitorEmail;
                              visitorAvatarFileName =
                                  suggestion.visitorAvatarFileName;
                              controllerCompany.text =
                                  suggestion.visitorCompany;
                              controllerPhone.text =
                                  suggestion.visitorPhoneNumber;
                            },
                          );
                        },
                        selector: (context, provider) => provider.errorName,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Form(
                        key: _emailKey,
                        child: TextFormField(
                          focusNode: emailNode,
                          validator: Validator(context).validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(200),
                          ],
                          onEditingComplete: () {
                            _emailKey.currentState.validate();
                            FocusScope.of(context).requestFocus(phoneNode);
                          },
                          onChanged: (value) {
                            _emailKey.currentState.validate();
                          },
                          style: Theme.of(context).textTheme.bodyText2,
                          controller: controllerEmail,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            labelText: appLocalizations.email + '*',
                            labelStyle: TextStyle(
                              fontFamily: AppTextStyles.helveticaFontLight,
                              color: AppColors.TEXT_COLOR_DARK,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Form(
                        key: _phoneKey,
                        child: TextFormField(
                          focusNode: phoneNode,
                          validator: Validator(context).phoneNumberValidator,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(200),
                          ],
                          onEditingComplete: () {
                            if (controllerPhone.text?.isNotEmpty == true) {
                              _phoneKey.currentState.validate();
                            }
                            FocusScope.of(context).requestFocus(companyNode);
                          },
                          onChanged: (value) {
                          },
                          style: Theme.of(context).textTheme.bodyText2,
                          controller: controllerPhone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            labelText: appLocalizations.numberphone,
                            labelStyle: TextStyle(
                              fontFamily: AppTextStyles.helveticaFontLight,
                              color: AppColors.TEXT_COLOR_DARK,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: TextFormField(
                        focusNode: companyNode,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(200),
                        ],
                        onEditingComplete: () {
                          if (provider.addItemToList(
                            controllerName.text,
                            controllerEmail.text,
                            visitorAvatarFileName,
                            controllerPhone.text,
                            controllerCompany.text,
                            _lstNewVisitor,
                            _emailKey,
                            _phoneKey,
                          )) {
                            controllerName.text = "";
                            controllerEmail.text = "";
                            controllerPhone.text = "";
                            controllerCompany.text = "";
                            FocusScope.of(context).requestFocus(nameNode);
                          }
                        },
                        style: Theme.of(context).textTheme.bodyText2,
                        controller: controllerCompany,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          labelText: appLocalizations.company,
                          labelStyle: TextStyle(
                            fontFamily: AppTextStyles.helveticaFontLight,
                            color: AppColors.TEXT_COLOR_DARK,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Selector<CreateUserNotifier, bool>(
                      builder: (context, data, child) {
                        return data == true
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                child: Text(
                                  appLocalizations.duplicateVisitor,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(color: Colors.red),
                                ),
                              )
                            : SizedBox();
                      },
                      selector: (cx, provider) => provider.duplicate,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: _buildBtnSave(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        height: 1,
                        width: SizeConfig.safeBlockHorizontal * 40,
                        color: Colors.grey,
                      ),
                    ),
                    Selector<CreateUserNotifier, int>(
                      builder: (context, data, child) {
                        if (data != null) {
                          return Container(
                            height: 350,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              itemCount: _lstNewVisitor.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ItemUserWidget(
                                  isViewMode: _isViewMode,
                                  visitor: _lstNewVisitor[index],
                                  onBodyTap: (visitor) {
                                    controllerName.text = visitor.visitorName;
                                    controllerPhone.text = visitor.visitorPhoneNumber;
                                    controllerEmail.text = visitor.visitorEmail;
                                    controllerCompany.text = visitor.visitorCompany;
                                  },
                                  ontap: () {
                                    provider.removePeople(
                                        _lstNewVisitor, index);
                                  },
                                  invitation: _invitation,
                                  langSaved: _langSaved,
                                );
                              },
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                      selector: (cx, provider) => _lstNewVisitor.length,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBtnSave() {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 35),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppColors.linearGradientAppMain,
          borderRadius: BorderRadius.circular(5),
        ),
        child: RaisedGradientButton(
          disable: false,
          isLoading: false,
          btnText: appLocalizations.addContentButton,
          onPressed: () {
            if (provider.addItemToList(
              controllerName.text,
              controllerEmail.text,
              visitorAvatarFileName,
              controllerPhone.text,
              controllerCompany.text,
              _lstNewVisitor,
              _emailKey,
              _phoneKey,
            )) {
              controllerName.text = "";
              controllerEmail.text = "";
              controllerPhone.text = "";
              controllerCompany.text = "";
              FocusScope.of(context).requestFocus(nameNode);
            }
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemUserWidget extends StatelessWidget {
  Function ontap;
  Function(NewVisitor) onBodyTap;
  NewVisitor visitor;
  InviteNewVisitor invitation;
  String langSaved;
  bool isViewMode = true;

  ItemUserWidget({this.visitor, this.ontap, this.onBodyTap, this.invitation, this.langSaved, this.isViewMode});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isViewMode != false || onBodyTap == null) {
          DetailVisitorLog detailVisitorLog = DetailVisitorLog(
              fullname: visitor.visitorName,
              emailAddress: visitor.visitorEmail,
              numberPhone: visitor.visitorPhoneNumber,
              company: visitor.visitorCompany,
              branchName: invitation.branchName,
              branchAddress: invitation.branchAddress,
              inviteCode: visitor.inviteCode,
              startDate: invitation.startDate);
          // Show bottom sheet
          showModalBottomSheet<void>(
              builder: (_) {
                return ChangeNotifierProvider(
                  create: (_) => DetailInviteVisitorLogNotifier(),
                  child: DetailInviteVisitorLogScreen(
                    detailVisitorLog: detailVisitorLog,
                    visitorTypeName: Utilities()
                        .getStringByLang(invitation.visitorTypeValue, langSaved),
                    eInviteDetailVisitorLog:
                    E_INVITE_DETAIL_VISITOR_LOG.INVITATION,
                  ),
                );
              },
              context: context,
              isScrollControlled: true);
        } else {
          onBodyTap(visitor);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5),
        child: Card(
          elevation: 0,
          color: context.bgCard,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                FutureBuilder<Uint8List>(
                  future: Utilities().getSavedNetworkImage(
                      visitor.visitorAvatarFileName,
                      visitor.visitorName + visitor.visitorEmail,
                      Provider.of<Database>(context, listen: false)),
                  builder: (_, s) {
                    if (!s.hasData) {
                      return AvatarWithName(
                          fullName: visitor.visitorName, size: 43);
                    }
                    try {
                      return Container(
                        height: 43,
                        width: 43,
                        child: CircleAvatar(
                          radius: 360.0,
                          backgroundImage: Image.memory(s.data).image,
                          backgroundColor: Colors.transparent,
                        ),
                      );
                    } catch (_) {
                      return AvatarWithName(
                          fullName: visitor.visitorName, size: 43);
                    }
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        visitor.visitorName,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTextStyles.helveticaFontLight,
                            ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        visitor.visitorEmail,
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: 13,
                              fontFamily: AppTextStyles.montserratFont,
                            ),
                      ),
                    ],
                  ),
                ),
                if (ontap != null)
                  SizedBox(
                    width: 5,
                  ),
                if (ontap != null)
                  GestureDetector(
                    onTap: ontap,
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.blueAccent,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
