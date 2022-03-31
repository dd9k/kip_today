import 'package:checkinpromobile/src/model/Notification.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert' as convert;

@JsonSerializable()
class FirebaseNotification {
  @JsonKey(name: 'value')
  String value;

  @JsonKey(name: 'gcm.message_id')
  String messageId;

  @JsonKey(name: 'notification_id')
  String notificationId;

  @JsonKey(ignore: true)
  VisitorNotification infoVisitor;

  FirebaseNotification(this.notificationId, this.value, this.messageId, this.infoVisitor);

  FirebaseNotification._();
  factory FirebaseNotification.fromJson(Map<String, dynamic> json) {
    return FirebaseNotification(
        json['notification_id'] as String,
        json['value'] as String,
        json['gcm.message_id'] as String,
        VisitorNotification.fromJson(convert.json.decode(json['value'])));
  }
}
