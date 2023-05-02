import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/confirm_page.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_contract.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_cover_image.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_description.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_feature.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_info.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_photos.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_rooms.dart';

import '../../models/dorm.dart';

class DormForm extends StatefulWidget {
  final Dorm dorm;

  const DormForm({Key? key, required this.dorm}) : super(key: key);

  @override
  State<DormForm> createState() => _DormFormState();
}

class _DormFormState extends State<DormForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              'Dorm Information',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          InfoSection(dorm: widget.dorm),
          DescriptionSection(dorm: widget.dorm),
          CoverImageSection(dorm: widget.dorm),
          PhotosSection(dorm: widget.dorm),
          FeatureSection(dorm: widget.dorm),
          ContractSection(dorm: widget.dorm),
          RoomsSection(dorm: widget.dorm),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                backgroundColor: const Color(0xFFDC6E46),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  dorm: widget.dorm,
                                )));
                  }
                },
                label: const Text('Confirm'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}