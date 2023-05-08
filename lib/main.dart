import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/provider/user_provider.dart';
import 'package:moddormy_flutter/screens/dorm_detail.dart';
import 'package:moddormy_flutter/screens/favorite.dart';
import 'package:moddormy_flutter/screens/forgotpass_page.dart';
import 'package:moddormy_flutter/screens/home.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'package:moddormy_flutter/screens/profile.dart';
import 'package:moddormy_flutter/screens/profile.dart';
import 'package:moddormy_flutter/screens/register.dart';
import 'package:moddormy_flutter/screens/reset_pass_page.dart';
import 'package:moddormy_flutter/screens/splash.dart';
import 'package:moddormy_flutter/screens/tempmanagedorm.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:provider/provider.dart';

import 'models/dorm_item.dart';
import 'models/dorm_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Ideal time to initialize
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 3000);
//   await FirebaseAuth.instance.useAuthEmulator('localhost', 3000);
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const ModDormy(),
    ),
  );
//...
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ModDormy app',
//       initialRoute: '/',
//       routes: {
//         '/fav': (context) => const FavoritePage(),
//         '/home': (context) => const HomePage(),
//         '/login': (context) => const LoginPage(),
//         '/register':(context) => const RegisterPage(),
//         '/forgotPass':(context) => const ForgotPassPage(),
//         '/resetPass':(context) => const ResetPassPage(),
//         '/profile': (context) => const ProfilePage(),
//         // '/dorm/:id': (context) => const DormDetail(),
//       },
//       home: const Splash()
//       // home: const Scaffold(
//       //   endDrawer: MyDrawer(),
//       //   appBar: MyAppbar(),
//       //   body: HomePage(),
//       // ),
//     );
//   }
// }

class ModDormy extends StatefulWidget {
  const ModDormy({Key? key}) : super(key: key);

  @override
  State<ModDormy> createState() => _ModDormyState();
}

class _ModDormyState extends State<ModDormy> {
  List<DormItem> favDorm=[];
  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      getFavDorm(user!.uid);
    }
  }

  void getFavDorm(String uid) async {
    print("hello");
    try {
      final response = await Caller.dio.get('/api/fav/getFav?userId=$uid');
      DormList d = DormList.fromJson(response.data);
      setState(() {
        favDorm = d.data;
      });

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ModDormy app',
        initialRoute: '/',
        routes: {
          '/fav': (context) => const FavoritePage(),
          '/home': (context) => const HomePage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/forgotPass': (context) => const ForgotPassPage(),
          '/resetPass': (context) => const ResetPassPage(),
          '/profile': (context) => const ProfilePage(),
          // '/dorm/:id': (context) => const DormDetail(),
        },
        home: const Splash()
        // home: const Scaffold(
        //   endDrawer: MyDrawer(),
        //   appBar: MyAppbar(),
        //   body: HomePage(),
        // ),
        );
  }
}

