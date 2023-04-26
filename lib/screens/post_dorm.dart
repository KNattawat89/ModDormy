// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/foundation.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/screens/confirm_page.dart';

class CoverImageUploadButton extends StatefulWidget {
  const CoverImageUploadButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CoverImageUploadButtonState createState() => _CoverImageUploadButtonState();
}

class _CoverImageUploadButtonState extends State<CoverImageUploadButton> {
  File? _image;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: getImage,
          child: const Text('Add Cover Image'),
        ),
        _image == null
            ? const Text('No image selected.')
            : Image.file(
                _image!,
                height: 200,
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
  // File? _image;
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
      width: MediaQuery.of(context).size.width * 0.8,
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
                  child:
                      //   Image.file(
                      //   File(_imageList[index].path),
                      //   fit: BoxFit.cover,
                      //   width: 200,
                      //   height: 200,
                      // );
                      Image.network(
                    Uri.file(_imageList[index].path).toString(),
                    width: 100,
                    height: 100,
                  ),
                );
                // Image.network(
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

class PostForm extends StatelessWidget {
  const PostForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  'Dorm Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              MyCustomForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

List<String> selected = [];

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Cover Image'),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CoverImageUploadButton(),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
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
                            selected.add('parking');
                          } else {
                            selected.remove('parking');
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
                            selected.add('wifi');
                          } else {
                            selected.remove('wifi');
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
                            selected.add('smokefree');
                          } else {
                            selected.remove('smokefree');
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
                            selected.add('securityguard');
                          } else {
                            selected.remove('securityguard');
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
                            selected.add('cctv');
                          } else {
                            selected.remove('cctv');
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
                            selected.add('keycard');
                          } else {
                            selected.remove('keycard');
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
                            selected.add('lift');
                          } else {
                            selected.remove('lift');
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
                            selected.add('petfriendly');
                          } else {
                            selected.remove('petfriendly');
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
                            selected.add('pool');
                          } else {
                            selected.remove('pool');
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
                            selected.add('fitness');
                          } else {
                            selected.remove('fitness');
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
          MyWidget(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
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
                                    selected,
                                    _imageList,
                                    roomNameList,
                                  ),
                                )));
                  }
                },
                child: const Text('Confirm'),
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
  MyWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyWidgetState createState() => _MyWidgetState();
  TextEditingController roomName = TextEditingController();
}

List<String> roomNameList = [];

class _MyWidgetState extends State<MyWidget> {
  List<Widget> widgets = []; // list of widgets to be displayed

  void _addNewWidget() {
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
                        controller: widget.roomName,
                        onChanged: (value) => roomNameList,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'required';
                        //   }
                        //   return null;
                        // },
                      ),
                      Text(widget.roomName.text)
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row()
        ],
      ))); // add a new Text widget to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int index) {
              return widgets[index]; // display the widgets in the list
            },
          ),
        ),
        ElevatedButton(
          onPressed: _addNewWidget,
          child: const Text("Add Room"),
        ),
      ],
    );
  }
}
