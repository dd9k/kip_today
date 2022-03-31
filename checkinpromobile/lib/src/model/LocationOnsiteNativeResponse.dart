import 'package:checkinpromobile/src/model/LocationOnsiteNative.dart';
import 'package:json_annotation/json_annotation.dart';

part 'LocationOnsiteNativeResponse.g.dart';

@JsonSerializable()
class LocationOnsiteNativeResponse {
  @JsonKey(name: 'status')
  bool status;

  @JsonKey(name: 'location')
  LocationOnsiteNative locationOnsite;

  LocationOnsiteNativeResponse(this.status, this.locationOnsite);

  factory LocationOnsiteNativeResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationOnsiteNativeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationOnsiteNativeResponseToJson(this);
}
