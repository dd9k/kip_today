import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/ETBookingDiscountInfo.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:checkinpromobile/src/database/Database.dart';

part 'ETTicketInfo.g.dart';

@JsonSerializable()
class ETTicketInfo {
  @JsonKey(name: 'id')
  double idTicketInfo;

  @JsonKey(name: 'eventId')
  double eventId;

  @JsonKey(name: 'remainingTicketQuantity')
  double remainingTicketQuantity;

  @JsonKey(name: 'ticketName')
  String ticketName;

  @JsonKey(name: 'ticketPrice')
  double ticketPrice;

  @JsonKey(name: 'isFree')
  double isFree;

  @JsonKey(name: 'ticketQuantity')
  double ticketQuantity;

  @JsonKey(name: 'maxQuantity')
  double maxQuantity;

  @JsonKey(name: 'minQuantity')
  double minQuantity;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'eventStartDate')
  String eventStartDate;

  @JsonKey(name: 'eventEndDate')
  String eventEndDate;

  @JsonKey(name: 'startDate')
  String startDate;

  @JsonKey(name: 'endDate')
  String endDate;

  @JsonKey(name: 'bookingDiscountInfo')
  List<ETBookingDiscountInfo> bookingDiscountInfo = List();

  ETTicketInfo.normal(
    this.idTicketInfo,
    this.eventId,
    this.remainingTicketQuantity,
    this.ticketName,
    this.ticketPrice,
    this.isFree,
    this.ticketQuantity,
    this.maxQuantity,
    this.minQuantity,
    this.description,
    this.eventStartDate,
    this.eventEndDate,
    this.startDate,
    this.endDate,
  );

  ETTicketInfo(
    this.idTicketInfo,
    this.eventId,
    this.remainingTicketQuantity,
    this.ticketName,
    this.ticketPrice,
    this.isFree,
    this.ticketQuantity,
    this.maxQuantity,
    this.minQuantity,
    this.description,
    this.eventStartDate,
    this.eventEndDate,
    this.startDate,
    this.endDate,
      this.bookingDiscountInfo,
  );

  ETTicketInfo.local(
    this.idTicketInfo,
    this.eventId,
    this.remainingTicketQuantity,
    this.ticketName,
    this.ticketPrice,
    this.isFree,
    this.ticketQuantity,
    this.maxQuantity,
    this.minQuantity,
    this.description,
    this.eventStartDate,
    this.eventEndDate,
    this.startDate,
    this.endDate,
  );
  ETTicketInfo.copyWithEntity(ETTicketInfoAllEntry entry) {
    this.idTicketInfo = entry.idTicketInfo;
    this.eventId = entry.eventId;
    this.remainingTicketQuantity = entry.remainingTicketQuantity;
    this.ticketName = entry.ticketName;
    this.ticketPrice = entry.ticketPrice;
    this.isFree = entry.isFree;
    this.ticketQuantity = entry.ticketQuantity;
    this.maxQuantity = entry.maxQuantity;
    this.minQuantity = entry.minQuantity;
    this.description = entry.description;
    this.eventStartDate = entry.eventStartDate;
    this.eventEndDate = entry.eventEndDate;
    this.startDate = entry.startDate;
    this.endDate = entry.endDate;
  }

  String getPriceString() {
    return Constants.formatCurrency.format(ticketPrice ?? 0);
  }

  factory ETTicketInfo.fromJson(Map<String, dynamic> json) =>
      _$ETTicketInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ETTicketInfoToJson(this);
}
