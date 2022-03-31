import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({Key key, @required this.icon, this.width, this.height, this.onTap, this.color, this.child})
      : super(key: key);
  final IconData icon;
  final double width;
  final double height;
  final Function onTap;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Ink(
            width: width == null ? 45 : width,
            height: height == null ? 45 : height,
            color: context.bgMain,
            child: child == null ? Icon(
              icon,
              color: color,
            ) : child),
      ),
    );
  }
}
