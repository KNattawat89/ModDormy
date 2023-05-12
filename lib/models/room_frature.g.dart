// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_frature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomFeature _$RoomFeatureFromJson(Map<String, dynamic> json) => RoomFeature(
      airConditioner: json['airc'] as bool,
      fan: json['fan'] as bool,
      furnished: json['furniture'] as bool,
      waterHeater: json['waterHeater'] as bool,
      tv: json['tv'] as bool,
      refrigerator: json['fridge'] as bool,
      bathroom: json['bathroom'] as bool,
    );

Map<String, dynamic> _$RoomFeatureToJson(RoomFeature instance) =>
    <String, dynamic>{
      'airc': instance.airConditioner,
      'fan': instance.fan,
      'furniture': instance.furnished,
      'waterHeater': instance.waterHeater,
      'tv': instance.tv,
      'fridge': instance.refrigerator,
      'bathroom': instance.bathroom,
    };
