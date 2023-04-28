import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/post_dorm.dart';

class PostForm extends StatelessWidget {
  const PostForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo/Logo.png',
                scale: 10,
              ),
            ],
          ),
          backgroundColor: const Color(0xFFDC6E46),
        ),
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
