import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'VisitorCheckIn.g.dart';

@JsonSerializable()
class VisitorCheckIn {

  @JsonKey(name: 'id', defaultValue: 0.0)
  double id;

  @JsonKey(name: 'fullName')
  String fullName;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'phoneNumber')
  String phoneNumber;

  @JsonKey(name: 'idCard')
  String idCard;

  @JsonKey(name: 'purpose')
  String purpose;

  @JsonKey(name: 'visitorId')
  double visitorId;

  @JsonKey(name: 'visitorType')
  String visitorType;

  @JsonKey(name: 'fromCompany')
  String fromCompany;

  @JsonKey(name: 'toCompany')
  String toCompany;

  @JsonKey(name: 'contactPersonId')
  double contactPersonId;

  @JsonKey(name: 'faceCaptureRepoId')
  double faceCaptureRepoId;

  @JsonKey(name: 'signInBy')
  int signInBy;

  @JsonKey(name: 'signInType')
  String signInType = Constants.TYPE_CHECK;

  @JsonKey(ignore: true)
  String imagePath = "";

  @JsonKey(name: 'toCompanyId')
  double toCompanyId;

  VisitorCheckIn.inital();

  VisitorCheckIn(
      double id,
      String fullName,
      String email,
      String phoneNumber,
      String idCard,
      String purpose,
      double visitorId,
      String visitorType,
      String fromCompany,
      String toCompany,
      double contactPersonId,
      //File faceCaptureFile,
      double faceCaptureRepoId, int signInBy, double toCompanyId) {
    this.id = id;
    this.fullName = fullName;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.idCard = idCard;
    this.purpose = purpose;
    this.visitorId = visitorId;
    this.visitorType = visitorType;
    this.fromCompany = fromCompany;
    this.toCompany = toCompany;
    this.contactPersonId = contactPersonId;
    this.faceCaptureRepoId = faceCaptureRepoId;
    this.signInBy = signInBy;
    this.toCompanyId = toCompanyId;
  }

  VisitorCheckIn.temp(
      String fullName,
      String phoneNumber,) {
    this.fullName = fullName;
    this.phoneNumber = phoneNumber;
  }

  VisitorCheckIn.initPhone(String phone) {
    this.phoneNumber = phone;
  }

  factory VisitorCheckIn.fromJson(Map<String, dynamic> json) =>
      _$VisitorCheckInFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorCheckInToJson(this);


}
