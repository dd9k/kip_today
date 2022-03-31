import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AdaptiveTextSize.dart';

class AvatarWithName extends StatelessWidget {
  AvatarWithName({@required this.fullName, this.size});

  String fullName;
  double size;

  @override
  Widget build(BuildContext context) {
    final arrFullName = fullName.split(' ');
    String firstLetter = '';
    String lastLetter = '';
    if (arrFullName.length > 0) {
      if (arrFullName[0].length > 0) {
        firstLetter = arrFullName[0][0];
      }
    }
    if (arrFullName.length > 1) {
      if (arrFullName[1].length > 0) {
        lastLetter = arrFullName[1][0];
      }
    }
    return _buildCircleLayout(
        size,
        CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text(
              "$firstLetter$lastLetter".toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppTextStyles.tahomaFont,
                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 2.0)),
            )));
  }

  Widget _buildCircleLayout(double size, Widget child) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(360.0) //         <--- border radius here
              ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1d75d5), Color(0xFF2470d0), Color(0xFF296acc), Color(0xFF2e65c7), Color(0xFF335fc2)],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(360.0)),
          child: OverflowBox(
            alignment: Alignment.center,
            child: child,
          ),
        ));
  }
}
