import 'dart:convert';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/QuestionSurvey.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/simple_grouped_checkbox/SimpleGroupedCheckBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'dart:math';
import 'TypeHead.dart';

typedef onChanged = Function();

// ignore: must_be_immutable
class SurveyItemWidget extends StatefulWidget {
  final onChanged onChangeValue;
  final bool isValidate;
  final String lang;
  QuestionSurvey surveyModel;
  List<QuestionSurvey> listOld;

  SurveyItemWidget(
      {@required this.surveyModel,
      @required this.isValidate,
      @required this.lang,
      @required this.onChangeValue,
      @required this.listOld});

  @override
  _SurveyItemWidgetState createState() => _SurveyItemWidgetState();
}

class _SurveyItemWidgetState extends State<SurveyItemWidget> {
  bool isInit = false;
  final List<String> temperature = [" °C", " °F"];
  TextEditingController controllerDropDown = TextEditingController();
  TextEditingController controller = TextEditingController();
  GlobalKey<SimpleGroupedCheckboxState<int>> mutliradioKey = GlobalKey();
  GlobalKey<SimpleGroupedCheckboxState<int>> mutlicheckboxKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isError()
          ? Theme.of(context).brightness == Brightness.light
              ? AppColors.RED_SUB_COLOR
              : AppColors.CARD_COLOR_DARK
          : Colors.transparent,
      padding: EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.only(top: isError() ? 10 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: buildQuestion(),
          ),
          SizedBox(
            height: 3,
          ),
          SizedBox(
            width: double.infinity,
            child: buildValue(),
          ),
          SizedBox(
            height: 5,
          ),
          Visibility(
            visible: isError(),
            child: Text(
              widget.surveyModel.errorText,
              style: TextStyle(color: AppColors.RED_COLOR),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget buildQuestion() {
    double fontSize =
        AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 2.0);
    if (widget.surveyModel.isRequired == 1) {
      return RichText(
          text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: Utilities()
                .getStringByLang(widget.surveyModel.question, widget.lang),
            style: Theme.of(context).textTheme.headline5,
          ),
          TextSpan(
            text: " *",
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: AppTextStyles.tahomaFont,
              height: 2,
              color: AppColors.RED_COLOR,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ));
    }
    return Text(
      Utilities().getStringByLang(widget.surveyModel.question, widget.lang),
      style: Theme.of(context).textTheme.headline5,
    );
  }

  bool isError() =>
      (widget.isValidate && widget.surveyModel.errorText?.isNotEmpty == true);

