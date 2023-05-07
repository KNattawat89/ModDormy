// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/dorm_detail.dart';
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
                          builder: (context) => (const EditForm(
                                dormId: 93,
                              ))));
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
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              (const DormDetail(dormId: 37))));
                },
                child: const Text('View dorm detail'))
          ],
        ),
      ),
    );
  }
}
