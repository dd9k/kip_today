// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateEmployee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEmployee _$UpdateEmployeeFromJson(Map<String, dynamic> json) {
  return UpdateEmployee(
    email: json['email'] as String,
    phone: json['phone'] as String,
    phoneJson: json['phoneJson'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    gender: json['gender'] as int,
    fullAddress: json['fullAddress'] as String,
    country: json['country'] as String,
    stateProvince: json['stateProvince'] as String,
    city: json['city'] as String,
    postalCode: json['postalCode'] as String,
    locked: json['locked'] as int,
    nationality: json['nationality'] as String,
    pinHostScreen: json['pinHostScreen'] as int,
    smsNotification: json['smsNotification'] as int,
    pushEmail: json['pushEmail'] as int,
    pushNotification: json['pushNotification'] as int,
    employeeStatus: json['employeeStatus'] as String,
    joinDate: json['joinDate'] as String,
    jobTitle: json['jobTitle'] as int,
    department: json['department'] as int,
    office: (json['office'] as List)
        ?.map((e) =>
            e == null ? null : Office.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lineManager: json['lineManager'] as int,
    employmentType: json['employmentType'] as String,
    employeeType: json['employeeType'] as String,
    workingAddress: json['workingAddress'] as String,
    workingLocation: json['workingLocation'] as String,
    attendanceType: json['attendanceType'] as String,
    workPhoneExt: json['workPhoneExt'] as String,
    companyId: (json['companyId'] as num)?.toDouble(),
    currentUser: json['currentUser'] as String,
    password: json['password'] as String,
    fullName: json['fullName'] as String,
    actived: json['actived'] as int,
    zaloPasscode: json['zaloPasscode'] as String,
    viberPasscode: json['viberPasscode'] as String,
    passcode: json['passcode'] as String,
    activeLink: json['activeLink'] as String,
    activeType: json['activeType'] as String,
    activeExpiredDate: json['activeExpiredDate'] as String,
    id: json['id'] as int,
  )
    ..workPhoneJson = json['workPhoneJson'] as String
    ..workPhoneNumber = json['workPhoneNumber'] as String
    ..birthDay = json['birthDay'] as String
    ..language = json['language'] as String
    ..siteName = json['siteName'] as String;
}

Map<String, dynamic> _$UpdateEmployeeToJson(UpdateEmployee instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'phoneJson': instance.phoneJson,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'fullAddress': instance.fullAddress,
      'country': instance.country,
      'stateProvince': instance.stateProvince,
      'city': instance.city,
      'postalCode': instance.postalCode,
      'locked': instance.locked,
      'nationality': instance.nationality,
      'pinHostScreen': instance.pinHostScreen,
      'smsNotification': instance.smsNotification,
      'pushEmail': instance.pushEmail,
      'pushNotification': instance.pushNotification,
      'employeeStatus': instance.employeeStatus,
      'joinDate': instance.joinDate,
      'jobTitle': instance.jobTitle,
      'department': instance.department,
      'office': instance.office,
      'lineManager': instance.lineManager,
      'employmentType': instance.employmentType,
      'employeeType': instance.employeeType,
      'workingAddress': instance.workingAddress,
      'workingLocation': instance.workingLocation,
      'attendanceType': instance.attendanceType,
      'workPhoneExt': instance.workPhoneExt,
      'workPhoneJson': instance.workPhoneJson,
      'workPhoneNumber': instance.workPhoneNumber,
      'birthDay': instance.birthDay,
      'language': instance.language,
      'companyId': instance.companyId,
      'currentUser': instance.currentUser,
      'password': instance.password,
      'fullName': instance.fullName,
      'actived': instance.actived,
      'zaloPasscode': instance.zaloPasscode,
      'viberPasscode': instance.viberPasscode,
      'passcode': instance.passcode,
      'activeLink': instance.activeLink,
      'activeType': instance.activeType,
      'activeExpiredDate': instance.activeExpiredDate,
      'id': instance.id,
      'siteName': instance.siteName,
    };
