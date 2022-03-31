import 'package:json_annotation/json_annotation.dart';
import 'package:checkinpromobile/src/database/Database.dart';

part 'ETPaymentType.g.dart';

@JsonSerializable()
class ETPaymentType {
  @JsonKey(name: 'eventId')
  double eventId;

  @JsonKey(name: 'value')
  String settingCode;

  @JsonKey(name: 'label')
  String settingValue;

  ETPaymentType.normal(
    this.eventId,
    this.settingCode,
    this.settingValue,
  );

  ETPaymentType(
    this.eventId,
    this.settingCode,
    this.settingValue,
  );

  ETPaymentType.local(
    this.eventId,
    this.settingCode,
    this.settingValue,
  );

  ETPaymentType.copyWithEntity(ETPaymentTypeAllEntry entry) {
    this.eventId = entry.eventId;
    this.settingCode = entry.settingCode;
    this.settingValue = entry.settingValue;
  }

  factory ETPaymentType.fromJson(Map<String, dynamic> json) =>
      _$ETPaymentTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ETPaymentTypeToJson(this);
}
