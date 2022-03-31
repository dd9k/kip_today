import 'package:checkinpromobile/src/database/Database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'WelcomeMessage.g.dart';

@JsonSerializable()
class WelcomeMessage {

  static const String TYPE_IN = "CHECK-IN";
  static const String TYPE_OUT = "CHECK-OUT";

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'messageContent')
  String messageContent;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'locationId')
  double locationId;

  @JsonKey(name: 'companyId')
  double companyId;

  WelcomeMessage._();

  WelcomeMessage.copyWithEntry(WelcomeMessageEntry entry) {
    this.id = entry.id;
    this.messageContent = entry.messageContent;
    this.type = entry.type;
    this.locationId = entry.locationId;
    this.companyId = entry.companyId;
  }

  WelcomeMessage(this.id, this.messageContent, this.type, this.locationId, this.companyId);

  factory WelcomeMessage.fromJson(Map<String, dynamic> json) =>
      _$WelcomeMessageFromJson(json);
}
