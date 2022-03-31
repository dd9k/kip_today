import 'package:json_annotation/json_annotation.dart';

import 'NewVisitor.dart';

part 'ItemVisitor.g.dart';

@JsonSerializable()
class ItemVisitor {
  @JsonKey(name: 'fullName')
  String fullName;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'phoneNumber')
  String phoneNumber;

  @JsonKey(name: 'id')
  double id;

  @JsonKey(name: 'signIn')
  String signIn;

  @JsonKey(name: 'signOut')
  String signOut;

  @JsonKey(name: 'toCompany')
  String toCompany;

  @JsonKey(name: 'fromCompany')
  String fromCompany;

  @JsonKey(name: 'visitorTypeValue')
  String visitorTypeValue;

  @JsonKey(name: 'purpose')
  String purpose;

  @JsonKey(name: 'feedback')
  String feedback;

  @JsonKey(name: 'rating')
  int rating;

  @JsonKey(name: 'branchName')
  String brachName;

  @JsonKey(name: 'eventName')
  String evenName;

  @JsonKey(name: 'totalCount')
  double totalCount;

  @JsonKey(name: 'typeDescription')
  String typeDescription;

  @JsonKey(name: 'faceCaptureFile')
  String faceCaptureFile;

  @JsonKey(ignore: true)
  String nameImgLocal;

  @JsonKey(name: 'inviteCode')
  String inviteCode;

  ItemVisitor._();

  ItemVisitor(
      String fullName,
      String email,
      String phoneNumber,
      double id,
      String signIn,
      String signOut,
      String toCompany,
      String fromCompany,
      String visitorTypeValue,
      String purpose,
      String feedback,
      int rating,
      String brachName,
      String evenName,
      double totalCount,
      String typeDescription,
      String faceCaptureFile,
      String nameImgLocal,
      String inviteCode) {
    this.fullName = fullName;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.id = id;
    this.signIn = signIn;
    this.signOut = signOut;
    this.toCompany = toCompany;
    this.fromCompany = fromCompany;
    this.visitorTypeValue = visitorTypeValue;
    this.purpose = purpose;
    this.feedback = feedback;
    this.rating = rating;
    this.brachName = brachName;
    this.evenName = evenName;
    this.totalCount = totalCount;
    this.typeDescription = typeDescription;
    this.faceCaptureFile = faceCaptureFile;
    this.nameImgLocal = nameImgLocal;
    this.inviteCode = inviteCode;
  }

  ItemVisitor.insertLocal(
      this.fullName,
      this.email,
      this.phoneNumber,
      this.id,
      this.signIn,
      this.signOut,
      this.toCompany,
      this.fromCompany,
      this.visitorTypeValue,
      this.purpose,
      this.feedback,
      this.rating,
      this.brachName,
      this.evenName,
      this.totalCount,
      this.typeDescription,
      this.faceCaptureFile,
      this.nameImgLocal,
      this.inviteCode);

  ItemVisitor.local(
      this.fullName,
      this.email,
      this.phoneNumber,
      this.id,
      this.signIn,
      this.signOut,
      this.toCompany,
      this.fromCompany,
      this.visitorTypeValue,
      this.purpose,
      this.feedback,
      this.rating,
      this.brachName,
      this.evenName,
      this.totalCount,
      this.typeDescription,
      this.nameImgLocal);

  factory ItemVisitor.fromJson(Map<String, dynamic> json) =>
      _$ItemVisitorFromJson(json);

  Map<String, dynamic> toJson() => _$ItemVisitorToJson(this);
}
