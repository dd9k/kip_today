import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:flutter/material.dart';

class FooterContent extends StatelessWidget {
  final Color color;

  const FooterContent({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Wrap(
              spacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: <Widget>[
                if (color != null)
                  Image.asset(
                    'assets/images/logo_unitcorp.png',
                    cacheWidth: 25 * SizeConfig.devicePixelRatio,
                    cacheHeight: 25 * SizeConfig.devicePixelRatio,
                    color: color,
                  ),
                if (color == null)
                  Image.asset(
                    'assets/images/logo_unitcorp.png',
                    cacheWidth: 25 * SizeConfig.devicePixelRatio,
                    cacheHeight: 25 * SizeConfig.devicePixelRatio,
                  ),
                Text(
                  '${DateTime.now().year} ${AppLocalizations.of(context).infoContentFooter}',
                  style: TextStyle(
                      color: color ?? Color(0xff2c2c2c),
                      fontFamily: AppTextStyles.tahomaFont,
                      fontSize: AdaptiveTextSize()
                          .getadaptiveTextSize(context, multiplier: 1.5),
                      fontWeight: FontWeight.w400),
                ),
              ],
            )));
  }
}
