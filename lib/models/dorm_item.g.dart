// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dorm_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DormItem _$DormItemFromJson(Map<String, dynamic> json) => DormItem(
      dormId: json['dorm_id'] as int,
      dormName: json['dorm_name'] as String,
      coverImage: json['cover_image'] as String,
      rating: json['rating'] as int,
      minPrice: json['min_price'] as int,
      maxPrice: json['max_price'] as int,
    );

Map<String, dynamic> _$DormItemToJson(DormItem instance) => <String, dynamic>{
      'dorm_id': instance.dormId,
      'dorm_name': instance.dormName,
      'cover_image': instance.coverImage,
      'rating': instance.rating,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
    };
