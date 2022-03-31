// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocationOnsiteNative.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationOnsiteNative _$LocationOnsiteNativeFromJson(Map<String, dynamic> json) {
  return LocationOnsiteNative(
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    json['arriveDate'] == null
        ? null
        : DateTime.parse(json['arriveDate'] as String),
    json['departureDate'] == null
        ? null
        : DateTime.parse(json['departureDate'] as String),
    json['address'] as String,
  );
}

Map<String, dynamic> _$LocationOnsiteNativeToJson(
        LocationOnsiteNative instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'arriveDate': instance.arriveDate?.toIso8601String(),
      'departureDate': instance.departureDate?.toIso8601String(),
      'address': instance.address,
    };
