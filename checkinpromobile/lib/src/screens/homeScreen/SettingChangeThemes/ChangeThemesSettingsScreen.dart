import 'dart:io';
import 'package:flutter/material.dart';
import '../../MainScreen.dart';
import 'ChangeThemesSettingsNotifier.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:provider/provider.dart';
import 'package:checkinpromobile/src/themes/AppThemes.dart';
import 'package:flutter/services.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';

// ignore: must_be_immutable
class ChangeThemesScreen extends MainScreen {
  static const String route_name = '/ChangeThemesScreen';

  @override
  _ChangeThemesScreenState createState() => _ChangeThemesScreenState();

  @override
  String getNameScreen() {
    return "ChangeThemesScreen";
  }
}

class _ChangeThemesScreenState
    extends MainScreenState<ChangThemesSettingsNotifier> {
  ChangThemesSettingsNotifier provider;
  bool load = true;

  ThemeMode dark = ThemeMode.dark;
  ThemeMode light = ThemeMode.light;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    provider.index = Theme.of(context).brightness == Brightness.light ? 0 : 1;
    return Container(
      color: context.bgSliverAppBar,
      child: SafeArea(
        child: Selector<ChangThemesSettingsNotifier, int>(
          builder: (context, index, child) {
            return Scaffold(
              appBar: CustomAppBar(
                context: context,
                index: -1,
                provider: provider,
                childRight: Icon(Icons.save),
                childLeft: GestureDetector(
                  onTap: () {
                    Utilities().showTwoButtonDialog(
                      context,
                      DialogType.QUESTION,
                      null,
                      appLocalizations.saveThemeContent,
                      appLocalizations.saveThemeContent,
                      appLocalizations.noTitle,
                      appLocalizations.yesTitle,
                      () {
                        setState(() {
                          Provider.of<ThemeChanger>(context).setTheme(
                            provider.index == 0 ? light : dark,
                          );
                        });
                        Navigator.pop(context);
                      },
                      () {
                        provider.saveIndexChangeThemes();
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: AppImage.backBtn,
                ),
              ),
              body: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: GestureDetector(
                            onTap: () => Provider.of<ThemeChanger>(context)
                                .setTheme(light),
                            child: Container(
                              decoration: provider.index == 0
                                  ? BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0xFFCBE0F1),
                                          Color(0xFFA5CFFA),
                                          Color(0xFF7BAAF0),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)))
                                  : BoxDecoration(
                                      color: context.bgSliverAppBar,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                              // decoration: BoxDecoration(
                              //     color: context.bgSliverAppBar,
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(5.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Platform.isAndroid == true
                                        ? Image.asset(
                                            'assets/images/LightAndroid.png',
                                          )
                                        : Image.asset(
                                            'assets/images/LightIphone.png',
                                          ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: GestureDetector(
                            onTap: () => Provider.of<ThemeChanger>(context)
                                .setTheme(dark),
                            child: Container(
                              decoration: provider.index == 1
                                  ? BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0xFF18191A),
                                          Color(0xFF393C3F),
                                          Color(0xFF595E5E),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)))
                                  : BoxDecoration(
                                      color: context.bgSliverAppBar,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                              // decoration: BoxDecoration(
                              //     color: context.bgSliverAppBar,
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(5.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Platform.isAndroid == true
                                        ? Image.asset(
                                            'assets/images/DarkAndroid.png',
                                          )
                                        : Image.asset(
                                            'assets/images/DarkIphone.png',
                                          ),
                                    SizedBox(
                                      height: 15,
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
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         width: 100,
                  //         child: RadioListTile<ThemeMode>(
                  //           title: Text(
                  //             'Light Mode',
                  //             style: Theme.of(context).textTheme.headline1,
                  //           ),
                  //           activeColor: AppColors.DARK_BLUE_TEXT,
                  //           groupValue: themeChanger.themeMode,
                  //           value: ThemeMode.light,
                  //           onChanged: themeChanger.setTheme,
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //         width: 100,
                  //         child: RadioListTile<ThemeMode>(
                  //           title: Text(
                  //             'Dark Mode',
                  //             style: Theme.of(context).textTheme.headline1,
                  //           ),
                  //           activeColor: AppColors.DARK_BLUE_TEXT,
                  //           groupValue: themeChanger.themeMode,
                  //           value: ThemeMode.dark,
                  //           onChanged: themeChanger.setTheme,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            );
          },
          selector: (cx, provider) => provider.index,
        ),
      ),
    );
  }
}
