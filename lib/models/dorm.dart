import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/models/dorm_feature.dart';
import 'package:moddormy_flutter/models/room.dart';

class Dorm {
  int id;
  String name;
  String houseNo;
  String soi;
  String street;
  String subDistrict;
  String district;
  String city;
  String zipCode;
  String description;
  String advPayment;
  String electric;
  String water;
  String other;
  DormFeature feature;
  XFile? coverImage;
  List<XFile> imageList = [];
  List<Room> rooms = [];

  Dorm({
    required this.id,
    required this.name,
    required this.houseNo,
    required this.soi,
    required this.street,
    required this.subDistrict,
    required this.district,
    required this.city,
    required this.zipCode,
    required this.description,
    required this.feature,
    required this.advPayment,
    required this.electric,
    required this.water,
    required this.other,
  });
}