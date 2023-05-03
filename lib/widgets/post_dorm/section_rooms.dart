import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_rooms_item.dart';

import '../../models/dorm.dart';
import '../../models/room.dart';
import '../../models/room_frature.dart';

class RoomsSection extends StatefulWidget {
  final Dorm dorm;

  const RoomsSection({Key? key, required this.dorm}) : super(key: key);

  @override
  State<RoomsSection> createState() => _RoomsSectionState();
}

class _RoomsSectionState extends State<RoomsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (var room in widget.dorm.rooms) RoomItem(room: room),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.grey[500]),
              onPressed: () {
                setState(() {
                  widget.dorm.rooms.add(Room(
                      name: "Room ${widget.dorm.rooms.length + 1}",
                      price: "",
                      size: '',
                      description: "",
                      feature: RoomFeature(
                        airConditioner: false,
                        fan: false,
                        furnished: false,
                        waterHeater: false,
                        tv: false,
                        refrigerator: false,
                        bathroom: false,
                      )));
                });
              },
              child: const Text("Add Room"),
            ),
          ),
        ]);
  }
}
