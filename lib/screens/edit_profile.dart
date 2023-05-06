// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:moddormy_flutter/provider/user_provider.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:provider/provider.dart';

import '../widgets/MyDrawer.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
        endDrawer: const MyDrawer(),
        appBar: const MyAppbar(),
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: user.profileImage != null
                              ? const AssetImage(
                                  'assets/images/profileNull.png') //ใส่เป็นnullไว้ก่อน ยังไม่มีรูป
                              : const AssetImage(
                                  'assets/images/profileNull.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.username,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                )
              ]),
            ]))
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       // Add your code for handling the button press here
        //     },
        //     child: const Text('Save'),
        //   ),
        // ),
        );
  }
}
