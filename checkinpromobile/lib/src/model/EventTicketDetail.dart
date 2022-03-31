import 'package:checkinpromobile/src/model/ETPaymentType.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ETBookingConfigInfor.dart';
import 'ETOrderInfo.dart';
import 'ETPayMentInfo.dart';
import 'ETTicketInfo.dart';
import 'EventTicket.dart';

part 'EventTicketDetail.g.dart';

@JsonSerializable()
class EventTicketDetail {
  @JsonKey(name: 'eventInfo')
  EventTicket eventInfo;

  @JsonKey(name: 'ticketInfo')
  ETTicketInfo ticketInfo;

  @JsonKey(name: 'paymentInfo')
  ETPayMentInfo paymentInfo;

  @JsonKey(name: 'settingInfo')
  ETBookingConfigInfor settingInfo;

  @JsonKey(name: 'orderInfo')
  List<ETOrderInfo> orderInfo;

  @JsonKey(name: 'paymentTypes')
  List<ETPaymentType> paymentTypes;

  EventTicketDetail.init();

  EventTicketDetail(this.eventInfo, this.ticketInfo, this.paymentInfo, this.settingInfo, this.orderInfo, this.paymentTypes);

  factory EventTicketDetail.fromJson(Map<String, dynamic> json) => _$EventTicketDetailFromJson(json);

  Map<String, dynamic> toJson() => _$EventTicketDetailToJson(this);

  bool isEventExpired() {
    DateTime now = DateTime.now();
    var endDate = DateTime.parse(eventInfo?.endDate ?? now.subtract(Duration(minutes: 1)).toString());
    if (endDate.isBefore(now)) {
      return true;
    }
    return false;
  }

  bool isEventNotStart() {
    DateTime now = DateTime.now();
    var startDate = DateTime.parse(eventInfo?.startDate ?? now.add(Duration(minutes: 1)).toString());
    var convertDate = Utilities().createWithDateTime(startDate, now);
    if (convertDate.isAfter(now)) {
      return true;
    }
    return false;
  }
}