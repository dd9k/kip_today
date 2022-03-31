import 'package:json_annotation/json_annotation.dart';
import 'package:checkinpromobile/src/database/Database.dart';

part 'ETPayMentInfo.g.dart';

@JsonSerializable()
class ETPayMentInfo {
  @JsonKey(name: 'id')
  double idPayment;

  @JsonKey(name: 'eventId')
  double eventId;

  @JsonKey(name: 'paymentType')
  String paymentType;

  @JsonKey(name: 'accountName')
  String accountName;

  @JsonKey(name: 'accountNo')
  String accountNo;

  @JsonKey(name: 'bankName')
  String bankName;

  @JsonKey(name: 'bankBranchName')
  String bankBranchName;

  ETPayMentInfo.normal(
    this.idPayment,
    this.eventId,
    this.paymentType,
    this.accountName,
    this.accountNo,
    this.bankName,
    this.bankBranchName,
  );

  ETPayMentInfo(
    this.idPayment,
    this.eventId,
    this.paymentType,
    this.accountName,
    this.accountNo,
    this.bankName,
    this.bankBranchName,
  );

  ETPayMentInfo.local(
    this.idPayment,
    this.eventId,
    this.paymentType,
    this.accountName,
    this.accountNo,
    this.bankName,
    this.bankBranchName,
  );

  ETPayMentInfo.copyWithEntity(ETPayMentInfoAllEntry entry) {
    this.eventId = entry.eventId;
    this.paymentType = entry.paymentType;
    this.accountName = entry.accountName;
    this.accountNo = entry.accountNo;
    this.bankName = entry.bankName;
    this.bankBranchName = entry.bankBranchName;
  }

  factory ETPayMentInfo.fromJson(Map<String, dynamic> json) =>
      _$ETPayMentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ETPayMentInfoToJson(this);
}
