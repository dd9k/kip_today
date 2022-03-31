import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppDestination.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RaisedGradientButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  final double height;
  final bool isLoading;
  final bool styleEmpty;
  final double btnTextSize;
  final RoundedLoadingButtonController btnController;
  final disable;
  final isEnable;
  final Color color;

  RaisedGradientButton({
    this.btnText,
    this.btnTextSize,
    @required this.onPressed,
    this.height,
    @required this.disable,
    this.isLoading,
    this.styleEmpty,
    this.btnController,
    this.isEnable = true,
    this.color = AppColors.DARK_BLUE_TEXT,
  });

  @override
  Widget build(BuildContext context) {
    var isLoadingButton = isLoading ?? false;
    if (isLoadingButton) {
      return AbsorbPointer(
        absorbing: disable | !isEnable,
        child: RoundedLoadingButton(
          onPressed: onPressed,
          controller: btnController,
          child: buildContent(context),
        ),
      );
    }
    return AbsorbPointer(
      absorbing: disable | !isEnable,
      child: RaisedButton(
        onPressed: onPressed,
        color: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDestination.RADIUS_SQUARED_TEXT_INPUT),
        ),
        child: buildContent(context),
      ),
    );
  }

  Ink buildContent(BuildContext context) {
    if (styleEmpty != null && styleEmpty) {
      return buildEmpty(context);
    }
    return buildFull(context);
  }

  Ink buildFull(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        gradient: disable
            ? AppColors.linearGradientDisabled
            : isEnable
                ? AppColors.linearGradient
                : AppColors.linearGradientDisabled,
      ),
      child: Container(
        constraints:
            BoxConstraints(minHeight: this.height ?? Constants.HEIGHT_BUTTON),
        alignment: Alignment.center,
        color: color,
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Ink buildEmpty(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.MAIN_TEXT_COLOR, width: 1),
          borderRadius:
              BorderRadius.circular(AppDestination.RADIUS_SQUARED_TEXT_INPUT)),
      child: Container(
        constraints:
            BoxConstraints(minHeight: this.height ?? Constants.HEIGHT_BUTTON),
        alignment: Alignment.center,
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: Theme.of(context).textTheme.button.fontSize,
          ),
        ),
      ),
    );
  }
}
