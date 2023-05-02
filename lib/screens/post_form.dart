import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm.dart';
import 'package:moddormy_flutter/models/dorm_feature.dart';
import 'package:moddormy_flutter/widgets/MyAppbar.dart';
import 'package:moddormy_flutter/widgets/MyDrawer.dart';
import 'package:moddormy_flutter/widgets/post_dorm/dorm_form.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  Dorm dorm = Dorm(
    id: 0,
    name: '',
    houseNo: '',
    soi: '',
    street: '',
    subDistrict: '',
    district: '',
    city: '',
    zipCode: '',
    description: '',
    advPayment: '',
    electric: '',
    water: '',
    other: '',
    feature: DormFeature(
      cctv: false,
      fitness: false,
      keycard: false,
      lift: false,
      parking: false,
      petFriendly: false,
      pool: false,
      securityGuard: false,
      smokeFree: false,
      wifi: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      endDrawer: const MyDrawer(),
      body: Center(
        child: ListView(
          children: [
            DormForm(dorm: dorm),
          ],
        ),
      ),
    );
  }
}
