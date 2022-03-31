import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';

class LabelDisplayCommon extends StatelessWidget {
  final String body;
  final FontWeight fontWeight;
  final maxLines;
  final IconData prefixIcon;
  final Color prefixIconColor;
  final Color bodyColor;
  final bool isPaddingRight;
  final double fontSize;

  LabelDisplayCommon(
      {this.body,
      this.prefixIcon,
      this.prefixIconColor = AppColors.DARK_BLUE_TEXT,
      this.bodyColor = Colors.black,
      this.fontWeight,
      this.maxLines,
      this.isPaddingRight = true,
      this.fontSize = 1.85});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Icon(
            prefixIcon,
          ),
        ),
        Expanded(
          flex: 8,
          child: Text(
            body?.isEmpty != false ? AppLocalizations.of(context).noneContent : body,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            style: Theme.of(context)
                .textTheme
                .headline5,
          ),
        ),
        if (isPaddingRight)
          Spacer(
            flex: 1,
          ),
      ],
    );
  }
}
