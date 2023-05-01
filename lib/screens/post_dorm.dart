import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/models/room.dart';
import 'package:moddormy_flutter/screens/confirm_page.dart';

class CoverImageUploadButton extends StatefulWidget {
  const CoverImageUploadButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CoverImageUploadButtonState createState() => _CoverImageUploadButtonState();
}

XFile? coverImage;

class _CoverImageUploadButtonState extends State<CoverImageUploadButton> {
  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile!.path.isNotEmpty) {
        coverImage = XFile(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: getImage,
          child: const Text('Add Cover Image'),
        ),
        coverImage == null
            ? const Text('No image selected.')
            : Image.file(
                File(coverImage!.path),
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
      ],
    );
  }
}

class UploadPhotoButton extends StatefulWidget {
  const UploadPhotoButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UploadPhotoButtonState createState() => _UploadPhotoButtonState();
}

final List<XFile> _imageList = [];

class _UploadPhotoButtonState extends State<UploadPhotoButton> {
  final ImagePicker picker = ImagePicker();

  void getImageFromGallery() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile!.path.isNotEmpty) {
        // _image = File(pickedFile.path);
        _imageList.add(pickedFile);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: getImageFromGallery,
            child: const Text('Add Image'),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: _imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    File(_imageList[index].path),
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final dormName = TextEditingController();

  final houseNo = TextEditingController();
  final street = TextEditingController();
  final soi = TextEditingController();
  final subDistrict = TextEditingController();
  final district = TextEditingController();
  final city = TextEditingController();
  final zipcode = TextEditingController();

  final dormDesc = TextEditingController();

  List<String> dormfeatures = [];
  bool parking = false;
  bool wifi = false;
  bool smokefree = false;
  bool securityguard = false;
  bool cctv = false;
  bool keycard = false;
  bool lift = false;
  bool petfriendly = false;
  bool pool = false;
  bool fitness = false;

  final advPayment = TextEditingController();
  final electric = TextEditingController();
  final water = TextEditingController();
  final other = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                  width: 100,
                  child: Text(
                    'Dorm name',
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                child: Padding(
                  //dormname
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: dormName,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'required';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                  width: 100,
                  child: Text(
                    'Address',
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: houseNo,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'House No.'),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'required';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  //address
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: soi,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Soi'),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 100,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: street,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Street'),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'required';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 100,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: subDistrict,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Sub-district'),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'required';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 100,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: district,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'District'),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'required';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 100,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: city,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'City'),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'required';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: zipcode,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Zipcode'),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'required';
                    //   }
                    //   return null;
                    // },
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
                padding: EdgeInsets.only(top: 8.0, left: 16),
                child: Text(
                  'Dorm description',
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                //dorm desc
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  maxLines: 10,
                  minLines: 7,
                  controller: dormDesc,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 25, 8, 8),
                child: Text('Cover Image'),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CoverImageUploadButton(),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 25, 8, 8),
                child: Text('Images'),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: UploadPhotoButton(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Features',
                  textAlign: TextAlign.start,
                ),
                Row(
                  //Parking
                  children: [
                    Checkbox(
                      value: parking,
                      onChanged: (bool? value) {
                        setState(() {
                          parking = value!;
                          if (parking) {
                            dormfeatures.add('parking');
                          } else {
                            dormfeatures.remove('parking');
                          }
                        });
                      },
                    ),
                    const Text('Parking')
                  ],
                ),
                Row(
                  //Wifi
                  children: [
                    Checkbox(
                      value: wifi,
                      onChanged: (bool? value) {
                        setState(() {
                          wifi = value!;
                          if (wifi) {
                            dormfeatures.add('wifi');
                          } else {
                            dormfeatures.remove('wifi');
                          }
                        });
                      },
                    ),
                    const Text('Wifi')
                  ],
                ),
                Row(
                  //Smoke free
                  children: [
                    Checkbox(
                      value: smokefree,
                      onChanged: (bool? value) {
                        setState(() {
                          smokefree = value!;
                          if (smokefree) {
                            dormfeatures.add('smokefree');
                          } else {
                            dormfeatures.remove('smokefree');
                          }
                        });
                      },
                    ),
                    const Text('Smoke-free')
                  ],
                ),
                Row(
                  //Security guard
                  children: [
                    Checkbox(
                      value: securityguard,
                      onChanged: (bool? value) {
                        setState(() {
                          securityguard = value!;
                          if (securityguard) {
                            dormfeatures.add('securityguard');
                          } else {
                            dormfeatures.remove('securityguard');
                          }
                        });
                      },
                    ),
                    const Text('Security guard')
                  ],
                ),
                Row(
                  //CCTV
                  children: [
                    Checkbox(
                      value: cctv,
                      onChanged: (bool? value) {
                        setState(() {
                          cctv = value!;
                          if (cctv) {
                            dormfeatures.add('cctv');
                          } else {
                            dormfeatures.remove('cctv');
                          }
                        });
                      },
                    ),
                    const Text('CCTV')
                  ],
                ),
                Row(
                  //Keycard
                  children: [
                    Checkbox(
                      value: keycard,
                      onChanged: (bool? value) {
                        setState(() {
                          keycard = value!;
                          if (keycard) {
                            dormfeatures.add('keycard');
                          } else {
                            dormfeatures.remove('keycard');
                          }
                        });
                      },
                    ),
                    const Text('Keycard')
                  ],
                ),
                Row(
                  //lift
                  children: [
                    Checkbox(
                      value: lift,
                      onChanged: (bool? value) {
                        setState(() {
                          lift = value!;
                          if (lift) {
                            dormfeatures.add('lift');
                          } else {
                            dormfeatures.remove('lift');
                          }
                        });
                      },
                    ),
                    const Text('Lift')
                  ],
                ),
                Row(
                  //pet friendly
                  children: [
                    Checkbox(
                      value: petfriendly,
                      onChanged: (bool? value) {
                        setState(() {
                          petfriendly = value!;
                          if (petfriendly) {
                            dormfeatures.add('petfriendly');
                          } else {
                            dormfeatures.remove('petfriendly');
                          }
                        });
                      },
                    ),
                    const Text('Pet friendly')
                  ],
                ),
                Row(
                  //Pool
                  children: [
                    Checkbox(
                      value: pool,
                      onChanged: (bool? value) {
                        setState(() {
                          pool = value!;
                          if (pool) {
                            dormfeatures.add('pool');
                          } else {
                            dormfeatures.remove('pool');
                          }
                        });
                      },
                    ),
                    const Text('Pool')
                  ],
                ),
                Row(
                  //Fitness
                  children: [
                    Checkbox(
                      value: fitness,
                      onChanged: (bool? value) {
                        setState(() {
                          fitness = value!;
                          if (fitness) {
                            dormfeatures.add('fitness');
                          } else {
                            dormfeatures.remove('fitness');
                          }
                        });
                      },
                    ),
                    const Text('Fitness')
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Text('Contract Detail'),
              Padding(
                //advance payment
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: advPayment,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Advance payment'),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Enter';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Padding(
                //electric price
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: electric,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Electric price'),
                ),
              ),
              Padding(
                //water price
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: water,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Water price'),
                ),
              ),
              Padding(
                //other
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: other,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'other'),
                ),
              ),
            ],
          ),
          const MyWidget(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  info: Info(
                                    dormName.text,
                                    houseNo.text,
                                    soi.text,
                                    street.text,
                                    subDistrict.text,
                                    district.text,
                                    city.text,
                                    zipcode.text,
                                    dormDesc.text,
                                    advPayment.text,
                                    electric.text,
                                    water.text,
                                    other.text,
                                    dormfeatures,
                                    coverImage,
                                    _imageList,
                                    roomNameList,
                                    priceList,
                                    roomSizeList,
                                    roomDescList,
                                    roomFeatureList,
                                  ),
                                )));
                  }
                },
                label: const Text('Confirm'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyWidgetState createState() => _MyWidgetState();
}

