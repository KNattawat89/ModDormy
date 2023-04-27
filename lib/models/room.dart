import 'package:image_picker/image_picker.dart';

class Room {
  String roomName;
  String price;
  String roomSize;
  String roomDesc;
  XFile coverImage;
  List<XFile> imageList;
  List<String> roomFeature;

  Room(
      {required this.roomName,
      required this.price,
      required this.roomSize,
      required this.roomDesc,
      required this.coverImage,
      required this.imageList,
      required this.roomFeature});
}
