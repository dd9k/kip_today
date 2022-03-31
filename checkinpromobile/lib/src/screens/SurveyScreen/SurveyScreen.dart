import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/SurveyItemWidget.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';

import 'SurveyNotifier.dart';

// ignore: must_be_immutable
class SurveyScreen extends MainScreen {
  static const String route_name = '/SurveyScreen';
  Function callbackSubmit;
  Function callbackDismiss;
  SurveyScreen({this.callbackSubmit, this.callbackDismiss});
  @override
  _SurveyScreenState createState() => _SurveyScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _SurveyScreenState extends MainScreenState<SurveyNotifier> {
  double containerHeight = 0.0;
  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          if (visible) {
            containerHeight = 200;
          } else {
            containerHeight = 0.0;
          }
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: provider.getSurvey(context),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Center(child: new CircularProgressIndicator())),
          );
        }
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
              color: context.bgSliverAppBar,
              padding: EdgeInsets.only(
                  top: locator<Utilities>().paddingTopSizeHeight),
              child: SafeArea(
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: CustomAppBar(
                    context: context,
                    provider: provider,
                    index: -1,
                    childLeft: Icon(Icons.clear_outlined),
                    callbackLeftChild: () {
                      AppRouter.pop(context);
                      (widget as SurveyScreen).callbackDismiss();
                    },
                  ),
                  body: Selector<SurveyNotifier, bool>(
                    builder: (context, data, child) => SingleChildScrollView(
                      child: Column(
                        children: buildChildren(),
                      ),
                    ),
                    selector: (buildContext, provider) => provider.isReload,
                  ),
                ),
              )),
        );
      },
    );
  }

  List<Widget> buildChildren() {
    List<Widget> children = List();
    for (int index = 0; index < provider.listItem.length + 2; index++) {
      if (index == 0) {
      } else if (index == provider.listItem.length + 1) {
        children.add(buildBtnNext(context));
      } else {
        var item = SurveyItemWidget(
          surveyModel: provider.listItem[index - 1],
          isValidate: provider.isValidate,
          lang: provider.langSaved,
          listOld: provider.listOld,
          onChangeValue: () {
            provider.checkingValidator(provider.listItem[index - 1]);
          },
        );
        children.add(item);
      }
    }
    // Sử dụng cho mục đích đẩy view khi hiển thị keyboard
    children.add(Container(
      height: containerHeight,
      color: Colors.white,
    ));

    return children;
  }

  Widget buildBtnNext(BuildContext context) {
    var provider = Provider.of<SurveyNotifier>(context, listen: false);
    return Container(
      padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
      alignment: Alignment.center,
      child: RaisedGradientButton(
        isLoading: true,
        btnController: provider.btnController,
        disable: false,
        btnText: appLocalizations.activeButton,
        height: 40,
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        onPressed: () {
          provider.moveToNext(context, (surveyId, surveyAnswer) {
            AppRouter.pop(context);
            (widget as SurveyScreen).callbackSubmit(surveyId, surveyAnswer);
          });
        },
      ),
    );
  }
}
