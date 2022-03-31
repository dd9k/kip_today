import 'dart:io';
import 'package:flutter/material.dart';
import '../../MainScreen.dart';
import 'ChangeUiSettingsNotifier.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:provider/provider.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class ChangeUIScreen extends MainScreen {
  static const String route_name = '/ChangeUiScreen';

  @override
  _ChangeUIScreenState createState() => _ChangeUIScreenState();

  @override
  String getNameScreen() {
    return "ChangeUiScreen";
  }
}

class _ChangeUIScreenState extends MainScreenState<ChangUiSettingsNotifier> {
  ChangUiSettingsNotifier provider;
  bool load = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (load == true) {
      provider.getIndex();
      load = false;
    }
    return Container(
      color: context.bgSliverAppBar,
      child: SafeArea(
        child: Selector<ChangUiSettingsNotifier, int>(
          builder: (context, index, child) {
            return Scaffold(
              appBar: CustomAppBar(
                context: context,
                index: -1,
                provider: provider,
                childRight: Icon(Icons.save),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              provider.index = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: provider.index == 0
                                  ? BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0xFF42A5F5),
                                          Color(0xFF1976D2),
                                          Color(0xFF0D47A1),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)))
                                  : BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Platform.isAndroid == true
                                        ? Image.asset(
                                            'assets/images/right_android_bg.png',
                                          )
                                        : Image.asset(
                                            'assets/images/ios_right_bg.png',
                                          ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      appLocalizations.changeUiSelectAttendace
                                          .toUpperCase(),
                                      style: TextStyle(
                                          color: provider.index == 0
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context,
                                                  multiplier: 1.85)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              provider.index = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: provider.index == 1
                                  ? BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0xFF42A5F5),
                                          Color(0xFF1976D2),
                                          Color(0xFF0D47A1),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)))
                                  : BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Platform.isAndroid == true
                                        ? Image.asset(
                                            'assets/images/left_android_bg.png',
                                          )
                                        : Image.asset(
                                            'assets/images/ios_left_bg.png',
                                          ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      appLocalizations.changeUiSelectDefault
                                          .toUpperCase(),
                                      style: TextStyle(
                                          color: provider.index == 1
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context,
                                                  multiplier: 1.85)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          selector: (cx, provider) => provider.index,
        ),
      ),
    );
  }

  Widget radioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: provider.index,
      onChanged: onChanged,
      title: Text(title,
          style: TextStyle(
              fontFamily: AppTextStyles.tahomaFont,
              color: AppColors.BLUE_COLOR,
              fontSize: 16)),
    );
  }
}
