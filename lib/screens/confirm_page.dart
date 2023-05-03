import 'dart:io';

import 'package:flutter/material.dart';

import '../models/dorm.dart';

class DetailScreen extends StatelessWidget {
  final Dorm dorm;

  const DetailScreen({Key? key, required this.dorm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                'Dorm Information',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    'Dorm name :',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: Text(
                      dorm.name,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    'Address :',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: Text(
                      '${dorm.houseNo} ${dorm.soi}\n${dorm.street}\n${dorm
                          .subDistrict}\n${dorm.district}\n${dorm.city} ${dorm
                          .zipCode}',
                      style: const TextStyle(color: Colors.grey),
                      softWrap: true,
                      maxLines: 10,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Dorm Description :',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    dorm.description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Cover Images :',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                dorm.coverImage == null
                    ? const SizedBox()
                    :
                Image.file(
                  File(dorm.coverImage!.path),
                  fit: BoxFit.cover,
                  height: 125,
                  width: 125,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Images :',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.25,
                    child: GridView.builder(
                      itemCount: dorm.imageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            File(dorm.imageList[index].path),
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
                        'Features :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: dorm.feature
                            .toList()
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text('${dorm.feature.toList()[index]} ');
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Contract Detail',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Advance payment : '),
                          Text(
                            dorm.advPayment,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Electric price : '),
                          Text(
                            dorm.electric,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Water price :'),
                          Text(
                            dorm.water,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Other :'),
                          Text(
                            dorm.other,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: dorm.rooms.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Room name :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(dorm.rooms[index].name),
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.00),
                          child: Text(
                            'Price :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(dorm.rooms[index].price),
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.00),
                          child: Text(
                            'Room size :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(dorm.rooms[index].size)
                      ],
                    ),
                    Row(children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Room Description :',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          dorm.rooms[index].description,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ]),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Features :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: dorm.rooms.length,
                            itemBuilder: (BuildContext context, int j) {
                              return const Text('test 1 ');
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
