import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moddormy_flutter/models/room_frature.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  @JsonKey(name: 'roomId')
  int id;

  @JsonKey(name: 'roomName')
  String name;

  @JsonKey(name: 'price')
  int price;

  @JsonKey(name: 'size')
  String size;

  @JsonKey(name: 'desc')
  String description;

  @JsonKey(name: 'roomFeature')
  RoomFeature feature;

  @JsonKey(name: 'coverImage')
  String coverimageString;

  @JsonKey(includeFromJson: false)
  XFile? coverImage;

  @JsonKey(includeFromJson: false)
  List<XFile> imageList = [];

  Room({
    required this.id,
    required this.name,
    required this.price,
    required this.size,
    required this.description,
    required this.feature,
    required this.coverimageString,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
