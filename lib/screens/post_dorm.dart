import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

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

// class TikCheckbox {
//   String title;
//   bool value;
//   TikCheckbox(this.title, this.value);
//   @override
//   String toString() {
//     return 'MyClass{title: $title, value: $value}';
//   }
// }

List<String> selected = [];

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final dormName = TextEditingController();
  final address = TextEditingController();
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
  void initState() {
    super.initState();
    dormName.addListener(_printDormName);
    address.addListener(_printAddress);
    dormDesc.addListener(_printDormDesc);
  }

  void _printDormName() {
    print('dormname: ${dormName}');
  }

  void _printAddress() {
    print('address: ${address}');
  }

  void _printDormDesc() {
    print('dormdesc: ${dormDesc}');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const Text('Dorm name'),
              Padding(
                //dormname
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: dormName,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Stack(
            children: [
              const Text('Address'),
              Padding(
                //address
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: address,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Stack(
            children: [
              const Text('Dorm description'),
              Padding(
                //dorm desc
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  maxLines: 10,
                  minLines: 7,
                  controller: dormDesc,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Images'),
              ),
              ElevatedButton(onPressed: null, child: Text('Add Image'))
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
                        });
                      },
                    ),
                    const Text('Keycard')
                  ],
                ),
                Row(
                  //Wifi
                  children: [
                    Checkbox(
                      value: lift,
                      onChanged: (bool? value) {
                        setState(() {
                          lift = value!;
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
                        });
                      },
                    ),
                    const Text('Fitness')
                  ],
                ),
              ],
            ),
          ),

          // ListView(
          //   children: [
          //     Text('Contract Detail'),
          //     Padding(
          //         //dormname
          //         padding: EdgeInsets.all(16.0),
          //         child: TextFormField(
          //           controller: ,
          //           decoration:
          //               const InputDecoration(border: OutlineInputBorder(),labelText: 'Advance payment'
          //               ,
          //           validator: (value) {
          //             if (value == null || value.isEmpty) {
          //               return 'Enter';
          //             }
          //             return null;
          //           },
          //         ),
          //       ),
          //   ],
          // ),

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
                                      address.text,
                                      dormDesc.text,
                                      parking,
                                      wifi,
                                      smokefree,
                                      securityguard,
                                      cctv,
                                      keycard,
                                      lift,
                                      petfriendly,
                                      pool,
                                      fitness),
                                )));
                  }
                },
                child: const Text('Submit Data'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Info {
  final String dormname;
  final String address;
  final String dormdesc;
  final bool parking;
  final bool wifi;
  final bool smokefree;
  final bool securityguard;
  final bool cctv;
  final bool keycard;
  final bool lift;
  final bool petfriendly;
  final bool pool;
  final bool fitness;

  const Info(
      this.dormname,
      this.address,
      this.dormdesc,
      this.parking,
      this.wifi,
      this.smokefree,
      this.securityguard,
      this.cctv,
      this.keycard,
      this.lift,
      this.petfriendly,
      this.pool,
      this.fitness);
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.info});

  final Info info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Second Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     '${info.dormname}\n'
            //     '${info.address}\n'
            //     '${info.dormdesc}',
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            ListView(
              children: selected.map((e) {
                return Text(e);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
