import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/provider/user_provider.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:moddormy_flutter/widgets/icon_feature_mapping.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import 'package:provider/provider.dart';
import '../models/dorm.dart';

class DetailScreen extends StatefulWidget {
  final bool post;
  const DetailScreen({super.key, required this.dorm, required this.post});
  final Dorm dorm;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String? dormCoverImage;
  void uploadDormCoverImage(XFile? file) async {
    try {
      String fileName = file!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final response =
          await Caller.dio.post("/api/upload/coverImage", data: formData);
      debugPrint(response.data);

      setState(() {
        dormCoverImage = response.data["image"];
      });
      // ignore: void_checks
      return response.data;
    } on DioError catch (e) {
      debugPrint('upload image error: ${e.response}');
    }
  }

  String? roomCoverImage;
  void uploadRoomCoverImage(XFile? file) async {
    try {
      String fileName = file!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final response =
          await Caller.dio.post("/api/upload/coverImage", data: formData);
      debugPrint(response.data);

      setState(() {
        roomCoverImage = response.data["image"];
      });
      // ignore: void_checks
      return response.data;
    } on DioError catch (e) {
      debugPrint('upload image error: ${e.response}');
    }
  }

  void postDormDetail() async {
    uploadDormCoverImage(widget.dorm.coverImage);
    try {
      final postdorm = await Caller.dio.post(
        "/api/manage-dorm/postDorm",
        data: {
          "DormName": widget.dorm.name,
          "UserId": uid, // ใส่ id ของ user ที่ login อยู่
          "CoverImage": dormCoverImage,
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
          "DormFeatures": {
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
        },
      );
      debugPrint(postdorm.data["id"].toString());

      // ignore: prefer_typing_uninitialized_variables, unused_local_variable
      var postroom;
      for (var i = 0; i < widget.dorm.rooms.length; i++) {
        uploadRoomCoverImage(widget.dorm.rooms[i].coverImage);
        postroom = await Caller.dio.post("/api/manage-room/postRoom", data: {
          "dormId": postdorm.data["id"],
          "roomName": widget.dorm.rooms[i].name,
          "coverImage": roomCoverImage,
          "price": widget.dorm.rooms[i].price,
          "desc": widget.dorm.rooms[i].description,
          "size": widget.dorm.rooms[i].size,
          "roomFeature": {
            "airc": widget.dorm.rooms[i].feature.airConditioner,
            "furniture": widget.dorm.rooms[i].feature.furnished,
            "waterHeater": widget.dorm.rooms[i].feature.waterHeater,
            "fan": widget.dorm.rooms[i].feature.fan,
            "fridge": widget.dorm.rooms[i].feature.furnished,
            "bathroom": widget.dorm.rooms[i].feature.bathroom,
            "tv": widget.dorm.rooms[i].feature.tv,
          }
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void updateDormDetail() async {
    if (widget.dorm.coverImage != null) {
      uploadDormCoverImage(widget.dorm.coverImage);
       final editeddorm = await Caller.dio.put(
        '/api/manage-dorm/editDorm?dormId=${widget.dorm.id}',
        data: {
          "cover_Image"
        });

    }
    try {
      final editeddorm = await Caller.dio.put(
        '/api/manage-dorm/editDorm?dormId=${widget.dorm.id}',
        data: {
          "dorm_name": widget.dorm.name,//"${widget.dorm.coverImage!.path}", // Upload รูป how?
          "house_number": widget.dorm.houseNo,
          "street": widget.dorm.street,
          "soi": widget.dorm.soi,
          "sub_district": widget.dorm.subDistrict,
          "district": widget.dorm.district,
          "city": widget.dorm.city,
          "zipcode": widget.dorm.zipCode,
          "desc": widget.dorm.description,
          "advance_payment": widget.dorm.advPayment,
          "electric_price": widget.dorm.electric,
          "water_price": widget.dorm.water,
          "other": widget.dorm.other,
          "distant": widget.dorm.distance,
          "DormFeatures": {
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
        },
      );
      debugPrint(editeddorm.data["id"].toString());

      // ignore: prefer_typing_uninitialized_variables
      var editedroom;
      for (var i = 0; i < widget.dorm.rooms.length; i++) {
        debugPrint(widget.dorm.rooms[i].id.toString());
        editedroom = await Caller.dio
            .put("/api/manage-room/editRoom?roomId=${widget.dorm.id}", data: {
          "dorm_id": widget.dorm.id,
          "room_Name": widget.dorm.rooms[i].name,
          "cover_Image": "xxxxxx",
          "price": 1223,
          "desc": widget.dorm.rooms[i].description,
          "size": widget.dorm.rooms[i].size,
          "roomFeature": {
            "airc": widget.dorm.rooms[i].feature.airConditioner,
            "furniture": widget.dorm.rooms[i].feature.furnished,
            "waterHeater": widget.dorm.rooms[i].feature.waterHeater,
            "fan": widget.dorm.rooms[i].feature.fan,
            "fridge": widget.dorm.rooms[i].feature.furnished,
            "bathroom": widget.dorm.rooms[i].feature.bathroom,
            "tv": widget.dorm.rooms[i].feature.tv,
          }
        });
        debugPrint(editedroom.data.toString());
      }
    } catch (e) {
      debugPrint('room error');
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
                                IconFeatureMapping(
                                    name: widget.dorm.feature.toList()[index]),
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
                                return Row(
                                  children: [
                                    IconFeatureMapping(
                                        name: widget.dorm.rooms[index].feature
                                            .roomFeatureToList()[j]),
                                    Text(
                                        '${widget.dorm.rooms[index].feature.roomFeatureToList()[j]} ',
                                        style: const TextStyle(fontSize: 18)),
                                  ],
                                );
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
                          if (widget.post) {
                            postDormDetail();
                          } else {
                            updateDormDetail();
                          }
                          if (widget.post) {
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
                                        backgroundColor:
                                            const Color(0xFFDC6E46),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Go to post'),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
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
                                  'Your dorm information has been updated!',
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFDC6E46),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Go to post'),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
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
