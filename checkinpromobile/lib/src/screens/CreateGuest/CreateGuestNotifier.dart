import 'dart:convert';

import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/CheckInFlow.dart';
import 'package:checkinpromobile/src/model/ETBookingDiscountInfo.dart';
import 'package:checkinpromobile/src/model/ETNewOrder.dart';
import 'package:checkinpromobile/src/model/ETOrderInfo.dart';
import 'package:checkinpromobile/src/model/ETPaymentType.dart';
import 'package:checkinpromobile/src/model/EventTicketDetail.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/utilities/Validator.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:flutter/services.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';

import 'CreateGuestScreen.dart';

class CreateGuestNotifier extends AppBarNotifier {
  TextEditingController paymentController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  Map<String, TextEditingController> textEditingControllers = {};
  String valueFocus = '';
  int quantity = 1;
  int amountDiscount = 0;
  int totalAmount = 0;
  int totalAmountNoDiscount = 0;
  List<GlobalKey<FormState>> keyList = List();
  bool validator = true;
  bool isInit = false;
  bool isLoading = false;
  List<CheckInFlow> flows = List();
  EventTicketDetail eventDetail;
  ETBookingDiscountInfo discountApply;
  ETPaymentType itemPayment;
  String errorQuantity;
  List<ETBookingDiscountInfo> listDiscount = List();
  int min = 0;
  int max = 0;
  int remainInfor = 0;
  String langSaved;

