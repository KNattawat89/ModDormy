// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['roomId'] as int,
      name: json['roomName'] as String,
      price: json['price'] as int,
      size: json['size'] as String,
      description: json['desc'] as String,
      feature:
          RoomFeature.fromJson(json['roomFeature'] as Map<String, dynamic>),
      coverimageString: json['coverImage'] as String,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'roomId': instance.id,
      'roomName': instance.name,
      'price': instance.price,
      'size': instance.size,
      'desc': instance.description,
      'roomFeature': instance.feature,
      'coverImage': instance.coverimageString,
    };
