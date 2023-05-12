import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moddormy_flutter/models/dorm_feature.dart';
import 'package:moddormy_flutter/models/room.dart';

part 'dorm.g.dart';

@JsonSerializable()
class Dorm {
  @JsonKey(name: 'dormId')
  int id;

  // @JsonKey(name: 'userId')
  // String ownerId;

  @JsonKey(name: 'dormName')
  String name;

  @JsonKey(name: 'houseNumber')
  String houseNo;

  @JsonKey(name: 'soi')
  String soi;

  @JsonKey(name: 'street')
  String street;

  @JsonKey(name: 'subDistrict')
  String subDistrict;

  @JsonKey(name: 'district')
  String district;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'zipcode')
  int zipCode;

  @JsonKey(name: 'desc')
  String description;

  @JsonKey(name: 'advancePayment')
  int advPayment;

  @JsonKey(name: 'electricPrice')
  double electric;

  @JsonKey(name: 'waterPrice')
  double water;

  @JsonKey(name: 'other')
  String other;

  @JsonKey(name: 'distant')
  double distance;

  @JsonKey(name: 'dormFeatures')
  DormFeature feature;

  @JsonKey(name: 'coverImage')
  String coverimageString;

  @JsonKey(includeFromJson: false)
  XFile? coverImage;

  @JsonKey(includeFromJson: false)
  List<XFile> imageList = [];

  @JsonKey(includeFromJson: false)
  List<Room> rooms = [];

  Dorm({
    required this.id,
    // required this.ownerId,
    required this.name,
    required this.houseNo,
    required this.soi,
    required this.street,
    required this.subDistrict,
    required this.district,
    required this.city,
    required this.zipCode,
    required this.description,
    required this.distance,
    required this.feature,
    required this.advPayment,
    required this.electric,
    required this.water,
    required this.other,
    required this.coverimageString,
  });

  factory Dorm.fromJson(Map<String, dynamic> json) => _$DormFromJson(json);

  Map<String, dynamic> toJson() => _$DormToJson(this);
}
