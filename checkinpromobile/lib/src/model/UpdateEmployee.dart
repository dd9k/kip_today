import 'package:json_annotation/json_annotation.dart';

import 'Office.dart';
part 'UpdateEmployee.g.dart';

@JsonSerializable()
class UpdateEmployee{

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'phoneJson')
  String phoneJson;

  @JsonKey(name: 'firstName')
  String firstName;

  @JsonKey(name: 'lastName')
  String lastName;

  @JsonKey(name: 'gender')
  int gender;

  @JsonKey(name: 'fullAddress')
  String fullAddress;

  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'stateProvince')
  String stateProvince;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'postalCode')
  String postalCode;

  @JsonKey(name: 'locked')
  int locked;

  @JsonKey(name: 'nationality')
  String nationality;

  @JsonKey(name: 'pinHostScreen')
  int pinHostScreen;

  @JsonKey(name: 'smsNotification')
  int smsNotification;

  @JsonKey(name: 'pushEmail')
  int pushEmail;

  @JsonKey(name: 'pushNotification')
  int pushNotification;

  @JsonKey(name: 'employeeStatus')
  String employeeStatus;

  @JsonKey(name: 'joinDate')
  String joinDate;

  @JsonKey(name: 'jobTitle')
  int jobTitle;

  @JsonKey(name: 'department')
  int department;

  @JsonKey(name: 'office')
  List<Office>  office;

  @JsonKey(name: 'lineManager')
  int lineManager;

  @JsonKey(name: 'employmentType')
  String employmentType;

  @JsonKey(name: 'employeeType')
  String employeeType;

  @JsonKey(name: 'workingAddress')
  String workingAddress;

  @JsonKey(name: 'workingLocation')
  String workingLocation;

  @JsonKey(name: 'attendanceType')
  String attendanceType;

  @JsonKey(name: 'workPhoneExt')
  String workPhoneExt;

  @JsonKey(name: 'workPhoneJson')
  String workPhoneJson;

  @JsonKey(name: 'workPhoneNumber')
  String workPhoneNumber;

  @JsonKey(name: 'birthDay')
  String birthDay;


  @JsonKey(name: 'language')
  String language;

  @JsonKey(name:'companyId')
  double companyId;

  @JsonKey(name:'currentUser')
  String currentUser;

  @JsonKey(name:'password')
  String password;

  @JsonKey(name:'fullName')
  String fullName;

  @JsonKey(name:'actived')
  int actived;

  @JsonKey(name:'zaloPasscode')
  String zaloPasscode;

  @JsonKey(name:'viberPasscode')
  String viberPasscode;

  @JsonKey(name:'passcode')
  String passcode;

  @JsonKey(name:'activeLink')
  String activeLink;

  @JsonKey(name:'activeType')
  String activeType;

  @JsonKey(name:'activeExpiredDate')
  String activeExpiredDate;

  @JsonKey(name:'id')
  int id;

  @JsonKey(name:'siteName')
  String siteName;


  UpdateEmployee({this.email, this.phone, this.phoneJson, this.firstName, this.lastName, this.gender, this.fullAddress, this.country,
      this.stateProvince, this.city, this.postalCode, this.locked, this.nationality, this.pinHostScreen, this.smsNotification, this.pushEmail,
      this.pushNotification, this.employeeStatus, this.joinDate, this.jobTitle, this.department, this.office, this.lineManager,  this.employmentType,
      this.employeeType, this.workingAddress, this.workingLocation, this.attendanceType, this.workPhoneExt, this.companyId, this.currentUser, this.password,
      this.fullName, this.actived, this.zaloPasscode, this.viberPasscode, this.passcode, this.activeLink, this.activeType, this.activeExpiredDate, this.id});

  UpdateEmployee.Update(String fullName, String email, String phone, double companyId, String address){
    this.fullAddress = address;
    this.fullName = fullName;
    this.email = email;
    this.phone = phone;
    this.companyId = companyId;
  }
  UpdateEmployee._();


  factory UpdateEmployee.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateEmployeeToJson(this);
}