List<String> roomNameList = [];
List<String> priceList = [];
List<String> roomSizeList = [];
List<String> roomDescList = [];
List<List<String>> roomFeatureList = [[]]; //
// [
//  [air , fan ,etc ],
//  [fan ,etc ],
// ]
var count = 0;

class _MyWidgetState extends State<MyWidget> {
  List<Widget> widgets = []; // list of widgets to be displayed
  List<TextEditingController> roomNames = [];
  List<TextEditingController> prices = [];
  List<TextEditingController> roomSizes = [];
  List<TextEditingController> roomDescs = [];
  List<bool> airCs = [];
  List<bool> fans = [];

  List<Room> rooms = [];

  void _addNewWidget() {
    TextEditingController roomName = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController roomSize = TextEditingController();
    TextEditingController roomDesc = TextEditingController();
    bool airC = false;
    bool fan = false;

    roomNames.add(roomName);
    prices.add(price);
    roomSizes.add(roomSize);
    roomDescs.add(roomDesc);
    airCs.add(airC);
    fans.add(fan);

    setState(() {
      widgets.add(Form(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                  width: 100,
                  child: Text(
                    'Room name',
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                child: Padding(
                  //dormname
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: roomName,
                        onChanged: (value) {
                          if (roomNameList.length > count - 1) {
                            roomNameList.removeLast();
                          }
                          roomNameList.add(roomName.text);
                          if (kDebugMode) {
                            print(roomNameList);
                          }
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                  width: 100,
                  child: Text(
                    'Price',
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                child: Padding(
                  //dormname
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: price,
                        onChanged: (value) {
                          if (priceList.length > count - 1) {
                            priceList.removeLast();
                          }
                          priceList.add(price.text);
                          if (kDebugMode) {
                            print(priceList);
                          }
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                  width: 100,
                  child: Text(
                    'Room size',
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                child: Padding(
                  //dormname
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: roomSize,
                        onChanged: (value) {
                          if (roomSizeList.length > count - 1) {
                            roomSizeList.removeLast();
                          }
                          roomSizeList.add(roomSize.text);
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ],
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
                padding: EdgeInsets.only(top: 8.0, left: 16),
                child: Text(
                  'Room description',
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                //dorm desc
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  maxLines: 10,
                  minLines: 7,
                  controller: roomDesc,
                  onChanged: (value) {
                    if (roomDescList.length > count - 1) {
                      roomDescList.removeLast();
                    }
                    roomDescList.add(roomDesc.text);
                  },
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Cover Image :'),
              ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('how?') //CoverImageUploadButton(),
                  ),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Images :'),
              ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('how?') //UploadPhotoButton(),
                  ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Features',
                textAlign: TextAlign.start,
              ),
              Row(
                children: [
                  Checkbox(
                    value: airC,
                    onChanged: (bool? value) {
                      setState(() {
                        airC = value!;
                        if (airC) {
                          roomFeatureList[count - 1].add('airC');
                        } else {
                          roomFeatureList[count - 1].remove('airC');
                        }
                      });
                    },
                  ),
                  const Text('Air Conditioner')
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: fan,
                    onChanged: (bool? value) {
                      setState(() {
                        fan = value!;
                        if (fan) {
                          roomFeatureList[count - 1].add('fan');
                        } else {
                          roomFeatureList[count - 1].remove('fan');
                        }
                      });
                    },
                  ),
                  const Text('Fan')
                ],
              ),
            ],
          ),
        ],
      ))); // add a new Text widget to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * count * 1,
          child: ListView.builder(
            shrinkWrap: false,
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int index) {
              return widgets[index]; // display the widgets in the list
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _addNewWidget();
            count = count + 1;
          },
          child: const Text("Add Room"),
        ),
      ],
    );
  }
}
