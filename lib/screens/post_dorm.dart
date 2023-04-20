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

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final dormName = TextEditingController();
  final address = TextEditingController();
  final dormDesc = TextEditingController();
  bool parking = false;

  @override
  void initState() {
    super.initState();
    dormName.addListener(_printName);
    address.addListener(_printSid);
    dormDesc.addListener(_printEmail);
  }

  void _printName() {
    print('Name: ${dormName}');
  }

  void _printSid() {
    print('SID: ${address}');
  }

  void _printEmail() {
    print('Email: ${dormDesc}');
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
                        });
                      },
                    ),
                    Text('Parking')
                  ],
                )
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => DetailScreen(
                  //                 info: Info(dormName.text, address.text,
                  //                     dormDesc.text),
                  //               )));
                  // }
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

// class Info {
//   final String name;
//   final String sid;
//   final String email;

//   const Info(this.name, this.sid, this.email);
// }

// class DetailScreen extends StatelessWidget {
//   const DetailScreen({super.key, required this.info});

//   final Info info;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('The Second Screen'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             '${info.name}\n'
//             '${info.sid}\n'
//             '${info.email}',
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

