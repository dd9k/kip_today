import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/TextFieldCommon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'JobInfoNotifier.dart';

class JobInfoScreen extends MainScreen {
  static const String route_name = '/jobinfoScreen';
  @override
  JobInfoScreenState createState() => JobInfoScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class JobInfoScreenState extends MainScreenState<JobInfoNotifier> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    provider.getList(context);
    provider.getEmployeeInfo(context);
    var widthContainer = widthScreen * 90;
    return Selector<JobInfoNotifier, bool>(
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
                ),
                body: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: widthScreen * 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: context.bgCard,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        width: widthContainer,
                        child: ListView.separated(
                          separatorBuilder:
                              (BuildContext context, int indexChild) {
                            return Container(
                              margin: EdgeInsets.only(left: 20.0, right: 20),
                              height: 1,
                              color: context.bgSliverAppBar,
                            );
                          },
                          itemCount: provider.items.length,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int indexChild) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: context.bgCard,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: itemSetting(indexChild),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
      selector: (buildContext, modelProvider) => modelProvider.isLoading,
    );
  }

  Widget itemSetting(int index) {
    return Selector<JobInfoNotifier, bool>(
      builder: (cx, data, child) {
        return _buildTextFiledRow(
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
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          () {
            if (index >= provider.items.length - 1) {
              provider.utilities.hideKeyBoard(context);
              return;
            }
            provider.items[index].data = provider.listController[index].text;
            FocusScope.of(context).requestFocus(provider.listFocus[index + 1]);
          },
        );
      },
      selector: (cx, provider) => provider.isEdit,
    );
  }

  Widget _buildTextFiledRow(
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
      Function onComplete) {
    controller.text = title.isEmpty ? " " : title;
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );

    return Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2),
        child: TextFieldCommon(
          hint: hint,
          isPassword: isPassword,
          controller: controller,
          errorText: errorText,
          focusNode: focusNode,
          onComplete: onComplete,
          enabled: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          maxLines: maxLine,
          readOnly: true,
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

  @override
  void dispose() {
    super.dispose();
  }
}
