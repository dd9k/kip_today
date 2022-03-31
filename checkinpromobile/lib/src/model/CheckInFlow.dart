import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/ETNewOrder.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'VisitorCheckIn.dart';

part 'CheckInFlow.g.dart';

enum RequestType { ALWAYS, ALWAYS_NO, FIRST, FIRST_NO, HIDDEN }

@JsonSerializable()
class CheckInFlow {
  @JsonKey(name: 'stepName')
  String stepName;

  @JsonKey(name: 'stepCode')
  String stepCode;

  @JsonKey(name: 'stepType')
  String stepType;

  @JsonKey(name: 'isRequired')
  bool isRequired;

  @JsonKey(name: 'sort')
  int sort;

  @JsonKey(ignore: true)
  int index = 0;

  @JsonKey(ignore: true)
  String initValue = '';

  @JsonKey(name: "isShow")
  bool isShow = true;

  CheckInFlow._();

  CheckInFlow(
      this.stepName, this.stepCode, this.stepType, this.isRequired, this.sort, this.isShow);

  factory CheckInFlow.fromJson(Map<String, dynamic> json) => _$CheckInFlowFromJson(json);

  RequestType getRequestType() {
    if (isRequired && (stepCode == StepCode.FULL_NAME || stepCode == StepCode.PHONE_NUMBER)) {
      return RequestType.ALWAYS;
    }
    return RequestType.ALWAYS_NO;
  }

  String buildInitValue(BuildContext context, ETNewOrder newOrder) {
    var initValue = "";
    switch (stepCode) {
      case StepCode.FULL_NAME:
        {
          initValue = newOrder.fullName ?? "";
          break;
        }
      case StepCode.PHONE_NUMBER:
        {
          initValue = newOrder.phoneNumber ?? "";
          break;
        }
      case StepCode.EMAIL:
        {
          initValue = newOrder.emailAddress ?? "";
          break;
        }
      case StepCode.ID_CARD:
        {
          initValue = newOrder.idCard ?? "";
          break;
        }
      case StepCode.POSITION:
        {
          initValue = newOrder.position ?? "";
          break;
        }
      case StepCode.COMPANY:
        {
          initValue = newOrder.company ?? "";
          break;
        }
      default:
        {
          initValue = "";
          break;
        }
    }
    return initValue;
  }

  String getStepName(AppLocalizations appLocalizations) {
    switch (stepCode) {
      case StepCode.FULL_NAME:
        {
          return appLocalizations.fullname;
        }
      case StepCode.PHONE_NUMBER:
        {
          return appLocalizations.numberphone;
        }
      case StepCode.EMAIL:
        {
          return appLocalizations.email;
        }
      case StepCode.ID_CARD:
        {
          return appLocalizations.idCardText;
        }
      case StepCode.POSITION:
        {
          return appLocalizations.position;
        }
      case StepCode.COMPANY:
        {
          return appLocalizations.company;
        }
      default:
        {
          return appLocalizations.fullname;
        }
    }
  }
}
