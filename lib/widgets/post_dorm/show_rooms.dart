import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moddormy_flutter/models/dorm.dart';
import 'package:moddormy_flutter/models/room.dart';
import 'package:moddormy_flutter/screens/room_detail.dart';

class ShowRoom extends StatelessWidget {
  final Room room;
  final Dorm dorm;
  const ShowRoom({super.key, required this.room, required this.dorm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: OutlinedButton(
        onPressed: () {
          debugPrint("Room id: " + room.id.toString());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RoomDetail(
                        roomNo: room.id,
                        dorm: dorm,
                      )));
        },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  room.coverimageString,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      room.name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      room.size,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      room.price.toString() + " Baht/Month",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 16, color: Colors.blueAccent),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
