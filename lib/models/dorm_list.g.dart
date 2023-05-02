// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dorm_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DormList _$DormListFromJson(Map<String, dynamic> json) => DormList(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => DormItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DormListToJson(DormList instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
