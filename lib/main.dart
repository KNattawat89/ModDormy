import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/favorite.dart';
import 'package:moddormy_flutter/screens/home.dart';
import 'package:moddormy_flutter/screens/post_form.dart';
import 'package:moddormy_flutter/screens/profile.dart';
import 'package:moddormy_flutter/widgets/MyAppbar.dart';
import 'package:moddormy_flutter/widgets/MyDrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ModDormy app',
      initialRoute: '/',
      routes: {
        '/fav' : (context) => const FavoritePage(),
        '/profile' : (context) => const ProfilePage(),
      },
      home: const Scaffold(
        endDrawer: MyDrawer(),
        appBar: MyAppbar(),
        body: HomePage(),
      ),
    );
  }
}


