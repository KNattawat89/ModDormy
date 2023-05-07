// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dorm_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DormFeature _$DormFeatureFromJson(Map<String, dynamic> json) => DormFeature(
      parking: json['parking'] as bool,
      wifi: json['wifi'] as bool,
      smokeFree: json['smokeFree'] as bool,
      securityGuard: json['securityGuard'] as bool,
      cctv: json['cctv'] as bool,
      keycard: json['keyCard'] as bool,
      lift: json['lift'] as bool,
      petFriendly: json['pet'] as bool,
      pool: json['pool'] as bool,
      fitness: json['fitness'] as bool,
    );

Map<String, dynamic> _$DormFeatureToJson(DormFeature instance) =>
    <String, dynamic>{
      'parking': instance.parking,
      'wifi': instance.wifi,
      'smokeFree': instance.smokeFree,
      'securityGuard': instance.securityGuard,
      'cctv': instance.cctv,
      'keyCard': instance.keycard,
      'lift': instance.lift,
      'pet': instance.petFriendly,
      'pool': instance.pool,
      'fitness': instance.fitness,
    };
