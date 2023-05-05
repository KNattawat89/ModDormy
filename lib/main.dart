import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/dorm_detail.dart';
import 'package:moddormy_flutter/screens/favorite.dart';
import 'package:moddormy_flutter/screens/home.dart';
import 'package:moddormy_flutter/screens/post_form.dart';
import 'package:moddormy_flutter/screens/profile.dart';
import 'package:moddormy_flutter/screens/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Ideal time to initialize
  await FirebaseAuth.instance.useAuthEmulator('localhost', 3000);
  runApp(const MyApp());
//...
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ModDormy app',
      initialRoute: '/',
      routes: {
        '/fav': (context) => const FavoritePage(),
        '/home': (context) => const HomePage(),
        // '/profile': (context) => const ProfilePage(),
      },
      home: const PostForm(),
      // home: const Scaffold(
      //   endDrawer: MyDrawer(),
      //   appBar: MyAppbar(),
      //   body: HomePage(),
      // ),
    );
  }
}
