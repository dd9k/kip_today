import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:flutter/material.dart';
import '../constants/SizeConfig.dart';

class Background extends StatelessWidget {
  final bool isShowBtnBack;
  final Widget child;
  final Widget childFooter;
  final Widget itemRight;
  final VoidCallback callbackItemRight;

  Background(
      {Key key,
      this.child,
      this.childFooter,
      this.isShowBtnBack = true,
      this.itemRight,
      this.callbackItemRight})
      : super(key: key);

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var media = MediaQuery.of(context);
    return WillPopScope(
        child: Scaffold(
            backgroundColor: Color(0xffF7F9FC),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: isShowBtnBack,
                            child: InkWell(
                              onTap: () {
                                print('back');
                              },
                              child: AppImage.backBtn,
                            ),
                          ),
                          if (this.itemRight != null)
                            InkWell(
                              onTap: () {
                                this.callbackItemRight();
                              },
                              child: this.itemRight,
                            )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    bottom: 30,
                    child: this.child,
                  ),
                  if (this.childFooter != null)
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: this.childFooter))
                ],
              ),
            )),
        onWillPop: () async => false);
  }
}
