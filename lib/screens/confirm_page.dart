import 'dart:io';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import '../models/dorm.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.dorm});
  final Dorm dorm;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  void postDormDetail() async {
    try {
      final postdorm = await Caller.dio.post(
        "/api/manage-dorm/postDorm",
        data: {
          "DormName": widget.dorm.name,
          "UserId":
              "aH5CdH3VqlS1vVeqJ20WFKvGvmo2", // ใส่ id ของ user ที่ login อยู่
          "CoverImage":
              "xxxxxx", //"${widget.dorm.coverImage!.path}", // Upload รูป how?
          "HouseNumber": widget.dorm.houseNo,
          "Street": widget.dorm.street,
          "Soi": widget.dorm.soi,
          "SubDistrict": widget.dorm.subDistrict,
          "District": widget.dorm.district,
          "City": widget.dorm.city,
          "Zipcode": widget.dorm.zipCode,
          "Desc": widget.dorm.description,
          "AdvancePayment": widget.dorm.advPayment,
          "ElectricPrice": widget.dorm.electric,
          "WaterPrice": widget.dorm.water,
          "Other": widget.dorm.other,
          "Distant": widget.dorm.distance,
          "Pet": widget.dorm.feature.petFriendly,
          "SmokeFree": widget.dorm.feature.smokeFree,
          "Parking": widget.dorm.feature.parking,
          "Lift": widget.dorm.feature.lift,
          "Pool": widget.dorm.feature.pool,
          "Fitness": widget.dorm.feature.fitness,
          "Wifi": widget.dorm.feature.wifi,
          "KeyCard": widget.dorm.feature.keycard,
          "CCTV": widget.dorm.feature.cctv,
          "SecurityGuard": widget.dorm.feature.securityGuard,
        },
      );
      debugPrint(postdorm.data["id"].toString());

      // ignore: prefer_typing_uninitialized_variables
      var postroom;
      for (var i = 0; i < widget.dorm.rooms.length; i++) {
        postroom = await Caller.dio.post("/api/manage-room/postRoom", data: {
          "dormId": postdorm.data["id"],
          "roomName": widget.dorm.rooms[i].name,
          "coverImage": "xxxxxx",
          "price": 1223,
          "desc": widget.dorm.rooms[i].description,
          "size": widget.dorm.rooms[i].size,
          "airc": widget.dorm.rooms[i].feature.airConditioner,
          "furniture": widget.dorm.rooms[i].feature.furnished,
          "waterHeater": widget.dorm.rooms[i].feature.waterHeater,
          "fan": widget.dorm.rooms[i].feature.fan,
          "fridge": widget.dorm.rooms[i].feature.furnished,
          "bathroom": widget.dorm.rooms[i].feature.bathroom,
          "tv": widget.dorm.rooms[i].feature.tv,
        });
      }
      debugPrint(postroom.data.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff9f0),
      appBar: const MyAppbar(),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                'Dorm Information',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 120,
                    child: Text(
                      'Dorm name :',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    widget.dorm.name,
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text(
                      'Address :',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${widget.dorm.houseNo} ${widget.dorm.soi} ${widget.dorm.street} ${widget.dorm.subDistrict} ${widget.dorm.district} ${widget.dorm.city} ${widget.dorm.zipCode}',
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                      softWrap: true,
                      maxLines: 10,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dorm Description :',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      widget.dorm.description,
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                  const Text(
                    'Cover Images :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Center(
                    child: Image.file(
                      File(widget.dorm.coverImage!.path),
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const Text(
                    'Images :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: GridView.builder(
                        itemCount: widget.dorm.imageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(
                              File(widget.dorm.imageList[index].path),
                              fit: BoxFit.cover,
                              width: 200,
                              height: 200,
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Dorm Features :',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                        child: Row(
                          children: [
                            const Icon(Icons.location_pin),
                            Text(
                                ' Distance away from KMUTT\n${widget.dorm.distance} KM',
                                style: const TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 0, 32),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.dorm.feature.toList().length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                const Icon(Icons.check),
                                Text(' ${widget.dorm.feature.toList()[index]} ',
                                    style: const TextStyle(fontSize: 18)),
                              ],
                            );
                          },
                        ),
                      ),
                      const Text(
                        'Contract Detail',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Advance payment : ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${widget.dorm.advPayment} months',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Electric price : ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${widget.dorm.electric} baht/unit',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Water price :',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${widget.dorm.water} baht/unit',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Other : ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.dorm.other,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 5,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.dorm.rooms.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Room name : ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            widget.dorm.rooms[index].name,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 20),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Row(
                          children: [
                            const Icon(Icons.wallet_rounded),
                            const Text(
                              'Price : ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${widget.dorm.rooms[index].price}',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                        child: Row(
                          children: [
                            const Icon(Icons.expand_sharp),
                            const Text(
                              'Room size : ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.dorm.rooms[index].size,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Room Description : ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                widget.dorm.rooms[index].description,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 20),
                              ),
                            ),
                          ]),
                      const Text(
                        'Cover Images :',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Center(
                        child: Image.file(
                          File(widget.dorm.rooms[index].coverImage!.path),
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const Text(
                        'Images :',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: GridView.builder(
                            itemCount: widget.dorm.imageList.length,
                            itemBuilder: (BuildContext context, int j) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                  File(widget
                                      .dorm.rooms[index].imageList[j].path),
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 200,
                                ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Room Features :',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.dorm.rooms[index].feature
                                  .roomFeatureToList()
                                  .length,
                              itemBuilder: (BuildContext context, int j) {
                                return Text(
                                    '${widget.dorm.rooms[index].feature.roomFeatureToList()[j]} ',
                                    style: const TextStyle(fontSize: 18));
                              },
                            ),
                          ),
                          const Divider(
                            thickness: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 170,
                    height: 40,
                    child: FloatingActionButton.extended(
                        heroTag: "btn1",
                        backgroundColor: Colors.grey,
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        label: const Text('Back')),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 170,
                    height: 40,
                    child: FloatingActionButton.extended(
                        heroTag: "btn2",
                        backgroundColor: const Color(0xFFDC6E46),
                        onPressed: () {
                          postDormDetail();
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: const Color(0xFFD9D9D9),
                              title: const Icon(
                                Icons.verified_rounded,
                                color: Color(0xff2a8089),
                                size: 100,
                              ),
                              content: const Text(
                                'Your dorm information has been posted!',
                                textAlign: TextAlign.center,
                              ),
                              actions: <Widget>[
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFDC6E46),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Go to post'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        label: const Text('Confirm')),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
