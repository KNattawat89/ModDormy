import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moddormy_flutter/models/dorm.dart';
import 'package:moddormy_flutter/models/image.dart';
import 'package:moddormy_flutter/models/room.dart';
import 'package:moddormy_flutter/screens/full_screen_image.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import 'package:moddormy_flutter/widgets/post_dorm/description.dart';
import 'package:moddormy_flutter/widgets/post_dorm/show_rooms.dart';
import 'package:moddormy_flutter/widgets/review.dart';
import 'package:provider/provider.dart';

import '../models/dorm_item.dart';
import '../models/fav_preload.dart';
import '../models/review.dart';
import '../provider/user_provider.dart';

class DormDetail extends StatefulWidget {
  const DormDetail(
      {Key? key, required this.dormId, required this.dormItem, this.removeFav})
      : super(key: key);
  final int dormId;
  final DormItem dormItem;
  final Function? removeFav;

  @override
  State<DormDetail> createState() => _DormDetailState();
}

class _DormDetailState extends State<DormDetail> {
  String? ownerId;
  Dorm? dorm;
  double rating = 0.0;
  List<Imagestring> myimages = [];
  String? description;

  Future<void> getDormDetail() async {
    try {
      final response = await Caller.dio
          .get('/api/manage-dorm/getDormDetail?dormId=${widget.dormId}');
      // debugPrint(response.data.toString());
      final response2 = await Caller.dio
          .get('/api/manage-room/getDormRoom?dormId=${widget.dormId}');
      List<Room> rooms =
          response2.data.map<Room>((e) => Room.fromJson(e)).toList();
      // Dorm dorm = Dorm.fromJson(response.data['data']);
      Dorm d = Dorm.fromJson(response.data);
      d.rooms = rooms;
      setState(() {
        ownerId = response.data["userId"];
        dorm = d;
        description = dorm!.description;
      });
    } catch (e) {
      debugPrint('$e error dormDetail');
    }
  }

  Future<void> getDormImages() async {
    try {
      final response = await Caller.dio
          .get('/api/manage-dorm/getDormImage?dormId=${widget.dormId}');
      // debugPrint(response.data.toString());

      List<Imagestring> r = response.data
          .map<Imagestring>((e) => Imagestring.fromJson(e))
          .toList();

      setState(() {
        myimages = r;
      });
      // debugPrint(myimages.toString());
    } catch (e) {
      debugPrint('$e error image');
    }
  }

  Future<void> overallRate(int dormId) async {
    List<Review> reviews = [];
    try {
      final response =
          await Caller.dio.get('/api/review/getDormReview?dormId=$dormId');
      //print(response.data.toString());
      List<Review> r =
          response.data.map<Review>((json) => Review.fromJson(json)).toList();
      //r.forEach((e) => print(e.toJson().toString()));
      setState(() {
        reviews = r;
      });
    } catch (e) {
      //print(e.toString());
    }

    int sum = 0;
    for (Review review in reviews) {
      sum += review.ratingOverall;
    }

    if (reviews.isEmpty) {
      rating = 0;
    } else {
      rating = sum / reviews.length;
    }
  }

  User? userLogin = FirebaseAuth.instance.currentUser;
  void updateIsFav() async {
    if (userLogin != null) {
      if (widget.dormItem.isFav) {
        setState(() {
          widget.dormItem.isFav = !widget.dormItem.isFav;
        });
        try {
          await Caller.dio.delete(
              '/api/fav/deleteFav?userId=${userLogin!.uid}&dormId=${widget.dormItem.dormId}');
          debugPrint('remove fav from home');
          if (FavPreload.homeReload != null) {
            FavPreload.homeReload!();
          }
        } catch (e) {
          debugPrint("hi ${e.toString()}");
        }
      } else {
        setState(() {
          widget.dormItem.isFav = !widget.dormItem.isFav;
        });
        try {
          await Caller.dio.post('/api/fav/postFav', data: {
            "dorm_id": widget.dormItem.dormId,
            "user_id": userLogin!.uid
          });
          // FavPreload.refreshFav();
          debugPrint("called post fav");
        } on DioError catch (e) {
          debugPrint(e.response.toString());
          Caller.handle(context, e);
        }
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Login required"),
                content: const Text("Please log in to favorite this dorm."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFDC6E46),
                    ),
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFFDC6E46)),
                    child: const Text("Login"),
                  )
                ],
              ));
    }
  }

  @override
  void initState() {
    super.initState();
    getDormDetail();
    getDormImages();
    overallRate(widget.dormId);
    widget.dormItem.isFav;
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
    // debugPrint(dorm?.coverimageString);
    if (dorm == null) {
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
                height: 400,
                width: 400,
                child: Stack(
                  children: [
                    Card(
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
                            dorm!.coverimageString,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20.0,
                      right: 20.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(122, 150, 150, 150),
                          borderRadius: BorderRadius.circular(21.0),
                        ),
                        child: IconButton(
                          color: Colors.white,
                          icon: widget.dormItem.isFav
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_outline),
                          onPressed: () {
                            updateIsFav();
                          },
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
                              //'Dorm name',
                              dorm!.name,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            RatingBarIndicator(
                              rating: rating,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Color(0xffDC6E46),
                              ),
                              unratedColor: const Color(0xffD9D9D9),
                              itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
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
                          'Dorm Description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 16),
                            child: DescriptionTextWidget(
                              text: dorm!.description,
                            )),
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
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            // childAspectRatio: 3 / 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0),
                    scrollDirection: Axis.horizontal,
                    itemCount: myimages.length,
                    itemBuilder: (BuildContext context, int j) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => _showFullScreenImage(j),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      textAlign: TextAlign.start,
                      'Room Types',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              for (var room in dorm!.rooms)
                ShowRoom(
                  room: room,
                  dorm: dorm!,
                  ownerId: ownerId!,
                ),

              const Padding(
                padding: EdgeInsets.fromLTRB(8, 16, 0, 0),
                child: Text("Address",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
                child: Text(
                    '${dorm!.houseNo} ${dorm!.soi} ${dorm!.street} ${dorm!.subDistrict} ${dorm!.district} ${dorm!.city} ${dorm!.zipCode}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey)),
              ),
              const Divider(
                thickness: 3,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Text("Contact Detail",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                child: Row(
                  children: [
                    const Text(
                      'Advance payment : ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${dorm!.advPayment} Months',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                child: Row(
                  children: [
                    const Text(
                      'Electric price : ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${dorm!.electric} baht/unit',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                child: Row(
                  children: [
                    const Text(
                      'Water price : ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${dorm!.water} baht/unit',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
                child: Row(
                  children: [
                    const Text(
                      'Other : ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      dorm!.other,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              // REVIEW HERE
              DormReview(dormId: widget.dormId),
            ],
          ),
        ),
      ),
    );
  }
}
