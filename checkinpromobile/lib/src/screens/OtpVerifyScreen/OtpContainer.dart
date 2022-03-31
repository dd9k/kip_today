import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';

class OtpContainer extends StatefulWidget {
  final String value;

  final ValueNotifier<String> counter;

  OtpContainer({Key key, this.value, this.counter}) : super(key: key);

  @override
  _OtpContainerState createState() => _OtpContainerState();
}

class _OtpContainerState extends State<OtpContainer> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _buildCircleContainerOTP();
  }

  Widget _buildCircleContainerOTP() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: context.bgColorTextFieldPersonallabelColor,
      ),
      height: SizeConfig.safeBlockHorizontal * 17,
      width: SizeConfig.safeBlockHorizontal * 12,
      alignment: Alignment.center,
      child: ValueListenableBuilder(
        builder: (BuildContext context, String value, Widget child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                value,
                style: Theme.of(context).textTheme.headline3.copyWith(
                      fontSize: SizeConfig.safeBlockHorizontal * 8,
                  color: Colors.white
                    ),
              ),
            ],
          );
        },
        valueListenable: widget.counter,
      ),
    );
  }
}
