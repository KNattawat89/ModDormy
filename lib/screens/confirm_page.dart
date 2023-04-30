import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class Info {
  final String dormname;
  final String houseNo;
  final String soi;
  final String street;
  final String subDistrict;
  final String district;
  final String city;
  final String zipcode;
  final String dormdesc;
  final String advPayment;
  final String electric;
  final String water;
  final String other;
  final List<String> dormFeatures;
  final XFile? coverImage;
  final List<XFile> _imageList;
  final List<String> roomNameList;
  final List<String> priceList;
  final List<String> roomSizeList;
  final List<String> roomDescList;
  final List<List<String>> roomFeatureList;

  const Info(
    this.dormname,
    this.houseNo,
    this.soi,
    this.street,
    this.subDistrict,
    this.district,
    this.city,
    this.zipcode,
    this.dormdesc,
    this.advPayment,
    this.electric,
    this.water,
    this.other,
    this.dormFeatures,
    this.coverImage,
    this._imageList,
    this.roomNameList,
    this.priceList,
    this.roomSizeList,
    this.roomDescList,
    this.roomFeatureList,
  );
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.info});

  final Info info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logo/Logo.png',
              scale: 10,
            ),
          ],
        ),
        backgroundColor: const Color(0xFFDC6E46),
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
                      info.dormname,
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
                      '${info.houseNo} ${info.soi}\n${info.street}\n${info.subDistrict}\n${info.district}\n${info.city} ${info.zipcode}',
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
                    info.dormdesc,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Cover Images :',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Image.file(
                  File(info.coverImage!.path),
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
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: GridView.builder(
                      itemCount: info._imageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            File(info._imageList[index].path),
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
                        itemCount: info.dormFeatures.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text('${info.dormFeatures[index]} ');
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
                            info.advPayment,
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
                            info.electric,
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
                            info.water,
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
                            info.other,
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
              itemCount: info.roomNameList.length,
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
                        Text(info.roomNameList[index]),
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
                        Text(info.priceList[index]),
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
                        Text(info.roomSizeList[index])
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
                          info.roomDescList[index],
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
                            itemCount: info.roomFeatureList[index].length,
                            itemBuilder: (BuildContext context, int j) {
                              return Text('${info.roomFeatureList[index][j]} ');
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
