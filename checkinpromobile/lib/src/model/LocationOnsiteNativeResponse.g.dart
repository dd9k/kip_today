// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocationOnsiteNativeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationOnsiteNativeResponse _$LocationOnsiteNativeResponseFromJson(
    Map<String, dynamic> json) {
  return LocationOnsiteNativeResponse(
    json['status'] as bool,
    json['location'] == null
        ? null
        : LocationOnsiteNative.fromJson(
            json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocationOnsiteNativeResponseToJson(
        LocationOnsiteNativeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'location': instance.locationOnsite,
    };
