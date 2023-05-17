import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:moddormy_flutter/models/image.dart';
import 'package:moddormy_flutter/screens/splash.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:moddormy_flutter/widgets/icon_feature_mapping.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import 'package:moddormy_flutter/widgets/post_dorm/show_room_conf.dart';
import '../models/dorm.dart';

class DetailScreen extends StatefulWidget {
  final bool post;
  final List<Imagestring> myimages;

  const DetailScreen(
      {super.key,
      required this.dorm,
      required this.post,
      required this.myimages});

  final Dorm dorm;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String? coverImageFileName;
  List<String> coverImageList = [];
  bool _isLoading = true;
  bool success = false;

  void uploadDormCoverImage(XFile? file) async {
    try {
      String fileName = file!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final response =
          await Caller.dio.post("/api/upload/coverImage", data: formData);

      setState(() {
        coverImageFileName = response.data["image"];
        debugPrint('dorm ${coverImageFileName!}');
      });
    } on DioError catch (e) {
      debugPrint('upload dorm cover image error: ${e.response}');
    }
  }

  void uploadRoomCoverImage(XFile? file) async {
    try {
      String fileName = file!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final response =
          await Caller.dio.post("/api/upload/coverImage", data: formData);
      debugPrint('upload room cover image response: ${response.data}');
      setState(() {
        coverImageList.add(response.data["image"]);
        debugPrint('room ${coverImageList.toString()}');
        for (var i = 0; i < coverImageList.length; i++) {
          debugPrint('room ${coverImageList[i]}');
        }
      });
    } on DioError catch (e) {
      debugPrint('upload room cover image error: ${e.response}');
    }
  }

  void uploadDormImages(List<XFile> file, int id) async {
    try {
      for (var i = 0; i < file.length; i++) {
        String fileName = file[i].path.split('/').last;
        FormData formData = FormData.fromMap({
          "image": await MultipartFile.fromFile(
            file[i].path,
            filename: fileName,
          ),
          "dormId": id,
        });
        final response =
            await Caller.dio.post("/api/upload/dorm", data: formData);
        debugPrint(response.data.toString());
      }
    } on DioError catch (e) {
      debugPrint('upload dorm image error: ${e.response} $e');
    }
  }

  void uploadRoomImages(List<XFile> file, int id) async {
    debugPrint('upload room images');
    try {
      for (var i = 0; i < file.length; i++) {
        String fileName = file[i].path.split('/').last;
        FormData formData = FormData.fromMap({
          "image": await MultipartFile.fromFile(
            file[i].path,
            filename: fileName,
          ),
          "roomId": id,
        });
        final response =
            await Caller.dio.post("/api/upload/room", data: formData);
        debugPrint(response.data.toString());
      }
    } on DioError catch (e) {
      debugPrint('upload room image error: ${e.response} $e');
    }
  }

