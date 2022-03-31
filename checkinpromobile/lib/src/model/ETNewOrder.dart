import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ETNewOrder.g.dart';

@JsonSerializable()
class ETNewOrder {
  @JsonKey(name: 'fullName')
  String fullName;

  @JsonKey(name: 'emailAddress')
  String emailAddress;

  @JsonKey(name: 'phoneNumber')
  String phoneNumber;

  @JsonKey(name: 'idCard')
  String idCard;

  @JsonKey(name: 'company')
  String company;

  @JsonKey(name: 'position')
  String position;

  @JsonKey(name: 'eventId')
  double eventId;

  @JsonKey(name: 'paymentType')
  String paymentType;

  @JsonKey(name: 'totalAmount')
  double totalAmount;

  @JsonKey(name: 'quantity')
  double quantity;

  @JsonKey(name: 'amount')
  double amount;

  @JsonKey(name: 'discountId')
  double discountId;


  ETNewOrder(this.fullName, this.emailAddress, this.phoneNumber, this.idCard, this.company, this.position, this.eventId,
      this.paymentType, this.totalAmount, this.quantity, this.amount, this.discountId);

  ETNewOrder.createWithFlow(Map<String, TextEditingController> checkInFlow) {
    checkInFlow.forEach((key, value) {
      switch (key) {
        case StepCode.FULL_NAME:
          {
            fullName = value.text;
            break;
          }
        case StepCode.PHONE_NUMBER:
          {
            phoneNumber = value.text;
            break;
          }
        case StepCode.EMAIL:
          {
            emailAddress = value.text;
            break;
          }
        case StepCode.ID_CARD:
          {
            idCard = value.text;
            break;
          }
        case StepCode.POSITION:
          {
            position = value.text;
            break;
          }
        case StepCode.COMPANY:
          {
            company = value.text;
            break;
          }
      }
    });
  }

  factory ETNewOrder.fromJson(Map<String, dynamic> json) =>
      _$ETNewOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ETNewOrderToJson(this);
}