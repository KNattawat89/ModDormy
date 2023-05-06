import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm.dart';
import 'package:moddormy_flutter/models/dorm_feature.dart';
import 'package:moddormy_flutter/models/room.dart';
import 'package:moddormy_flutter/models/room_frature.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import 'package:moddormy_flutter/widgets/post_dorm/dorm_form.dart';

class EditForm extends StatefulWidget {
  const EditForm({super.key});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  Dorm dorm = Dorm(
    id: 89,
    name: 'Old dorm name',
    houseNo: '123',
    soi: '123/412',
    street: 'dsfawdaw',
    subDistrict: '1123123',
    district: 'plplasd',
    city: 'bkk',
    zipCode: 12345,
    description: 'sdadasdasdasdasdasdasd',
    advPayment: 0,
    electric: 0,
    water: 0,
    other: 'none',
    distance: 0,
    feature: DormFeature(
      cctv: false,
      fitness: false,
      keycard: false,
      lift: false,
      parking: false,
      petFriendly: false,
      pool: false,
      securityGuard: false,
      smokeFree: false,
      wifi: false,
    ),
  );
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 2; i++) {
      dorm.rooms.add(Room(
          id: 98,
          name: "old name$i",
          price: 12314,
          size: "size",
          description: "description",
          feature: RoomFeature(
            airConditioner: false,
            fan: false,
            furnished: false,
            waterHeater: false,
            tv: false,
            refrigerator: false,
            bathroom: false,
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("edit dorm");
    return Scaffold(
      backgroundColor: const Color(0xfffff9f0),
      appBar: const MyAppbar(),
      endDrawer: const MyDrawer(),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          child: ListView(
            shrinkWrap: true,
            children: [
              DormForm(
                dorm: dorm,
                post: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