  @override
  String getSubTitle(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    return appLocalizations.addNewVisitorType.toUpperCase();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClickLeft(BuildContext context) {
    AppRouter.popWithArguments(context,
        arguments: {"isReload": arguments["isReload"]});
  }

  @override
  void onClickRight(BuildContext context) {
    Utilities().hideKeyBoard(context);
    var isWrong = false;
    for (int index = 0; index < keyList.length; index ++) {
      if (keyList[index].currentState?.validate() == false) {
        isWrong = true;
      }
    }
    if (!isWrong && errorQuantity == null) {
      _requestCreateOrder();
    }
  }

  void loadData(BuildContext context) {
    if (!isInit) {
      isInit = true;
      langSaved = preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
      eventDetail = arguments["eventDetail"] as EventTicketDetail;
      listDiscount = eventDetail?.ticketInfo?.bookingDiscountInfo;
      min = eventDetail?.ticketInfo?.minQuantity?.toInt() ?? 1;
      max = eventDetail?.ticketInfo?.maxQuantity?.toInt() ?? Constants.MAX_INT;
      remainInfor = eventDetail?.ticketInfo?.remainingTicketQuantity?.toInt() ?? 0;
      itemPayment = eventDetail?.paymentTypes?.first;
      if (listDiscount?.isNotEmpty == true) {
        listDiscount.removeWhere((element) =>
            element.bookingQuantity == null || element.discountUnit == null || element.discountValue == null);
        listDiscount.sort((a, b) => a.bookingQuantity.compareTo(b.bookingQuantity));
        for (int index = 1; index < listDiscount.length; index++) {
          if (listDiscount[index].bookingQuantity == listDiscount[index - 1].bookingQuantity) {
            if (listDiscount[index].bookingQuantity >
                listDiscount[index - 1].bookingQuantity) {
              listDiscount[index - 1].isDummy = true;
            } else {
              listDiscount[index].isDummy = true;
            }
          }
        }
        listDiscount.removeWhere((element) => element.isDummy);
      }
      updateQuantity(1, isShowToast: false);
      paymentController.text = utilities.getStringByLang(itemPayment.settingValue, langSaved);
      quantityController.text = quantity.toString();
      renderFlowByType();
//      quantityNode.addListener(() {
//        if (!quantityNode.hasFocus) {
//          if (quantityController.text.isEmpty) {
//            updateQuantity(0);
//          }
//        }
//      });
    }
  }

  void renderFlowByType() {
    var step = eventDetail.settingInfo.bookingField;
    try {
      List<dynamic> convert = jsonDecode(step);
      convert.forEach((element) {
        Map<String, dynamic> map = Map<String, dynamic>.from(element);
        flows.add(CheckInFlow.fromJson(map));
      });
    } catch (_) {
      step = Constants.DEFAULT_STEP;
      List<dynamic> convert = jsonDecode(step);
      convert.forEach((element) {
        Map<String, dynamic> map = Map<String, dynamic>.from(element);
        flows.add(CheckInFlow.fromJson(map));
      });
    }
    flows?.removeWhere((element) => !element.isShow);
    flows?.sort((a, b) => a.sort.compareTo(b.sort));

//    var langSaved = preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.EN_CODE;
//    flows?.forEach((item) {
//      try {
//        var mapLang = json.decode(item.stepName);
//        item.stepName = mapLang[langSaved];
//      } catch(e) {}
//    });
  }

  void calculateTotalAmountNoDiscount() {
    totalAmountNoDiscount =
        ((eventDetail?.ticketInfo?.ticketPrice ?? 0) * quantity).toInt();
  }

  void calculateTotalAmount() {
    totalAmount = (totalAmountNoDiscount - amountDiscount).toInt();
  }

  void initItemFlow(CheckInFlow item, int index,
      TextEditingController controller, List<FocusNode> focusNodes) {
    item.index = index;
    // Focus on textfield
    keyList.add(GlobalKey());
    if (controller != null) {
      textEditingControllers.putIfAbsent(item.stepCode, () => controller);
    } else {
      var textEditingController = new TextEditingController();
      textEditingControllers.putIfAbsent(
          item.stepCode, () => textEditingController);
      textEditingController.value = TextEditingValue(text: item.initValue);
    }
    var _focus = FocusNode();
    _focus.addListener(() {
      _onFocusChange(_focus, item);
    });
    focusNodes.add(_focus);
  }

  void getDiscount() {
    if (listDiscount?.isNotEmpty == true) {
      for (int index = listDiscount.length - 1; index >= 0; index--) {
        if (listDiscount[index].bookingQuantity != null &&
            listDiscount[index].discountValue != null &&
            listDiscount[index].discountUnit != null) {
          if (quantity >= listDiscount[index].bookingQuantity) {
            discountApply = listDiscount[index];
            if (discountApply.discountUnit == "%") {
              amountDiscount = ((totalAmountNoDiscount / 100) * discountApply.discountValue).toInt();
            } else {
              amountDiscount = discountApply.discountValue.toInt();
            }
            break;
          }
        }
      }
    } else {
      amountDiscount = 0;
    }
  }

  FormFieldValidator<String> checkingValidator(CheckInFlow item) {
    switch (item.stepType?.toUpperCase()) {
      case StepType.TEXT:
        if (item.getRequestType() == RequestType.ALWAYS ||
            item.getRequestType() == RequestType.FIRST) {
          ValidatorLabel _validator = new ValidatorLabel(appLocalizations);
          _validator.setStrParam(item.getStepName(appLocalizations));
          if (item.stepCode == StepCode.FULL_NAME)
            return _validator.validateName;
          return _validator.validateText;
        }
        return null;

      case StepType.MULTIPLE_TEXT:
        if (item.getRequestType() == RequestType.ALWAYS ||
            item.getRequestType() == RequestType.FIRST) {
          ValidatorLabel _validator = new ValidatorLabel(appLocalizations);
          _validator.setStrParam(item.getStepName(appLocalizations));
          if (item.stepCode == StepCode.FULL_NAME)
            return _validator.validateName;
          return _validator.validateText;
        }
        return null;

      case StepType.PHONE:
        ValidatorLabel _validator = new ValidatorLabel(appLocalizations);
        if (item.getRequestType() == RequestType.ALWAYS ||
            item.getRequestType() == RequestType.FIRST) {
          _validator.setStrParam(item.getStepName(appLocalizations));
          return _validator.validatePhoneNumber;
        }
        return _validator.validatePhoneWithoutRequire;

      case StepType.NUMBER:
        ValidatorLabel _validator = new ValidatorLabel(appLocalizations);
        if (item.stepCode == StepCode.PHONE_NUMBER) {
          if (item.getRequestType() == RequestType.ALWAYS ||
              item.getRequestType() == RequestType.FIRST) {
            _validator.setStrParam(item.getStepName(appLocalizations));
            return _validator.validatePhoneNumber;
          }
          return _validator.validatePhoneWithoutRequire;
        } else if (item.getRequestType() == RequestType.ALWAYS ||
            item.getRequestType() == RequestType.FIRST) {
          _validator.setStrParam(item.getStepName(appLocalizations));
          return _validator.validateText;
        }
        return null;

      case StepType.EMAIL:
        ValidatorLabel _validator = new ValidatorLabel(appLocalizations);
        if (item.getRequestType() == RequestType.ALWAYS ||
            item.getRequestType() == RequestType.FIRST) {
          _validator.setStrParam(item.getStepName(appLocalizations));
          return _validator.validateEmail;
        }
        return _validator.validateEmailWithoutRequire;

      default:
        return null;
    }
  }

  TextCapitalization checkingCapitalization(CheckInFlow item) {
    if (item?.stepCode == StepCode.FULL_NAME) {
      return TextCapitalization.words;
    }
    if (item?.stepCode == StepCode.EMAIL) {
      return TextCapitalization.none;
    }
    return TextCapitalization.sentences;
  }

  List<TextInputFormatter> inputFormat(CheckInFlow item) {
    switch (item?.stepType?.toUpperCase()) {
      case StepType.TEXT:
        {
          if (item?.stepCode == StepCode.FULL_NAME) {
            return <TextInputFormatter>[
              AutoCapWordsInputFormatter(),
              BlacklistingTextInputFormatter(
                  RegExp("[0-9!#\$\"%&'()*+,-./:;<=>?@[\\]^_`{|}~₫¥€§…]")),
              LengthLimitingTextInputFormatter(36),
            ];
          }
          return <TextInputFormatter>[
            UpperCaseFirstLetterFormatter(),
            BlacklistingTextInputFormatter(
                RegExp("[!#\$\"%&'()*+,-./:;<=>?@[\\]^_`{|}~₫¥€§…]")),
            LengthLimitingTextInputFormatter(50),
          ];
        }

      case StepType.PHONE:
        return <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(30),
        ];

      case StepType.EMAIL:
        return <TextInputFormatter>[
          LengthLimitingTextInputFormatter(30),
        ];

      case StepType.NUMBER:
        return <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(30),
        ];

      case StepType.MULTIPLE_TEXT:
        return <TextInputFormatter>[
          LengthLimitingTextInputFormatter(200),
        ];

      default:
        return <TextInputFormatter>[
          LengthLimitingTextInputFormatter(30),
        ];
    }
  }

  void _onFocusChange(FocusNode focus, CheckInFlow item) {
    if (focus.hasFocus) {
      valueFocus = item.stepCode;
      notifyListeners();
    } else {
      keyList[item.index]?.currentState?.validate();
      valueFocus = '';
      notifyListeners();
    }
  }

  TextInputType getKeyBoardType(String type) {
    switch (type?.toUpperCase()) {
      case StepType.TEXT:
        return TextInputType.text;

      case StepType.PHONE:
        return TextInputType.number;

      case StepType.EMAIL:
        return TextInputType.emailAddress;

      case StepType.NUMBER:
        return TextInputType.number;

      case StepType.MULTIPLE_TEXT:
        return TextInputType.multiline;

      default:
        return TextInputType.text;
    }
  }

  void updateQuantity(int newValue, {bool isShowToast = true}) {
    quantity = newValue;
    validateQuantity(isShowToast: isShowToast);
    calculateTotalAmountNoDiscount();
    getDiscount();
    calculateTotalAmount();
    notifyListeners();
  }

  void validateQuantity({bool isShowToast = true}) {
    errorQuantity = null;
    if (quantity < min) {
      if (isShowToast) {
        errorQuantity = appLocalizations.minTicketError
            .replaceAll(Constants.replaceField, min.toInt().toString());
      } else {
        quantity = min.toInt();
      }
    } else {
      var remaining =
          ((remainInfor ?? -1) > 0 == true) ? remainInfor : Constants.MAX_INT;
      if (remaining >= max) {
        if (quantity > max) {
          errorQuantity = appLocalizations.maxTicketError
              .replaceAll(Constants.replaceField, max.toInt().toString());
        }
      } else {
        if (quantity > remaining) {
          errorQuantity = appLocalizations.remainTicketError
              .replaceAll(Constants.replaceField, remaining.toInt().toString());
        }
      }
    }
  }

  Future _requestCreateOrder() async {
    isLoading = true;
    notifyListeners();
    ETNewOrder newOrder = ETNewOrder.createWithFlow(textEditingControllers);
    newOrder.quantity = quantity.toDouble();
    newOrder.totalAmount = totalAmount.toDouble();
    newOrder.eventId = eventDetail.eventInfo.id;
    newOrder.amount = eventDetail?.ticketInfo?.ticketPrice ?? 0;
    newOrder.discountId = discountApply?.idBookingDiscount ?? 0;
    newOrder.paymentType = itemPayment.settingCode;
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      try {
        var newOrder = ETOrderInfo.fromJson(baseResponse.data["orderInfo"]);
        db.eTOrderInfoDAO.insertAll(List()..add(newOrder));
      } catch (_) {}
//      arguments["isReload"] = true;
      isLoading = false;
      notifyListeners();
      Utilities().showNoButtonDialog(
          context,
          DialogType.SUCCES,
          2,
          appLocalizations.inviteSuccessTitleNotify,
          appLocalizations.createOrderTicket, () {
        onClickLeft(context);
      });
    }, (message) {
      isLoading = false;
      notifyListeners();
      Utilities().showErrorPop(
          context, message.description, Constants.AUTO_HIDE_LONG, () {},
          callbackDismiss: () {});
    });
    await ApiRequest().requestCreateOrder(context, newOrder, callBack);
  }
}
