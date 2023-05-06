// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dorm_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DormItem _$DormItemFromJson(Map<String, dynamic> json) => DormItem(
      dormId: json['dorm_id'] as int,
      dormName: json['dorm_name'] as String,
      coverImage: json['cover_image'] as String,
      overallRate: json['overall_rate'] as int,
      minPrice: json['min_price'] as int,
      maxPrice: json['max_price'] as int,
      isFav: json['fav_status'] as bool,
    );

Map<String, dynamic> _$DormItemToJson(DormItem instance) => <String, dynamic>{
      'dorm_id': instance.dormId,
      'dorm_name': instance.dormName,
      'cover_image': instance.coverImage,
      'overall_rate': instance.overallRate,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'fav_status': instance.isFav,
    };
