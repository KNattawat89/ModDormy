// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:moddormy_flutter/screens/full_screen_image.dart';
import 'package:moddormy_flutter/widgets/post_dorm/description.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm.dart';
import 'package:moddormy_flutter/models/image.dart';
import 'package:moddormy_flutter/models/room.dart';
import 'package:moddormy_flutter/models/user_item.dart';
import 'package:moddormy_flutter/models/user_list.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:moddormy_flutter/widgets/icon_feature_mapping.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';

class RoomDetail extends StatefulWidget {
  final Dorm dorm;
  final int roomNo;
  final String ownerId;

  const RoomDetail(
      {super.key,
      required this.roomNo,
      required this.dorm,
      required this.ownerId});

  @override
  State<RoomDetail> createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail> {
  Room? room;
  List<Imagestring> myimages = [];
  UserItem? ownerInfo;

  Future<void> getRoomDetail() async {
    debugPrint(widget.roomNo.toString());
    try {
      final response = await Caller.dio
          .get('/api/manage-room/getRoomDetail?roomId=${widget.roomNo}');

      setState(() {
        room = Room.fromJson(response.data);
      });
    } on DioError catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getRoomImages() async {
    try {
      final response = await Caller.dio
          .get('/api/manage-room/getRoomImage?roomId=${widget.roomNo}');
      // debugPrint(response.data.toString());

      List<Imagestring> r = response.data
          .map<Imagestring>((e) => Imagestring.fromJson(e))
          .toList();

      setState(() {
        myimages = r;
      });
      debugPrint(myimages.toString());
    } on DioError catch (e) {
      debugPrint('$e error room image');
      debugPrint(e.response.toString());
    }
  }

  Future<void> getOwner() async {
    try {
      final response = await Caller.dio
          .get('/api/profile/getProfile?userId=${widget.ownerId}');
      UserList owner = UserList.fromJson(response.data);

      setState(() {
        ownerInfo = owner.data[0];
      });
    } on DioError catch (e) {
      debugPrint(e.response.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getRoomDetail();
    getRoomImages();
    getOwner();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showFullScreenImage(int currentIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImageScreen(
          imageUrls: myimages.map((image) => image.image).toList(),
          currentIndex: currentIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (room == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [CircularProgressIndicator()],
      );
    }
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F0),
      appBar: const MyAppbar(),
      endDrawer: const MyDrawer(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(
                height: 350,
                width: 350,
                child: Stack(
                  children: [
                    Card(
                      color: Colors.deepPurpleAccent[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 8,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: SizedBox(
                          child: Image.network(
                            room!.coverimageString,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20.0,
                      left: 20.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(122, 150, 150, 150),
                          borderRadius: BorderRadius.circular(21.0),
                        ),
                        child: IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 20,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // room name
                              room!.name,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              //room size
                              '${room!.size} sq.m.',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        )),
                    Positioned(
                        bottom: 20,
                        right: 20,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Icon(
                                Icons.wallet_rounded,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              // room price
                              '${room!.price} Bath / Month',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Room Description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 16),
                          child: DescriptionTextWidget(
                            text: room!.description,
                          ),
                        ),
                      ])),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.start,
                        'Gallery',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            // childAspectRatio: 3 / 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0),
                    scrollDirection: Axis.horizontal,
                    itemCount: myimages.length,
                    itemBuilder: (BuildContext context, int j) {
                      return GestureDetector(
                        onTap: () => _showFullScreenImage(j),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              myimages[j].image,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      );
                    },
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
                      'Room Features',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: room!.feature.roomFeatureToList().length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconFeatureMapping(
                                  name:
                                      room!.feature.roomFeatureToList()[index]),
                            ),
                            Text(room!.feature.roomFeatureToList()[index],
                                style: const TextStyle(fontSize: 18)),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
                    child: Text(
                      'Dorm Features',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.location_pin),
                        ),
                        Expanded(
                          child: Text(
                            'Distance away from KMUTT ${widget.dorm.distance} KM',
                            style: const TextStyle(fontSize: 18),
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.dorm.feature.toList().length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconFeatureMapping(
                                  name: widget.dorm.feature.toList()[index]),
                            ),
                            Text(widget.dorm.feature.toList()[index],
                                style: const TextStyle(fontSize: 18)),
                          ],
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Text(
                      'Contract Detail',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
                    child: Row(
                      children: [
                        const Text(
                          'Advance payment :  ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${widget.dorm.advPayment} Months',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
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
                          '${widget.dorm.electric}  baht/unit',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
                    child: Row(
                      children: [
                        const Text(
                          'Water price :',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${widget.dorm.water} baht/unit',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 0, 16),
                    child: Row(
                      children: [
                        const Text(
                          'Other : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          widget.dorm.other,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
              ),
              ownerInfo == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [CircularProgressIndicator()],
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ownerInfo!.profileImage == null
                              ? const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                      'assets/images/profileNull.png'))
                              : CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                    'http://moddormy.ivelse.com:8000${ownerInfo!.profileImage}',
                                  ),
                                ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${ownerInfo!.firstname} ${ownerInfo!.lastname}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const Text(
                                    'Owner',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: IconButton(
                                    onPressed: () {
                                      String url =
                                          'tel://${ownerInfo!.telephone}';
                                      launch(url);
                                    },
                                    icon: const Icon(
                                      Icons.phone,
                                      size: 30,
                                    )),
                              ),
                              SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: GestureDetector(
                                    onTap: () {
                                      String url =
                                          'http://line.me/ti/p/~${ownerInfo?.lineId}';
                                      launch(url);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        "https://cdn-icons-png.flaticon.com/512/124/124027.png",
                                        fit: BoxFit.cover,
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
