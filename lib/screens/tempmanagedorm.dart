import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moddormy_flutter/screens/edit_dorm.dart';
import 'package:moddormy_flutter/screens/post_form.dart';

class tempMD extends StatefulWidget {
  const tempMD({super.key});

  @override
  State<tempMD> createState() => _tempMDState();
}

class _tempMDState extends State<tempMD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (const EditForm())));
                },
                child: const Text('edit')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (const PostForm())));
                },
                child: const Text('post')),
          ],
        ),
      ),
    );
  }
}
