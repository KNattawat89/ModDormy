import 'package:image_picker/image_picker.dart';

class Room {
  String name;
  String price;
  String size;
  String description;
  bool fan;
  bool airConditioner;
  XFile? coverImage;
  List<XFile> imageList = [];

  Room({
    required this.name,
    required this.price,
    required this.size,
    required this.description,
    required this.fan,
    required this.airConditioner,
  });
}
