import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/models/room_frature.dart';

class Room {
  int id;
  String name;
  int price;
  String size;
  String description;
  RoomFeature feature;
  XFile? coverImage;
  List<XFile> imageList = [];

  Room({
    required this.id,
    required this.name,
    required this.price,
    required this.size,
    required this.description,
    required this.feature,
  });
}
