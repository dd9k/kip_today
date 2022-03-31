import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

import 'ETOrderDetailInfo.dart';
part 'ETOrderInfo.g.dart';

@JsonSerializable()
class ETOrderInfo {
  @JsonKey(name: 'id')
  double id;

  @JsonKey(name: 'orderNo')
  String orderNo;

  @JsonKey(name: 'guestId')
  double guestId;

  @JsonKey(name: 'eventId')
  double eventId;

  @JsonKey(name: 'paymentType')
  String paymentType;

  @JsonKey(name: 'totalAmount')
  double totalAmount;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'totalQuantity')
  double quantity;

  @JsonKey(name: 'guestName')
  String guestName;

  @JsonKey(name: 'guestPhone')
  String guestPhone;

  @JsonKey(name: 'guestEmail')
  String guestEmail;

  @JsonKey(name: 'orderDetails')
  List<ETOrderDetailInfo> orderDetails;

  @JsonKey(ignore: true)
  bool isPaidByOwn;

  ETOrderInfo.copyWithEntity(ETOrderInfoEntry entry) {
    this.id = entry.id;
    this.orderNo = entry.orderNo;
    this.guestId = entry.guestId;
    this.eventId = entry.eventId;
    this.paymentType = entry.paymentType;
    this.totalAmount = entry.totalAmount;
    this.status = entry.status;
    this.quantity = entry.quantity;
    this.guestName = entry.guestName;
    this.guestPhone = entry.guestPhone;
    this.guestEmail = entry.guestEmail;
    this.isPaidByOwn = entry.isPaidByOwn;
  }

  ETOrderInfo(this.id, this.orderNo, this.guestId, this.eventId, this.paymentType, this.totalAmount, this.status,
      this.quantity, this.guestName, this.guestPhone, this.guestEmail, this.orderDetails);

  ETOrderInfo.local(this.id, this.orderNo, this.guestId, this.eventId, this.paymentType, this.totalAmount, this.status,
      this.quantity, this.guestName, this.guestPhone, this.guestEmail, this.isPaidByOwn);

  bool isPaid() {
    return status.toUpperCase() == OrderTicketStatus.PAID;
  }

  bool isUsed() {
    if (orderDetails?.isNotEmpty == true) {
      var numUsed = 0;
      orderDetails.forEach((element) {
        if (element.isUsed()) {
          numUsed++;
        }
      });
      return numUsed == orderDetails.length;
    }
    return true;
  }

  String getAmountString() {
    return Constants.formatCurrency.format(totalAmount ?? 0);
  }

  String getQuantityString() {
    return quantity.toInt().toString();
  }

  factory ETOrderInfo.fromJson(Map<String, dynamic> json) =>
      _$ETOrderInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ETOrderInfoToJson(this);
}
