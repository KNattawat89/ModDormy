// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserItem _$UserItemFromJson(Map<String, dynamic> json) => UserItem(
      userId: json['id'] as String,
      profileImage: json['profile_image'] as String?,
      username: json['username'] as String,
      firstname: json['fname'] as String,
      lastname: json['lname'] as String,
      email: json['email'] as String,
      telephone: json['tel'] as String?,
      lineId: json['line_id'] as String?,
      userType: json['user_type'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserItemToJson(UserItem instance) => <String, dynamic>{
      'id': instance.userId,
      'profile_image': instance.profileImage,
      'username': instance.username,
      'fname': instance.firstname,
      'lname': instance.lastname,
      'email': instance.email,
      'tel': instance.telephone,
      'line_id': instance.lineId,
      'user_type': instance.userType,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
