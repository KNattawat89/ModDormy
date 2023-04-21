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
    advPayment.addListener(_printAdvPayment);
    electric.addListener(_printElectric);
    water.addListener(_printWater);
    other.addListener(_printOther);
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

  void _printAdvPayment() {
    print('advpayment: ${advPayment}');
  }

  void _printElectric() {
    print('electric: ${electric}');
  }

  void _printWater() {
    print('water: ${water}');
  }

  void _printOther() {
    print('other: ${other}');
  }

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
                  child: Center(
                      child: Text(
                    'Dorm name',
                    textAlign: TextAlign.start,
                  ))),
              Expanded(
                child: Padding(
                  //dormname
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 50,
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
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                  width: 100,
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Address',
                        textAlign: TextAlign.start,
                      ))),
              Expanded(
                child: Padding(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                //water price
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: water,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Water price'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                //other
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: other,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'other'),
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
                                    advPayment.text,
                                    electric.text,
                                    water.text,
                                    other.text,
                                  ),
                                )));
                  }
                },
                child: const Text('Submit Data'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Info {
  final String dormname;
  final String address;
  final String dormdesc;
  final String advPayment;
  final String electric;
  final String water;
  final String other;

  const Info(
    this.dormname,
    this.address,
    this.dormdesc,
    this.advPayment,
    this.electric,
    this.water,
    this.other,
  );
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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Dorm Information',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 87,
                    child: Text(
                      'Dorm name :',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(
                  info.dormname,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 87,
                    child: Text(
                      'Address :',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(
                  info.address,
                  style: const TextStyle(color: Colors.grey),
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
                  child: Text('Images :',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('No image',
                        // Image here
                        style: TextStyle(color: Colors.grey))),
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
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: selected.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text('${selected[index]}');
                          },
                        ),
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
          ],
        ),
      ),

      // Center(
      //   child: Column(
      //     children: [

      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(
      //           '${info.dormname}\n'
      //           '${info.address}\n'
      //           '${info.dormdesc}\n'
      //           '${info.advPayment}\n'
      //           '${info.electric}\n'
      //           '${info.water}\n'
      //           '${info.other}\n',
      //           textAlign: TextAlign.center,
      //         ),
      //       ),
      //       Container(
      //         child: ListView.builder(
      //           shrinkWrap: true,
      //           itemCount: selected.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return Text('${selected[index]}');
      //           },
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
