import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/ResetPassPage.dart';
import 'package:moddormy_flutter/screens/forgotpass_page.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'package:moddormy_flutter/screens/register.dart';
// import 'package:moddormy_flutter/screens/post_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        color: const Color(0xFFDC6E46),
        theme: ThemeData(
            primarySwatch: Colors.orange,
            primaryColor: const Color(0xFFDC6E46)),
        home: const ResetPassPage());
  }
}
