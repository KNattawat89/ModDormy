import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moddormy_flutter/models/dorm.dart';
import 'package:moddormy_flutter/models/room.dart';
import 'package:moddormy_flutter/screens/room_detail.dart';

class ShowRoom extends StatelessWidget {
  final Room room;
  final Dorm dorm;
  final String ownerId;

  const ShowRoom(
      {super.key,
      required this.room,
      required this.dorm,
      required this.ownerId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          elevation: MaterialStateProperty.all<double>(0.0),
        ),
        onPressed: () {
          debugPrint("Room id: ${room.id}");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RoomDetail(
                        roomNo: room.id,
                        dorm: dorm,
                        ownerId: ownerId,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      "Room size: ${room.size}",
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      "${room.price} Baht/Month",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2A8089)),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
