import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm.dart';
import 'package:moddormy_flutter/models/dorm_feature.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
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
    zipCode: 0,
    description: '',
    advPayment: 0,
    electric: 0,
    water: 0,
    other: '',
    distance: 0,
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
      backgroundColor: const Color(0xfffff9f0),
      appBar: const MyAppbar(),
      endDrawer: const MyDrawer(),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          child: ListView(
            shrinkWrap: true,
            children: [
              DormForm(dorm: dorm),
            ],
          ),
        ),
      ),
    );
  }
}
