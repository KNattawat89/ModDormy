import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm.dart';
import 'package:moddormy_flutter/models/dorm_feature.dart';
import 'package:moddormy_flutter/screens/room_detail.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:moddormy_flutter/widgets/MyDrawer.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/review.dart';

class DormDetail extends StatefulWidget {
  const DormDetail({Key? key}) : super(key: key);

  @override
  State<DormDetail> createState() => _DormDetailState();
}

class _DormDetailState extends State<DormDetail> {
  dynamic dorm;

  Future<void> getDormDetail() async {
    try {
      final response =
          await Caller.dio.get('/api/manage-dorm/getDormDetail?dormId=1');
      setState(() {
        dorm = response.data["name_dorm"];
      });
      debugPrint(dorm["name_dorm"].toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getDormDetail();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(dorm),
      ),
    );
    // Scaffold(
    //   backgroundColor: const Color(0xffFFF8F0),
    //   appBar: const MyAppbar(),
    //   drawer: const MyDrawer(),
    //   body: Center(
    //     child: Container(
    //       padding: const EdgeInsets.all(16),
    //       child: ListView(
    //         children: [
    //           SizedBox(
    //             height: 400,
    //             width: 400,
    //             child: Stack(
    //               children: [
    //                 Card(
    //                   color: Colors.deepPurpleAccent,
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(12.0),
    //                   ),
    //                   elevation: 8,
    //                   child: const Center(
    //                     child: Text('1'),
    //                   ),
    //                 ),
    //                 Positioned.fill(
    //                   child: ClipRRect(
    //                     borderRadius: BorderRadius.circular(12.0),
    //                     child: SizedBox(
    //                       child: Image.network(
    //                         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR00L8GRKSQVHDXAnex599APwTABc7_5WRD_w&usqp=CAU',
    //                         fit: BoxFit.cover,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Positioned(
    //                   top: 20.0,
    //                   right: 20.0,
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                       color: const Color.fromARGB(122, 150, 150, 150),
    //                       borderRadius: BorderRadius.circular(21.0),
    //                     ),
    //                     child: IconButton(
    //                       color: Colors.white,
    //                       icon: const Icon(Icons.favorite_border),
    //                       onPressed: () {
    //                         //Favorite
    //                       },
    //                     ),
    //                   ),
    //                 ),
    //                 Positioned(
    //                   top: 20.0,
    //                   left: 20.0,
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                       color: const Color.fromARGB(122, 150, 150, 150),
    //                       borderRadius: BorderRadius.circular(21.0),
    //                     ),
    //                     child: IconButton(
    //                       color: Colors.white,
    //                       icon: const Icon(Icons.arrow_back),
    //                       onPressed: () {
    //                         Navigator.pop(context);
    //                       },
    //                     ),
    //                   ),
    //                 ),
    //                 Positioned(
    //                     bottom: 20,
    //                     left: 20,
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           //'Dorm name',
    //                           dorm.name,
    //                           textAlign: TextAlign.start,
    //                           style: TextStyle(
    //                               fontSize: 24,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white),
    //                         ),
    //                         Text(
    //                           'Rateing here',
    //                           textAlign: TextAlign.start,
    //                           style: TextStyle(
    //                               fontSize: 16,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white),
    //                         ),
    //                       ],
    //                     ))
    //               ],
    //             ),
    //           ),
    //           Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: const [
    //                     Text(
    //                       'Dorm Description',
    //                       textAlign: TextAlign.start,
    //                       style: TextStyle(
    //                           fontSize: 20, fontWeight: FontWeight.w500),
    //                     ),
    //                     Padding(
    //                       padding: EdgeInsets.only(top: 16, bottom: 16),
    //                       child: Text(
    //                         'dorm.description here \ndasdddddddddddddddddddiuhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdaiusdhasdiuhhhhhhhh',
    //                         style: TextStyle(color: Colors.grey, fontSize: 18),
    //                       ),
    //                     ),
    //                   ])),
    //           Padding(
    //             padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: const [
    //                 Expanded(
    //                   child: Text(
    //                     textAlign: TextAlign.start,
    //                     'Gallery',
    //                     style: TextStyle(
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
    //             child: SizedBox(
    //               height: MediaQuery.of(context).size.height * 0.25,
    //               child: GridView.builder(
    //                 itemCount: 6,
    //                 itemBuilder: (BuildContext context, int j) {
    //                   return Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(12.0),
    //                       child: Image.network(
    //                         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR00L8GRKSQVHDXAnex599APwTABc7_5WRD_w&usqp=CAU',
    //                         fit: BoxFit.cover,
    //                         width: 100,
    //                         height: 100,
    //                       ),
    //                     ),
    //                   );
    //                 },
    //                 gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                         crossAxisCount: 3),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: const [
    //                 Text(
    //                   textAlign: TextAlign.start,
    //                   'Room Types',
    //                   style: TextStyle(
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.w500,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           ListView.builder(
    //               shrinkWrap: true,
    //               itemCount: 3,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return Padding(
    //                   padding: const EdgeInsets.all(8),
    //                   child: OutlinedButton(
    //                     onPressed: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => RoomDetail(
    //                                     roomNo: (index + 1).toString(),
    //                                   )));
    //                     },
    //                     child: Row(
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           ClipRRect(
    //                             borderRadius: BorderRadius.circular(12.0),
    //                             child: Image.network(
    //                               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR00L8GRKSQVHDXAnex599APwTABc7_5WRD_w&usqp=CAU',
    //                               fit: BoxFit.cover,
    //                               width: 100,
    //                               height: 100,
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsets.all(16.0),
    //                             child: Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               children: const [
    //                                 Text(
    //                                   'Room Name here',
    //                                   textAlign: TextAlign.start,
    //                                   style: TextStyle(
    //                                       fontSize: 18,
    //                                       fontWeight: FontWeight.w500),
    //                                 ),
    //                                 Text(
    //                                   'Room size here',
    //                                   textAlign: TextAlign.start,
    //                                   style: TextStyle(
    //                                       fontSize: 16, color: Colors.grey),
    //                                 ),
    //                                 Text(
    //                                   'Room Price here',
    //                                   textAlign: TextAlign.start,
    //                                   style: TextStyle(
    //                                       fontSize: 16,
    //                                       color: Colors.blueAccent),
    //                                 ),
    //                               ],
    //                             ),
    //                           )
    //                         ]),
    //                   ),
    //                 );
    //               }),
    //           const Padding(
    //             padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
    //             child: Text("Address",
    //                 style:
    //                     TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
    //             child: Text(
    //                 "Address hereAddress hereAddress hereAddress hereAddress hereAddress hereAddress hereAddress hereAddress hereAddress hereAddress hereAddress hereAddress here",
    //                 style: TextStyle(fontSize: 16, color: Colors.grey)),
    //           ),
    //           const Divider(
    //             thickness: 5,
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
    //             child: Text("Contact Detail",
    //                 style:
    //                     TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Row(
    //               children: const [
    //                 Text(
    //                   'Advance payment : ',
    //                   style:
    //                       TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    //                 ),
    //                 Text(
    //                   'Advpayment HERE months',
    //                   style: TextStyle(color: Colors.grey, fontSize: 16),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Row(
    //               children: const [
    //                 Text(
    //                   'Electric price : ',
    //                   style:
    //                       TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    //                 ),
    //                 Text(
    //                   'Elecric HERE baht/unit',
    //                   style: TextStyle(color: Colors.grey, fontSize: 16),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Row(
    //               children: const [
    //                 Text(
    //                   'Water price :',
    //                   style:
    //                       TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    //                 ),
    //                 Text(
    //                   'Water HERE baht/unit',
    //                   style: TextStyle(color: Colors.grey, fontSize: 16),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Row(
    //               children: const [
    //                 Text(
    //                   'Other : ',
    //                   style:
    //                       TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    //                 ),
    //                 Text(
    //                   'Other HERE',
    //                   style: TextStyle(color: Colors.grey, fontSize: 16),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const Divider(
    //             thickness: 5,
    //           ),
    //           // REVIEW HERE
    //           const DormReview(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
