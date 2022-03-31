import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AdaptiveTextSize.dart';

class TextFieldCommon extends StatelessWidget {
  final String hint;
  final String hintText;

  final String errorText;
  final TextEditingController controller;
  final bool isPassword;
  final FocusNode focusNode;
  final int inputlength;
  final FormFieldValidator<String> validator;
  final int maxLines;
  final Function onComplete;
  final String initialValue;
  final Color fillColor;
  final Function onFieldSubmitted;
  final bool enabled;
  final InputBorder border;
  final bool readOnly;
  final double fontSize;
  final double fontSizeHeader;
  final EdgeInsets padding;
  final Color labelColor;
  final Color textColor;
  final Widget suffixIcon;
  final Function onchange;

  TextFieldCommon({
    @required this.hint,
    this.errorText,
    @required this.controller,
    this.initialValue,
    this.isPassword = false,
    this.focusNode,
    this.inputlength,
    this.maxLines = 1,
    this.fillColor = Colors.transparent,
    this.validator,
    this.onComplete,
    this.onFieldSubmitted,
    this.enabled,
    this.border,
    this.readOnly = false,
    this.fontSize,
    this.fontSizeHeader,
    this.padding,
    this.labelColor,
    this.textColor,
    this.suffixIcon,
    this.hintText,
    this.onchange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: this.enabled,
      validator: this.validator,
      initialValue: initialValue,
      style: TextStyle(
        fontFamily: AppTextStyles.helveticaFontLight,
        fontSize: this.fontSize == null ? 14 : fontSize,
        color: textColor ?? context.bgSwapColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        errorText: errorText,
        errorMaxLines: 2,
        contentPadding: padding == null
            ? EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0)
            : padding,
        fillColor: this.fillColor,
        filled: true,
        labelText: hint,
        labelStyle: TextStyle(
          fontFamily: AppTextStyles.helveticaFontLight,
          color: labelColor == null ? context.bgColorlabelStyle : labelColor,
          fontSize: this.fontSizeHeader == null ? 14 : this.fontSizeHeader,
        ),
        errorStyle: TextStyle(
          fontFamily: AppTextStyles.helveticaFontLight,
          fontSize: 14,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.RED_COLOR,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.DARK_BLUE_TEXT,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.DARK_BLUE_TEXT,
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.RED_COLOR,
        )),
        border: border ?? OutlineInputBorder(),
      ),
      obscureText: isPassword,
      onChanged: onchange,
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onComplete,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      readOnly: readOnly,
      keyboardType:
          isPassword ? TextInputType.text : TextInputType.emailAddress,
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(inputlength),
      ],
    );
  }
}

class TextFieldPersonal extends StatelessWidget {
  final String hint;
  final String errorText;
  final TextEditingController controller;
  final bool isPassword;
  final FocusNode focusNode;
  final int inputlength;
  final FormFieldValidator<String> validator;
  final int maxLines;
  final Function onComplete;
  final String initialValue;
  final Color fillColor;
  final Function onFieldSubmitted;
  final bool enabled;
  final InputBorder border;
  final bool readOnly;
  final double fontSize;
  final double fontSizeHeader;
  final EdgeInsets padding;
  final Color labelColor;
  final Color textColor;
  final Widget suffixIcon;
  final Function ontap;

  TextFieldPersonal({
    @required this.hint,
    this.errorText,
    @required this.controller,
    this.initialValue,
    this.isPassword = false,
    this.focusNode,
    this.inputlength,
    this.maxLines = 1,
    this.fillColor = Colors.transparent,
    this.validator,
    this.onComplete,
    this.onFieldSubmitted,
    this.enabled,
    this.border,
    this.readOnly = false,
    this.fontSize,
    this.fontSizeHeader,
    this.padding,
    this.labelColor,
    this.textColor,
    this.suffixIcon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          onTap: ontap,
          enabled: this.enabled,
          validator: this.validator,
          initialValue: initialValue,
          style: TextStyle(
            fontFamily: AppTextStyles.helveticaFontLight,
            fontSize: this.fontSize == null
                ? AdaptiveTextSize()
                    .getadaptiveTextSize(context, multiplier: 1.85)
                : fontSize,
            color: textColor,
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            errorText: errorText,
            errorMaxLines: 2,
            contentPadding: padding == null
                ? EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0)
                : padding,
            fillColor: this.fillColor,
            filled: true,
            labelText: hint,
            labelStyle: TextStyle(
              fontFamily: AppTextStyles.helveticaFontLight,
              color: labelColor == null
                  ? context.bgColorTextFieldPersonal
                  : labelColor,
              fontSize: this.fontSizeHeader == null
                  ? AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 1.85)
                  : this.fontSizeHeader,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.RED_COLOR,
              ),
            ),
            errorStyle: TextStyle(
              fontFamily: AppTextStyles.helveticaFontLight,
              fontSize: AdaptiveTextSize()
                  .getadaptiveTextSize(context, multiplier: 1.6),
            ),
            border: border ?? OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.DARK_BLUE_TEXT,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.DARK_BLUE_TEXT,
              ),
            ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: AppColors.RED_COLOR,
            )),
          ),
          obscureText: isPassword,
          onChanged: null,
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onComplete,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: maxLines,
          readOnly: readOnly,
          keyboardType:
              isPassword ? TextInputType.text : TextInputType.emailAddress,
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(inputlength),
          ],
        ),
      ],
    );
  }
}
