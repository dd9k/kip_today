import 'package:json_annotation/json_annotation.dart';
import 'package:checkinpromobile/src/database/Database.dart';

part 'ETGuestInfo.g.dart';

@JsonSerializable()
class ETGuestInfo {
  @JsonKey(name: 'id')
  double idGuest;

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

  ETGuestInfo.normal(
    this.idGuest,
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.idCard,
    this.company,
    this.position,
  );

  ETGuestInfo(
    this.idGuest,
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.idCard,
    this.company,
    this.position,
  );

  ETGuestInfo.local(
    this.idGuest,
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.idCard,
    this.company,
    this.position,
  );

  ETGuestInfo.copyWithEntity(ETGuestInfoAllEntry entry) {
    this.idGuest = entry.idGuest;
    this.fullName = entry.fullName;
    this.emailAddress = entry.emailAddress;
    this.phoneNumber = entry.phoneNumber;
    this.idCard = entry.idCard;
    this.company = entry.company;
  }

  factory ETGuestInfo.fromJson(Map<String, dynamic> json) =>
      _$ETGuestInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ETGuestInfoToJson(this);
}
