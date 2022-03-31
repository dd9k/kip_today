import 'package:json_annotation/json_annotation.dart';
import 'package:checkinpromobile/src/database/Database.dart';

part 'ETBookingDiscountInfo.g.dart';

@JsonSerializable()
class ETBookingDiscountInfo {
  @JsonKey(name: 'id')
  double idBookingDiscount;

  @JsonKey(name: 'ticketId')
  double ticketId;

  @JsonKey(name: 'discountValue')
  double discountValue;

  @JsonKey(name: 'discountUnit')
  String discountUnit;

  @JsonKey(name: 'bookingQuantity')
  double bookingQuantity;

  @JsonKey(ignore: true)
  bool isDummy = false;

  ETBookingDiscountInfo.normal(
    this.idBookingDiscount,
    this.ticketId,
    this.discountValue,
    this.discountUnit,
    this.bookingQuantity,
  );

  ETBookingDiscountInfo(
    this.idBookingDiscount,
    this.ticketId,
    this.discountValue,
    this.discountUnit,
    this.bookingQuantity,
  );

  ETBookingDiscountInfo.local(
    this.idBookingDiscount,
    this.ticketId,
    this.discountValue,
    this.discountUnit,
    this.bookingQuantity,
  );

  ETBookingDiscountInfo.copyWithEntity(ETBookingDiscountInfoAllEntry entry) {
    this.idBookingDiscount = entry.idBookingDiscount;
    this.ticketId = entry.ticketId;
    this.discountValue = entry.discountValue;
    this.discountUnit = entry.discountUnit;
    this.bookingQuantity = entry.bookingQuantity;
  }

  factory ETBookingDiscountInfo.fromJson(Map<String, dynamic> json) =>
      _$ETBookingDiscountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ETBookingDiscountInfoToJson(this);
}
