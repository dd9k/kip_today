import 'package:json_annotation/json_annotation.dart';

part 'LocationOnsiteNative.g.dart';

@JsonSerializable()
class LocationOnsiteNative {
  @JsonKey(name: 'latitude')
  double latitude;

  @JsonKey(name: 'longitude')
  double longitude;

  @JsonKey(name: 'arriveDate')
  DateTime arriveDate;

  @JsonKey(name: 'departureDate')
  DateTime departureDate;

  @JsonKey(name: 'address')
  String address;

  LocationOnsiteNative(this.latitude, this.longitude, this.arriveDate,
      this.departureDate, this.address);

  factory LocationOnsiteNative.fromJson(Map<String, dynamic> json) =>
      _$LocationOnsiteNativeFromJson(json);

  Map<String, dynamic> toJson() => _$LocationOnsiteNativeToJson(this);
}
