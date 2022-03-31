import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final String description;
  final T value;
  final T groupValue;
  final void Function(T) onChanged;
  final RadioButtonTextPosition textPosition;
  final TextStyle textStyle;

  const CustomRadioButton({
    @required this.description,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.textStyle,
    this.textPosition = RadioButtonTextPosition.right,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          if (this.onChanged != null) {
            this.onChanged(value);
          }
        },
        child: Row(
          mainAxisAlignment: this.textPosition == RadioButtonTextPosition.right
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: <Widget>[
            // this.textPosition == RadioButtonTextPosition.left
            //     ? Padding(
            //         padding: const EdgeInsets.only(left: 8.0),
            //         child: Text(
            //           this.description,
            //           textAlign: TextAlign.left,
            //           style: textStyle,
            //         ),
            //       )
            //     : Container(),
            // Radio<T>(
            //   groupValue: groupValue,
            //   onChanged: this.onChanged,
            //   value: this.value,
            // ),
            this.textPosition == RadioButtonTextPosition.right
                ? Padding(
                    padding:
                        const EdgeInsets.only(right: 8.0, left: 20, bottom: 10),
                    child: Text(
                      this.description,
                      textAlign: TextAlign.right,
                      style: textStyle,
                    ),
                  )
                : Container(),
          ],
        ),
      );
}
