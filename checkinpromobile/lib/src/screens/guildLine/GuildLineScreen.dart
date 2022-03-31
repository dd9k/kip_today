import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/screens/login/LoginScreen.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MainScreen.dart';
import 'GuildLineNotifier.dart';

class GuildLineScreen extends MainScreen {
  static const String route_name = '/guild-line-screen';
  @override
  _GuildLineScreenState createState() => _GuildLineScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _GuildLineScreenState extends MainScreenState<GuildLineNotifier> {
  int _current = 0;
  bool _isSelected = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(body: Builder(builder: (cx) {
      final double height = MediaQuery.of(context).size.height;
      return SafeArea(
          top: false,
          child: Stack(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Spacer(
                  flex: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    provider.imgList[_current].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: AppTextStyles.tahomaFont,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        provider.imgList[_current].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: AppTextStyles.tahomaFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w100),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: provider.imgList.map((url) {
                    int index = provider.imgList.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color.fromRGBO(0, 135, 255, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
                Spacer(
                  flex: 1,
                )
              ]),
              CarouselSlider(
                items: provider.imgList
                    .map((item) => Padding(
                        padding: EdgeInsets.only(top: 180),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            item.imgUrl,
                            fit: BoxFit.cover,
                          ),
                        )))
                    .toList(),
                options: CarouselOptions(
                    height: height,
                    autoPlay: false,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: false,
                    aspectRatio: 2.0,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: _buildBtnNext(provider),
                ),
              )
            ],
          ));
    }));
  }

  Widget _buildBtnNext(GuildLineNotifier provider) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 80,
      height: 50,
      child: RaisedGradientButton(
        isLoading: true,
        btnController: provider.btnController,
        disable: provider.isLoading,
        btnText: appLocalizations.getStartedTitle.toUpperCase(),
        btnTextSize: SizeConfig.safeBlockHorizontal * 4,
        isEnable: _isSelected,
        onPressed: () {
          AppRouter.pushTo(context, LoginScreen.route_name);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
