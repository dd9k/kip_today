import 'package:json_annotation/json_annotation.dart';

part 'IntegrationSettingInfo.g.dart';

@JsonSerializable()
class IntegrationSettingInfo {
  @JsonKey(name: 'zalo')
  int zalo;

  @JsonKey(name: 'viber')
  int viber;


  IntegrationSettingInfo._();

  IntegrationSettingInfo(int zalo, int viber){
    this.zalo = zalo;
    this.viber = viber;
  }

  factory IntegrationSettingInfo.fromJson(Map<String, dynamic> json) => _$IntegrationSettingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IntegrationSettingInfoToJson(this);

}