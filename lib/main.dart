import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/provider/user_provider.dart';
import 'package:moddormy_flutter/screens/favorite.dart';
import 'package:moddormy_flutter/screens/forgotpass_page.dart';
import 'package:moddormy_flutter/screens/home.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'package:moddormy_flutter/screens/profile.dart';
import 'package:moddormy_flutter/screens/register.dart';
import 'package:moddormy_flutter/screens/reset_pass_page.dart';
import 'package:moddormy_flutter/screens/splash.dart';
import 'package:provider/provider.dart';
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

class ModDormy extends StatelessWidget {
  const ModDormy({Key? key}) : super(key: key);

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
        home: const Splash());
  }
}
