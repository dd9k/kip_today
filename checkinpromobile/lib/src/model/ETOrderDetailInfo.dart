import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
part 'ETOrderDetailInfo.g.dart';

@JsonSerializable()
class ETOrderDetailInfo {
  @JsonKey(name: 'id')
  double id;

  @JsonKey(name: 'orderId')
  double orderId;

  @JsonKey(name: 'ticketId')
  double ticketId;

  @JsonKey(name: 'quantity')
  double quantity;

  @JsonKey(name: 'amount')
  double amount;

  @JsonKey(name: 'discountId')
  double discountId;

  @JsonKey(name: 'inviteCode')
  String inviteCode;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'ticketName')
  String ticketName;

  @JsonKey(name: 'ticketPrice')
  double ticketPrice;

  @JsonKey(name: 'ticketIsFree')
  double ticketIsFree;

  @JsonKey(name: 'ticketQuantity')
  double ticketQuantity;

  @JsonKey(name: 'ticketStartDate')
  String ticketStartDate;

  @JsonKey(name: 'ticketEndDate')
  String ticketEndDate;

  ETOrderDetailInfo(
    this.id,
    this.orderId,
    this.ticketId,
    this.quantity,
    this.amount,
    this.discountId,
    this.inviteCode,
    this.status,
    this.ticketName,
    this.ticketPrice,
    this.ticketIsFree,
    this.ticketQuantity,
    this.ticketStartDate,
    this.ticketEndDate,
  );

  ETOrderDetailInfo.copyWithEntity(ETOderDetailInfoEntry entry) {
    this.id = entry.id;
    this.orderId = entry.orderId;
    this.ticketId = entry.ticketId;
    this.quantity = entry.quantity;
    this.amount = entry.amount;
    this.discountId = entry.discountId;
    this.inviteCode = entry.inviteCode;
    this.status = entry.status;
    this.ticketName = entry.ticketName;
    this.ticketPrice = entry.ticketPrice;
    this.ticketIsFree = entry.ticketIsFree;
    this.ticketQuantity = entry.ticketQuantity;
    this.ticketStartDate = entry.ticketStartDate;
    this.ticketEndDate = entry.ticketEndDate;
  }

  ETOrderDetailInfo.local(
    this.id,
    this.orderId,
    this.ticketId,
    this.quantity,
    this.amount,
    this.discountId,
    this.inviteCode,
    this.status,
    this.ticketName,
    this.ticketPrice,
    this.ticketIsFree,
    this.ticketQuantity,
    this.ticketStartDate,
    this.ticketEndDate,
  );

  factory ETOrderDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$ETOrderDetailInfoFromJson(json);

  bool isUsed() {
    return status == "1";
  }

  double getTotalAMount() {
    return amount;
  }

  double getDiscoutnt() {
    return ((quantity * ticketPrice) - amount);
  }

  double getPriceTicket() {
    return ((quantity * ticketPrice));
  }

  String getAmountString() {
    return Constants.formatCurrency.format(getTotalAMount() ?? 0);
  }

  String getAmountDiscountString() {
    return Constants.formatCurrency
        .format(((quantity * ticketPrice) - amount) ?? 0);
  }

  String getPriceString() {
    return Constants.formatCurrency.format(ticketPrice ?? 0);
  }

  String getQuantityString() {
    return quantity.toInt().toString();
  }

  String getTotalAmountQuantityString() {
    return Constants.formatCurrency.format((quantity * ticketPrice) ?? 0);
  }

  Map<String, dynamic> toJson() => _$ETOrderDetailInfoToJson(this);
}
