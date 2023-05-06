// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      review: json['review'] as String,
      ratingPrice: json['ratingPrice'] as int,
      ratingLocation: json['ratingLocation'] as int,
      ratingFacility: json['ratingFacility'] as int,
      ratingSanitary: json['ratingSanitary'] as int,
      ratingSecurity: json['ratingSecurity'] as int,
      ratingOverall: json['ratingOverall'] as int,
      userId: json['userId'] as String?,
      user: json['user'] == null
          ? null
          : UserItem.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      dormId: json['dormId'] as int,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'review': instance.review,
      'ratingPrice': instance.ratingPrice,
      'ratingLocation': instance.ratingLocation,
      'ratingFacility': instance.ratingFacility,
      'ratingSanitary': instance.ratingSanitary,
      'ratingSecurity': instance.ratingSecurity,
      'ratingOverall': instance.ratingOverall,
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'user': instance.user,
      'dormId': instance.dormId,
    };