  Widget buildValue() {
    switch (widget.surveyModel.getSurveyType()) {
      case QuestionType.EDIT_TEXT:
        {
          if (!isInit) {
            isInit = true;
            controller.text =
                widget.surveyModel.getPreText(widget.listOld, widget.lang);
          }
          return TextFormField(
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 30),
              textCapitalization: TextCapitalization.sentences,
              controller: controller,
              keyboardType: getKeyBoardType(),
              textInputAction: TextInputAction.done,
              inputFormatters: inputFormat(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.0),
                ),
                isDense: true,
                contentPadding: EdgeInsets.only(top: 15, left: 10),
                suffixIcon: Icon(
                  Icons.edit,
                  size: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 2.0),
                  color: context.bgSwapColor,
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
              ),
              style: Theme.of(context).textTheme.headline5,
              maxLines: 1,
              onEditingComplete: () {
                Utilities().hideKeyBoard(context);
              },
              onTap: () {},
              onChanged: (text) {
                setState(() {
                  widget.surveyModel.getAnswer().clear();
                  if (text.isNotEmpty) {
                    Map<String, String> mapValue = Map();
                    mapValue[Constants.VN_CODE] = text;
                    mapValue[Constants.EN_CODE] = text;
                    String value = jsonEncode(mapValue);
                    widget.surveyModel.getAnswer().add(value);
                  }
                  widget.onChangeValue();
                });
              });
        }
      case QuestionType.TEMPERATURE:
        {
          if (!isInit) {
            isInit = true;
            controllerDropDown.text = temperature[0];
            var preText =
                widget.surveyModel.getPreText(widget.listOld, widget.lang);
            if (preText.isNotEmpty) {
              List<String> pre = preText.split(" ");
              controller.text = pre[0];
              var indexTem = (temperature.indexOf(" " + pre[1]) != -1)
                  ? temperature.indexOf(" " + pre[1])
                  : 0;
              controllerDropDown.text = temperature[indexTem];
            }
          }
          return Wrap(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: context.bgSliverAppBar,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  border: Border.all(color: context.formBorderColor, width: 1),
                ),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 8,
                      child: TextFormField(
                        scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom + 30,
                        ),
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        controller: controller,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(5),
                          DecimalTextInputFormatter(decimalRange: 2)
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusColor: Colors.white,
                          focusedBorder: InputBorder.none,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.RED_COLOR,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        onEditingComplete: () {
                          Utilities().hideKeyBoard(context);
                        },
                        onTap: () {},
                        onChanged: (text) {
                          setState(() {
                            widget.surveyModel.getAnswer()?.clear();
                            if (text.isNotEmpty) {
                              Map<String, String> mapValue = Map();
                              mapValue[Constants.VN_CODE] =
                                  text + controllerDropDown.text;
                              mapValue[Constants.EN_CODE] =
                                  text + controllerDropDown.text;
                              String value = jsonEncode(mapValue);
                              widget.surveyModel.getAnswer().add(value);
                            }
                            widget.onChangeValue();
                          });
                        },
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 16),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                                width: 1, color: context.formBorderColor),
                          ),
                          color: context.bgSliverAppBar,
                        ),
                        child: TypeAheadField<dynamic>(
                          hideSuggestionsOnKeyboardHide: false,
                          noItemsFoundBuilder: (context) => Container(),
                          getImmediateSuggestions: true,
                          hideOnLoading: true,
                          suggestionsBoxDecoration: SuggestionsBoxDecoration(
                            //shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: context.formBorderColor,
                                width: 1,
                              ),
                            ),
                            constraints: BoxConstraints(
                              maxHeight: SizeConfig.safeBlockVertical * 40,
                            ),
                          ),
                          textFieldConfiguration: TextFieldConfiguration(
                            readOnly: true,
                            showCursor: false,
                            onTap: () {},
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.arrow_drop_down,
                                size: AdaptiveTextSize().getadaptiveTextSize(
                                  context,
                                  multiplier: 3.0,
                                ),
                              ),
                            ),
                            onSubmitted: (_) async {},
                            controller: controllerDropDown,
                            onChanged: (text) {},
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontSize: 18),
                          ),
                          suggestionsCallback: (String pattern) {
                            return temperature;
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, dynamic suggestion) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 1,
                                top: 5,
                                bottom: 5,
                                right: 20,
                              ),
                              child: Text(
                                suggestion,
                                style: TextStyle(
                                  fontFamily: AppTextStyles.helveticaFontLight,
                                  fontWeight: FontWeight.normal,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context),
                                ),
                              ),
                            );
                          },
                          onSuggestionSelected: (dynamic suggestion) async {
                            setState(() {
                              widget.surveyModel.getAnswer()?.clear();
                              if (suggestion.isNotEmpty) {
                                Map<String, String> mapValue = Map();
                                mapValue[Constants.VN_CODE] =
                                    controller.text + suggestion;
                                mapValue[Constants.EN_CODE] =
                                    controller.text + suggestion;
                                String value = jsonEncode(mapValue);
                                widget.surveyModel.getAnswer().add(value);
                              }
                            });
                            controllerDropDown.text = suggestion;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      case QuestionType.RADIO_BUTTON:
        {
          List<String> preValue = List();
          if (!isInit) {
            isInit = true;
            preValue = widget.surveyModel.getPreValue(widget.listOld);
            widget.surveyModel.getAnswer().addAll(preValue);
          }
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: ListTileTheme(
              contentPadding: EdgeInsets.all(0),
              child: SimpleGroupedCheckbox<String>(
                isExpandableTitle: false,
                key: mutliradioKey,
                groupTitleStyle: TextStyle(
                    fontFamily: AppTextStyles.tahomaFont,
                    color: Colors.red,
                    fontSize: AdaptiveTextSize()
                        .getadaptiveTextSize(context, multiplier: 1.85)),
                itemsTitle: widget.surveyModel.getAnswerOptionLang(widget.lang),
                values: widget.surveyModel.getAnswerOption(),
                activeColor: AppColors.MAIN_TEXT_COLOR,
                checkFirstElement: false,
                isLeading: true,
                multiSelection: false,
                preSelection: preValue,
                onItemSelected: (data) {
                  setState(() {
                    Utilities().hideKeyBoard(context);
                    widget.surveyModel.getAnswer().clear();
                    widget.surveyModel.getAnswer().add(data);
                    widget.onChangeValue();
                  });
                },
              ),
            ),
          );
        }
      case QuestionType.CHECK_BOX:
        {
          List<String> preValue = List();
          if (!isInit) {
            isInit = true;
            preValue = widget.surveyModel.getPreValue(widget.listOld);
            widget.surveyModel.getAnswer().addAll(preValue);
          }
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: ListTileTheme(
              contentPadding: EdgeInsets.all(0),
              child: SimpleGroupedCheckbox<String>(
                key: mutlicheckboxKey,
                itemsTitle: widget.surveyModel.getAnswerOptionLang(widget.lang),
                values: widget.surveyModel.getAnswerOption(),
                activeColor: AppColors.MAIN_TEXT_COLOR,
                checkFirstElement: false,
                isLeading: true,
                preSelection: preValue,
                multiSelection: true,
                onItemSelected: (data) {
                  setState(() {
                    Utilities().hideKeyBoard(context);
                    widget.surveyModel.getAnswer().clear();
                    if (data.isNotEmpty) {
                      widget.surveyModel.getAnswer().addAll(data);
                    }
                    widget.onChangeValue();
                  });
                },
              ),
            ),
          );
        }
      case QuestionType.DROP_DOWN:
        {
          if (!isInit) {
            isInit = true;
            widget.surveyModel.getAnswer().clear();
            var preText =
                widget.surveyModel.getPreText(widget.listOld, widget.lang);
            if (preText.isNotEmpty) {
              widget.surveyModel.getAnswer().add(preText);
            } else {
              widget.surveyModel
                  .getAnswer()
                  .add(widget.surveyModel.answerOption[0]);
            }
            controller.text = widget.surveyModel.getAnswerOptionValue(
                widget.surveyModel.getPreText(widget.listOld, widget.lang),
                widget.lang);
          }
          final lstAnswerOptions = widget.surveyModel.getAnswerOption();
          final initialItem = lstAnswerOptions.indexWhere((answer) =>
              answer.toUpperCase() ==
              (widget.surveyModel.getAnswer() == null ||
                      widget.surveyModel.getAnswer().length <= 0
                  ? widget.surveyModel.answerOption[0].toUpperCase()
                  : widget.surveyModel.getAnswer()[0].toUpperCase()));
          int indexChoice = initialItem <= -1 ? 0 : initialItem;
          return TextFormField(
              controller: controller,
              textCapitalization: TextCapitalization.sentences,
              showCursor: false,
              readOnly: true,
              keyboardType: getKeyBoardType(),
              textInputAction: TextInputAction.done,
              inputFormatters: inputFormat(),
              style: Theme.of(context).textTheme.headline5,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.0),
                ),
                contentPadding: EdgeInsets.only(left: 10, top: 15),
                isDense: true,
                suffixIcon: Icon(
                  Icons.arrow_drop_down_sharp,
                  size: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 3.0),
                  color: context.bgSwapColor,
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
                  ),
                ),
              ),
              onEditingComplete: () {
                Utilities().hideKeyBoard(context);
              },
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FlatButton(
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .doneButtonContent,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        widget.surveyModel.getAnswer().clear();
                                        widget.surveyModel
                                            .getAnswer()
                                            .add(lstAnswerOptions[indexChoice]);
                                        controller.text = widget.surveyModel
                                            .getAnswerOptionValue(
                                                lstAnswerOptions[indexChoice],
                                                widget.lang);
                                        widget.onChangeValue();
                                      });
                                      AppRouter.pop(context);
                                    },
                                  )
                                ],
                              ),
                              Expanded(
                                flex: 2,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                      initialItem:
                                          initialItem <= -1 ? 0 : initialItem),
                                  useMagnifier: true,
                                  backgroundColor: Colors.white,
                                  onSelectedItemChanged: (index) {
                                    indexChoice = index;
                                  },
                                  itemExtent: 50.0,
                                  children: List<Widget>.generate(
                                      lstAnswerOptions.length, (int index) {
                                    return Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      child: Text(
                                        widget.surveyModel.getAnswerOptionValue(
                                            lstAnswerOptions[index],
                                            widget.lang),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                                color:
                                                    AppColors.MAIN_TEXT_COLOR),
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          ));
                    });
              },
              onChanged: (text) {});
        }
      default:
        {
          return RadioGroup<String>.builder(
            direction: Axis.vertical,
            horizontalAlignment: MainAxisAlignment.spaceEvenly,
            groupValue: widget.surveyModel.getAnswer()[0],
            onChanged: (value) => setState(() {
              Utilities().hideKeyBoard(context);
              widget.surveyModel.getAnswer().clear();
              if (value.isNotEmpty) {
                widget.surveyModel.getAnswer().add(value);
              }
              widget.onChangeValue();
            }),
            items: widget.surveyModel.getAnswerOptionLang(widget.lang),
            itemBuilder: (item) => RadioButtonBuilder(
              widget.surveyModel.getAnswerOptionValue(item, widget.lang),
              textPosition: RadioButtonTextPosition.right,
            ),
          );
        }
    }
  }

  TextInputType getKeyBoardType() {
    switch (widget.surveyModel.getSurveySubType()) {
      case QuestionSubType.EMAIL:
        return TextInputType.emailAddress;

      case QuestionSubType.TEXT:
        return TextInputType.text;

      case QuestionSubType.PHONE:
        return TextInputType.phone;

      case QuestionSubType.NUMBER:
        return TextInputType.number;

      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter> inputFormat() {
    switch (widget.surveyModel.getSurveySubType()) {
      case QuestionSubType.TEXT:
        {
          return <TextInputFormatter>[
            UpperCaseFirstLetterFormatter(),
            LengthLimitingTextInputFormatter(200),
          ];
        }

      case QuestionSubType.PHONE:
        return <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(13),
        ];

      case QuestionSubType.EMAIL:
        return <TextInputFormatter>[
          LengthLimitingTextInputFormatter(200),
        ];

      case QuestionSubType.NUMBER:
        return <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(200),
        ];

      default:
        return <TextInputFormatter>[
          LengthLimitingTextInputFormatter(200),
        ];
    }
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: min(truncated.length, truncated.length + 1),
          extentOffset: min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
