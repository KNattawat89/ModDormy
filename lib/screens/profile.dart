import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/MyAppbar.dart';
import 'package:moddormy_flutter/widgets/MyDrawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar:const  MyAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const  [
              Text("Profile page")
            ],
          )
        ],
      ),
    );
  }
}