  Future<void> postDormDetail() async {
    try {
      final postdorm = await Caller.dio.post(
        "/api/manage-dorm/postDorm",
        data: {
          "DormName": widget.dorm.name,
          "UserId": uid,
          "CoverImage": coverImageFileName,
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
      (uploadDormImages(widget.dorm.imageList, postdorm.data["id"]));

      debugPrint(widget.dorm.rooms.length.toString());
      for (var i = 0; i < widget.dorm.rooms.length; i++) {
        // uploadRoomCoverImage(widget.dorm.rooms[i].coverImage);
        final postroom =
            await Caller.dio.post("/api/manage-room/postRoom", data: {
          "dormId": postdorm.data["id"],
          "roomName": widget.dorm.rooms[i].name,
          "CoverImage": coverImageList[i],
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
        debugPrint(postroom.data["room_id"].toString());
        uploadRoomImages(
            widget.dorm.rooms[i].imageList, postroom.data["room_id"]);
      }
      setState(() {
        success = true;
      });
    } on DioError catch (e) {
      debugPrint("room error ${e.response} $e");
    }
  }

  void updateDormDetail() async {
    try {
      final editeddorm = await Caller.dio.put(
        '/api/manage-dorm/editDorm?dormId=${widget.dorm.id}',
        data: {
          "dorm_name": widget.dorm.name,
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
      if (widget.dorm.coverImage != null) {
        final result1 = await Caller.dio
            .put('/api/manage-dorm/editDorm?dormId=${widget.dorm.id}', data: {
          "cover_image": coverImageFileName,
        });
        debugPrint('DormCover${result1.data}');
      }
      debugPrint(editeddorm.data["id"].toString());

      if (widget.dorm.imageList.isNotEmpty) {
        (uploadDormImages(widget.dorm.imageList, editeddorm.data["id"]));
      }

      Response editedroom;
      for (var i = 0; i < widget.dorm.rooms.length; i++) {
        debugPrint(widget.dorm.rooms[i].id.toString());
        editedroom = await Caller.dio.put(
            "/api/manage-room/editRoom?roomId=${widget.dorm.rooms[i].id}",
            data: {
              "dorm_id": editeddorm.data["id"],
              "room_Name": widget.dorm.rooms[i].name,
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

        debugPrint(editedroom.data.toString());
        if (widget.dorm.rooms[i].coverImage != null) {
          editedroom = await Caller.dio.put(
              "/api/manage-room/editRoom?roomId=${widget.dorm.rooms[i].id}",
              data: {
                "cover_image": coverImageList[i],
              });
        }

        if (widget.dorm.rooms[i].imageList.isNotEmpty) {
          debugPrint(widget.dorm.rooms[i].id.toString());
          uploadRoomImages(
              widget.dorm.rooms[i].imageList, editedroom.data["room_id"]);
        }
      }
    } on DioError catch (e) {
      debugPrint('room error');
      debugPrint(e.response.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.post) {
      uploadDormCoverImage(widget.dorm.coverImage);
      for (var i = 0; i < widget.dorm.rooms.length; i++) {
        uploadRoomCoverImage(widget.dorm.rooms[i].coverImage);
      }
    }
    if (widget.post == false) {
      if (widget.dorm.coverImage != null) {
        uploadDormCoverImage(widget.dorm.coverImage);
      }
      for (var i = 0; i < widget.dorm.rooms.length; i++) {
        if (widget.dorm.rooms[i].coverImage != null) {
          uploadRoomCoverImage(widget.dorm.rooms[i].coverImage);
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool err = false;
    return Scaffold(
      backgroundColor: const Color(0xfffff9f0),
      appBar: const MyAppbar(),
      endDrawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(26),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 130,
                    child: Text(
                      'Dorm name :',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.start,
                      widget.dorm.name,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                      softWrap: false,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
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
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                    child: Text(
                      widget.dorm.description,
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: Text(
                      'Cover Images :',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Center(
                    child: widget.dorm.coverImage == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: widget.dorm.coverimageString == '' ||
                                    widget.dorm.coverimageString.isEmpty
                                ? Image.asset(
                                    'assets/images/no-image.png',
                                    fit: BoxFit.cover,
                                    height: 350,
                                    width: 350,
                                  )
                                : Image.network(
                                    widget.dorm.coverimageString,
                                    fit: BoxFit.cover,
                                    height: 350,
                                    width: 350,
                                  ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.file(
                              File(widget.dorm.coverImage!.path),
                              fit: BoxFit.cover,
                              height: 350,
                              width: 350,
                            ),
                          ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: Text(
                      'Images :',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  if (widget.post && widget.dorm.imageList.isNotEmpty)
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: GridView.builder(
                        shrinkWrap: false,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                // childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.dorm.imageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.file(
                              File(widget.dorm.imageList[index].path),
                              fit: BoxFit.cover,
                              width: 200,
                              height: 200,
                            ),
                          );
                        },
                      ),
                    )
                  else
                    Column(
                      children: [
                        if (widget.myimages.isEmpty)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [CircularProgressIndicator()],
                          )
                        else
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: GridView.builder(
                              shrinkWrap: false,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      // childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.myimages.length,
                              itemBuilder: (BuildContext context, int j) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: widget.myimages.isEmpty
                                        ? Image.asset(
                                            'assets/images/no-image.png',
                                            fit: BoxFit.cover,
                                            height: 350,
                                            width: 350,
                                          )
                                        : Image.network(
                                            widget.myimages[j].image,
                                            fit: BoxFit.cover,
                                            width: 200,
                                            height: 200,
                                          ),
                                  ),
                                );
                              },
                            ),
                          ),
                        if (widget.dorm.imageList.isEmpty && widget.post)
                          const Text(
                            '',
                          )
                        else
                          widget.dorm.imageList.isEmpty
                              ? const Text('')
                              : Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 8, 0, 8),
                                        child: Text(
                                          "Added images :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18),
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        child: widget.dorm.imageList.isEmpty
                                            ? const Center(
                                                child: Text(
                                                  'Unable to load images',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                ),
                                              )
                                            : GridView.builder(
                                                shrinkWrap: false,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                gridDelegate:
                                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                                        maxCrossAxisExtent: 200,
                                                        crossAxisSpacing: 20,
                                                        mainAxisSpacing: 20),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: widget
                                                    .dorm.imageList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: Image.file(
                                                      File(widget
                                                          .dorm
                                                          .imageList[index]
                                                          .path),
                                                      fit: BoxFit.cover,
                                                      width: 100,
                                                      height: 100,
                                                    ),
                                                  );
                                                },
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                      ],
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: Text(
                          'Dorm Features :',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Icon(Icons.location_pin),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                  'Distance away from KMUTT\n${widget.dorm.distance} KM',
                                  style: const TextStyle(fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 32),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.dorm.feature.toList().length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: IconFeatureMapping(
                                      name:
                                          widget.dorm.feature.toList()[index]),
                                ),
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
                        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
                        child: Row(
                          children: [
                            const Text(
                              'Advance payment : ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${widget.dorm.advPayment} Months',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
                        child: Row(
                          children: [
                            const Text(
                              'Electric price : ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${widget.dorm.electric} Baht/Unit',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
                        child: Row(
                          children: [
                            const Text(
                              'Water price : ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${widget.dorm.water} Baht/Unit',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
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
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
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
              thickness: 3,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
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
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            widget.dorm.rooms[index].name,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 16, 8, 0),
                        child: Row(
                          children: [
                            const Icon(LineIcons.wallet),
                            const Text(
                              ' Price : ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${widget.dorm.rooms[index].price}',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 8, 16),
                        child: Row(
                          children: [
                            const Icon(LineIcons.alternateExpandArrows),
                            const Text(
                              ' Room size : ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.dorm.rooms[index].size,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
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
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 8, 14, 16),
                              child: Text(
                                widget.dorm.rooms[index].description,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 20),
                              ),
                            ),
                          ]),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                        child: Text(
                          'Cover Images :',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      widget.post
                          //post
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.file(
                                File(widget.dorm.rooms[index].coverImage!.path),
                                fit: BoxFit.cover,
                                height: 350,
                                width: 350,
                              ),
                            )

                          //edit
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: widget.dorm.rooms[index].coverimageString
                                      .isEmpty
                                  ? Image.asset(
                                      'assets/images/no-image.png',
                                      fit: BoxFit.cover,
                                      height: 350,
                                      width: 350,
                                    )
                                  : Image.network(
                                      widget.dorm.rooms[index].coverimageString,
                                      fit: BoxFit.cover,
                                      height: 350,
                                      width: 350,
                                    ),
                            ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                        child: Text(
                          'Images :',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      widget.post
                          //post
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: SizedBox(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: widget
                                        .dorm.rooms[index].imageList.isEmpty
                                    ? const Center(
                                        child: Text(
                                          'Unable to load images',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    : GridView.builder(
                                        shrinkWrap: false,
                                        physics: const BouncingScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 200,
                                                // childAspectRatio: 3 / 2,
                                                crossAxisSpacing: 20,
                                                mainAxisSpacing: 20),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget
                                            .dorm.rooms[index].imageList.length,
                                        itemBuilder:
                                            (BuildContext context, int i) {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: Image.file(
                                              File(widget.dorm.rooms[index]
                                                  .imageList[i].path),
                                              fit: BoxFit.cover,
                                              height: 200,
                                              width: 200,
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            )

                          //edit
                          : ShowRoomImages(room: widget.dorm.rooms[index]),
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
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      child: IconFeatureMapping(
                                          name: widget.dorm.rooms[index].feature
                                              .roomFeatureToList()[j]),
                                    ),
                                    Text(
                                        '${widget.dorm.rooms[index].feature.roomFeatureToList()[j]} ',
                                        style: const TextStyle(fontSize: 18)),
                                  ],
                                );
                              },
                            ),
                          ),
                          const Divider(
                            thickness: 3,
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
                    width: MediaQuery.of(context).size.width * 0.4,
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
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 40,
                    child: FloatingActionButton.extended(
                        heroTag: "btn2",
                        backgroundColor: const Color(0xFFDC6E46),
                        onPressed: () async {
                          try {
                            if (_isLoading) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });
                              if (widget.post) {
                                postDormDetail();
                              }
                              if (widget.post == false) {
                                updateDormDetail();
                              }
                              setState(() {
                                _isLoading = false;
                              });
                            }
                            if (_isLoading == false && widget.post) {
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
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Splash(),
                                            ),
                                          );
                                        },
                                        child: const Text('Go to home'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            if (_isLoading == false && widget.post == false) {
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
                                    'Your dorm information has been update!',
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
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Splash(),
                                            ),
                                          );
                                        },
                                        child: const Text('Go to home'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          } catch (e) {
                            setState(() {
                              err = true;
                            });
                            if (err) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: const Color(0xFFD9D9D9),
                                  title: const Icon(
                                    Icons.cancel_outlined,
                                    color: Color.fromARGB(255, 137, 42, 42),
                                    size: 100,
                                  ),
                                  content: const Text(
                                    'Something went wrong. Please try again later.',
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
                                        child: const Text('Go to home'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }

                          //success
                          //   if (_isLoading) {
                          //     showDialog(
                          //       context: context,
                          //       builder: (BuildContext context) {
                          //         return const Center(
                          //           child: CircularProgressIndicator(),
                          //         );
                          //       },
                          //     );
                          //   } else {
                          //     // Wait for postDormDetail to complete
                          //     await postDormDetail();

                          //     if (success == true && _isLoading == false) {
                          //       Navigator.pop(
                          //           context); // Close the progress dialog
                          //       // ignore: use_build_context_synchronously
                          //       showDialog<String>(
                          //         context: context,
                          //         builder: (BuildContext context) =>
                          //             AlertDialog(
                          //           backgroundColor: const Color(0xFFD9D9D9),
                          //           title: const Icon(
                          //             Icons.verified_rounded,
                          //             color: Color(0xff2a8089),
                          //             size: 100,
                          //           ),
                          //           content: const Text(
                          //             'Your dorm information has been posted!',
                          //             textAlign: TextAlign.center,
                          //           ),
                          //           actions: <Widget>[
                          //             Center(
                          //               child: ElevatedButton(
                          //                 style: ElevatedButton.styleFrom(
                          //                   backgroundColor:
                          //                       const Color(0xFFDC6E46),
                          //                   shape: RoundedRectangleBorder(
                          //                     borderRadius:
                          //                         BorderRadius.circular(20),
                          //                   ),
                          //                 ),
                          //                 onPressed: () {
                          //                   Navigator.pop(
                          //                       context); // Close the success dialog
                          //                   Navigator.push(
                          //                     context,
                          //                     MaterialPageRoute(
                          //                       builder: (context) =>
                          //                           const Splash(),
                          //                     ),
                          //                   );
                          //                 },
                          //                 child: const Text('Go to post'),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       );
                          //     } else if (success == false &&
                          //         _isLoading == false) {
                          //       Navigator.pop(
                          //           context); // Close the progress dialog
                          //       showDialog<String>(
                          //         context: context,
                          //         builder: (BuildContext context) =>
                          //             AlertDialog(
                          //           backgroundColor: const Color(0xFFD9D9D9),
                          //           title: const Icon(
                          //             Icons.cancel_outlined,
                          //             color: Color.fromARGB(255, 137, 42, 42),
                          //             size: 100,
                          //           ),
                          //           content: const Text(
                          //             'Something went wrong. Please try again later.',
                          //             textAlign: TextAlign.center,
                          //           ),
                          //           actions: <Widget>[
                          //             Center(
                          //               child: ElevatedButton(
                          //                 style: ElevatedButton.styleFrom(
                          //                   backgroundColor:
                          //                       const Color(0xFFDC6E46),
                          //                   shape: RoundedRectangleBorder(
                          //                     borderRadius:
                          //                         BorderRadius.circular(20),
                          //                   ),
                          //                 ),
                          //                 onPressed: () =>
                          //                     Navigator.pop(context),
                          //                 child: const Text('Go to Back'),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       );
                          //     }
                          //   }
                          // } else {
                          //   updateDormDetail();
                          //   if (success) {
                          //     showDialog<String>(
                          //       context: context,
                          //       builder: (BuildContext context) => AlertDialog(
                          //         backgroundColor: const Color(0xFFD9D9D9),
                          //         title: const Icon(
                          //           Icons.verified_rounded,
                          //           color: Color(0xff2a8089),
                          //           size: 100,
                          //         ),
                          //         content: const Text(
                          //           'Your dorm information has been updated!',
                          //           textAlign: TextAlign.center,
                          //         ),
                          //         actions: <Widget>[
                          //           Center(
                          //             child: ElevatedButton(
                          //               style: ElevatedButton.styleFrom(
                          //                 backgroundColor:
                          //                     const Color(0xFFDC6E46),
                          //                 shape: RoundedRectangleBorder(
                          //                   borderRadius:
                          //                       BorderRadius.circular(20),
                          //                 ),
                          //               ),
                          //               onPressed: () => Navigator.push(
                          //                   context,
                          //                   MaterialPageRoute(
                          //                       builder: (context) =>
                          //                           (DormDetail(
                          //                               dormId: widget.dorm.id,
                          //                               dormItem: DormItem(
                          //                                   coverImage: '',
                          //                                   dormId:
                          //                                       widget.dorm.id,
                          //                                   dormName: widget
                          //                                       .dorm.name,
                          //                                   isFav: false,
                          //                                   maxPrice: 0,
                          //                                   minPrice: 0,
                          //                                   overallRate: 0))))),
                          //               child: const Text('Go to post'),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     );
                          //   } else {
                          //     showDialog<String>(
                          //       context: context,
                          //       builder: (BuildContext context) => AlertDialog(
                          //         backgroundColor: const Color(0xFFD9D9D9),
                          //         title: const Icon(
                          //           Icons.cancel_outlined,
                          //           color: Color.fromARGB(255, 137, 42, 42),
                          //           size: 100,
                          //         ),
                          //         content: const Text(
                          //           'Something went wrong unable to update dorm\n please try again later',
                          //           textAlign: TextAlign.center,
                          //         ),
                          //         actions: <Widget>[
                          //           Center(
                          //             child: ElevatedButton(
                          //               style: ElevatedButton.styleFrom(
                          //                 backgroundColor:
                          //                     const Color(0xFFDC6E46),
                          //                 shape: RoundedRectangleBorder(
                          //                   borderRadius:
                          //                       BorderRadius.circular(20),
                          //                 ),
                          //               ),
                          //               onPressed: () => Navigator.pop(context),
                          //               child: const Text('Go to Back'),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     );
                          //   }
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
