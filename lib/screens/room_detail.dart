import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/MyDrawer.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';

class RoomDetail extends StatefulWidget {
  final String roomNo;
  const RoomDetail({super.key, required this.roomNo});

  @override
  State<RoomDetail> createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 8,
                      child: const Center(
                        child: Text('1'),
                      ),
                    ),
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: SizedBox(
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR00L8GRKSQVHDXAnex599APwTABc7_5WRD_w&usqp=CAU',
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
                              'Room name${widget.roomNo}',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text(
                              'Size here',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        )),
                    Positioned(
                        bottom: 20,
                        right: 20,
                        child: Row(
                          children: const [
                            Icon(Icons.wallet_rounded),
                            Text(
                              'Price here',
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
                      children: const [
                        Text(
                          'Room Description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          child: Text(
                            'room.description here \ndasdddddddddddddddddddiuhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdaiusdhasdiuhhhhhhhh',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
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
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int j) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR00L8GRKSQVHDXAnex599APwTABc7_5WRD_w&usqp=CAU',
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
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                    child: Row(
                      children: const [
                        Icon(Icons.location_pin),
                        Text(' Distance away from KMUTT (HERE) KM',
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 32),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            const Icon(Icons.check),
                            Text(' HERE $index ',
                                style: const TextStyle(fontSize: 18)),
                          ],
                        );
                      },
                    ),
                  ),
                  const Text(
                    'Contract Detail',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Advance payment : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '(HERE) months',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Electric price : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '(HERE)  baht/unit',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Water price :',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '(HERE)  baht/unit',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Other : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '(HERE)',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
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
                      children: const [
                        Icon(Icons.location_pin),
                        Text(' Distance away from KMUTT (HERE) KM',
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 32),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            const Icon(Icons.check),
                            Text(' HERE $index ',
                                style: const TextStyle(fontSize: 18)),
                          ],
                        );
                      },
                    ),
                  ),
                  const Text(
                    'Contract Detail',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Advance payment : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '(HERE) months',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Electric price : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '(HERE)  baht/unit',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Water price :',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '(HERE)  baht/unit',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Other : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '(HERE)',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 5,
              ),
              // Profile here
            ],
          ),
        ),
      ),
    );
  }
}