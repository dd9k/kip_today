import 'dart:convert';

import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert' as convert;

@JsonSerializable()
class Notification {
  @JsonKey(name: 'id')
  int identifierNotification;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'isRead')
  int isRead;

  @JsonKey(name: 'data')
  String data;

  @JsonKey(name: 'jsonData')
  String jsonData;

  @JsonKey(name: 'tokenType')
  String tokenType;

  @JsonKey(name: 'created_Date')
  String createdDate;

  @JsonKey(ignore: true)
  VisitorNotification infoVisitor;

  String getDate(AppLocalizations appLocalizations) {
    try {
      Map<String, dynamic> json = JsonDecoder().convert(jsonData);
      String signIn = json['SignIn'] as String;
      return locator<Utilities>().formatDate(signIn, Constants.FORMAT_STRING_DATE);
    } catch (e) {
      try {
        return locator<Utilities>().formatDate(createdDate, Constants.FORMAT_STRING_DATE);
      } catch (e) {
        return appLocalizations.noneContent;
      }
    }
  }

  Notification(this.identifierNotification, this.title, this.isRead, this.data,
      this.jsonData, this.tokenType, this.createdDate,
      {this.infoVisitor});
  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      json['id'] as int,
      json['title'] as String,
      json['isRead'] as int,
      json['data'] as String,
      json['jsonData'] as String,
      json['tokenType'] as String,
      json['created_Date'] as String,
      infoVisitor:
          VisitorNotification.fromJson(convert.json.decode(json['jsonData'])),
    );
  }
}

@JsonSerializable()
class VisitorNotification {
  @JsonKey(name: 'FullName')
  String fullName;

  @JsonKey(name: 'Email')
  String email;

  @JsonKey(name: 'FaceCaptureFile')
  String faceCaptureFile;

  @JsonKey(name: 'PhoneNumber')
  String phoneNumber;

  @JsonKey(name: 'SiteName')
  String siteName;

  @JsonKey(name: 'FromCompany')
  String fromCompany;

  @JsonKey(name: 'SignIn')
  String signIn;

  VisitorNotification(this.fullName, this.email, this.faceCaptureFile,
      this.phoneNumber, this.siteName, this.fromCompany, this.signIn);

  factory VisitorNotification.fromJson(Map<String, dynamic> json) {
    return VisitorNotification(
        json['FullName'] as String,
        json['Email'] as String,
        json['FaceCaptureFile'] as String,
        json['PhoneNumber'] as String,
        json['SiteName'] as String,
        json['FromCompany'] as String,
        json['SignIn'] as String);
  }
}
