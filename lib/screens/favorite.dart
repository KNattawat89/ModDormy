import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/MyAppbar.dart';
import 'package:moddormy_flutter/widgets/MyDrawer.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      endDrawer: const MyDrawer(),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const  [
              Text("Favorite page")
            ],
          )
        ],
      ),
    );



  }
}
