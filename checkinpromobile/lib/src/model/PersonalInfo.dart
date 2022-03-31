import 'package:json_annotation/json_annotation.dart';
part 'PersonalInfo.g.dart';

@JsonSerializable()
class PersonalInfo {
  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'phoneJson')
  String phoneJson;

  @JsonKey(name: 'fullName')
  String fullName;

  @JsonKey(name: 'firstName')
  String firstName;

  @JsonKey(name: 'lastName')
  String lastName;

  @JsonKey(name: 'avatarFileName')
  String avatarFileName;

  @JsonKey(name: 'avatarRepoId')
  String avatarRepoId;

  @JsonKey(name: 'gender')
  int gender;

  @JsonKey(name: 'actived')
  int actived;

  @JsonKey(name: 'locked')
  int locked;

  @JsonKey(name: 'birthDay')
  String birthDay;

  @JsonKey(name: 'nationality')
  String nationality;

  @JsonKey(name: 'language')
  String language;

  @JsonKey(name: 'mobileAvatar')
  String mobileAvatar;

  PersonalInfo(
      this.email,
      this.phone,
      this.phoneJson,
      this.fullName,
      this.firstName,
      this.lastName,
      this.avatarFileName,
      this.avatarRepoId,
      this.gender,
      this.actived,
      this.locked,
      this.birthDay,
      this.nationality,
      this.language,
      this.mobileAvatar);

  PersonalInfo._();

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);
}
