// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dorm_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDormList _$ProfileDormListFromJson(Map<String, dynamic> json) =>
    ProfileDormList(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProfileDorm.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileDormListToJson(ProfileDormList instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
