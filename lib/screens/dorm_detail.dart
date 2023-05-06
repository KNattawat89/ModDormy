
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm.dart';
import 'package:moddormy_flutter/models/image.dart';
import 'package:moddormy_flutter/models/room.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import 'package:moddormy_flutter/widgets/post_dorm/show_rooms.dart';
import 'package:moddormy_flutter/widgets/review.dart';

class DormDetail extends StatefulWidget {
  const DormDetail({Key? key}) : super(key: key);
  @override
  State<DormDetail> createState() => _DormDetailState();
}

class _DormDetailState extends State<DormDetail> {
  Dorm? dorm;
  List<Imagestring> myimages = [];
  Future<void> getDormDetail() async {
    try {
      final response =
          await Caller.dio.get('/api/manage-dorm/getDormDetail?dormId=37');
      // debugPrint(response.data.toString());
      final response2 =
          await Caller.dio.get('/api/manage-room/getDormRoom?dormId=37');
      List<Room> rooms =
          response2.data.map<Room>((e) => Room.fromJson(e)).toList();
      // Dorm dorm = Dorm.fromJson(response.data['data']);
      Dorm d = Dorm.fromJson(response.data);
      d.rooms = rooms;
      setState(() {
        dorm = d;
      });
    } catch (e) {
      debugPrint('$e error dormDetail');
    }
  }

  Future<void> getDormImages() async {
    try {
      final response =
          await Caller.dio.get('/api/manage-dorm/getDormImage?dormId=37');
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

  @override
  void initState() {
    super.initState();
    getDormDetail();
    getDormImages();
  }

  @override
  void dispose() {
    super.dispose();
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
      drawer: const MyDrawer(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
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
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {
                            //Favorite
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
                            const Text(
                              'Rateing here',
                              textAlign: TextAlign.start,
                              style: TextStyle(
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
                  padding: const EdgeInsets.all(8.0),
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
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Text(
                            dorm!.description,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      ])),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
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
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: GridView.builder(
                    itemCount: myimages.length,
                    itemBuilder: (BuildContext context, int j) {
                      return Padding(
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
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
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
                ),

              const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text("Address",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text(
                    '${dorm!.houseNo} ${dorm!.soi} ${dorm!.street} ${dorm!.subDistrict} ${dorm!.district} ${dorm!.city} ${dorm!.zipCode}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey)),
              ),
              const Divider(
                thickness: 5,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text("Contact Detail",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'Water price :',
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'Other : ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      dorm!.other,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 5,
              ),
              // REVIEW HERE
              const DormReview(),
            ],
          ),
        ),
      ),
    );
  }
}
