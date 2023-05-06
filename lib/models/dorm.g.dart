// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dorm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dorm _$DormFromJson(Map<String, dynamic> json) => Dorm(
      id: json['dormId'] as int,
      name: json['dormName'] as String,
      houseNo: json['houseNumber'] as String,
      soi: json['soi'] as String,
      street: json['street'] as String,
      subDistrict: json['subDistrict'] as String,
      district: json['district'] as String,
      city: json['city'] as String,
      zipCode: json['zipcode'] as int,
      description: json['desc'] as String,
      distance: (json['distant'] as num).toDouble(),
      feature:
          DormFeature.fromJson(json['dormFeatures'] as Map<String, dynamic>),
      advPayment: json['advancePayment'] as int,
      electric: (json['electricPrice'] as num).toDouble(),
      water: (json['waterPrice'] as num).toDouble(),
      other: json['other'] as String,
      coverimageString: json['coverImage'] as String,
    );

Map<String, dynamic> _$DormToJson(Dorm instance) => <String, dynamic>{
      'dormId': instance.id,
      'dormName': instance.name,
      'houseNumber': instance.houseNo,
      'soi': instance.soi,
      'street': instance.street,
      'subDistrict': instance.subDistrict,
      'district': instance.district,
      'city': instance.city,
      'zipcode': instance.zipCode,
      'desc': instance.description,
      'advancePayment': instance.advPayment,
      'electricPrice': instance.electric,
      'waterPrice': instance.water,
      'other': instance.other,
      'distant': instance.distance,
      'dormFeatures': instance.feature,
      'coverImage': instance.coverimageString,
    };
