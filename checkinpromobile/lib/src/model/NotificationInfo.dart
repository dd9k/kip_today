import 'package:json_annotation/json_annotation.dart';
part 'NotificationInfo.g.dart';

@JsonSerializable()
class NotificationInfo {
  @JsonKey(name: 'pinHostScreen')
  int pinHostScreen;

  @JsonKey(name: 'pushEmail')
  int pushEmail;

  @JsonKey(name: 'pushNotification')
  int pushNotification;

  @JsonKey(name: 'fingerPrint')
  int fingerPrint;

  @JsonKey(name: 'viber')
  int viber;

  @JsonKey(name: 'zalo')
  int zalo;

  NotificationInfo(this.pinHostScreen, this.pushEmail, this.pushNotification,
      this.fingerPrint, this.viber, this.zalo);

  NotificationInfo._();

  factory NotificationInfo.fromJson(Map<String, dynamic> json) =>
      _$NotificationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationInfoToJson(this);
}
