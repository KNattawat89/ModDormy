// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dorm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDorm _$ProfileDormFromJson(Map<String, dynamic> json) => ProfileDorm(
      dormId: json['dormId'] as int,
      dormName: json['dormName'] as String,
      coverImage: json['coverImage'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ProfileDormToJson(ProfileDorm instance) =>
    <String, dynamic>{
      'dormId': instance.dormId,
      'dormName': instance.dormName,
      'coverImage': instance.coverImage,
      'createdAt': instance.createdAt.toIso8601String(),
    };
