import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/image.dart';
import 'package:moddormy_flutter/screens/confirm_page.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_contract.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_cover_image.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_description.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_distance.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_feature.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_info.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_photos.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_rooms.dart';

import '../../models/dorm.dart';

class DormForm extends StatefulWidget {
  final Dorm dorm;
  final bool post;
  List<Imagestring> myimages;

  DormForm(
      {Key? key,
      required this.dorm,
      required this.post,
      required this.myimages})
      : super(key: key);

  @override
  State<DormForm> createState() => _DormFormState();
}

class _DormFormState extends State<DormForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Dorm Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            InfoSection(dorm: widget.dorm),
            DescriptionSection(dorm: widget.dorm),
            CoverImageSection(
              dorm: widget.dorm,
              post: widget.post,
            ),
            PhotosSection(
              dorm: widget.dorm,
              post: widget.post,
              myimages: widget.myimages,
            ),
            FeatureSection(dorm: widget.dorm),
            DistanceSection(dorm: widget.dorm),
            ContractSection(dorm: widget.dorm),
            const Divider(
              thickness: 3,
            ),
            RoomsSection(
              dorm: widget.dorm,
              post: widget.post,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton.extended(
                  backgroundColor: const Color(0xFFDC6E46),
                  onPressed: () {
                    //post
                    if (formKey.currentState!.validate() && widget.post) {
                      if (widget.dorm.coverImage == null) {
                        debugPrint('Please select dorm cover image');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Color.fromARGB(255, 85, 85, 85),
                              content: Text(
                                'Please select dorm cover image',
                                style: TextStyle(color: Colors.red),
                              )),
                        );
                      } else if (widget.dorm.imageList.length < 3) {
                        debugPrint('Please select at least 3 dorm images');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Color.fromARGB(255, 85, 85, 85),
                              content: Text(
                                'Please select at least 3 dorm images',
                                style: TextStyle(color: Colors.red),
                              )),
                        );
                      } else if (widget.dorm.rooms.isEmpty) {
                        debugPrint('Please add at least 1 room');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Color.fromARGB(255, 85, 85, 85),
                              content: Text(
                                'Please add at least 1 room',
                                style: TextStyle(color: Colors.red),
                              )),
                        );
                      } else if (widget.dorm.rooms[0].coverImage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor:
                                  const Color.fromARGB(255, 85, 85, 85),
                              content: Text(
                                'Please select room ${widget.dorm.rooms[0].name} cover image',
                                style: const TextStyle(color: Colors.red),
                              )),
                        );
                      } else if (widget.dorm.rooms[0].imageList.length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor:
                                  const Color.fromARGB(255, 85, 85, 85),
                              content: Text(
                                'Please select at least 3 room ${widget.dorm.rooms[0].name} images',
                                style: const TextStyle(color: Colors.red),
                              )),
                        );
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      dorm: widget.dorm,
                                      post: widget.post,
                                      myimages: widget.myimages,
                                    )));
                      }
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    dorm: widget.dorm,
                                    post: widget.post,
                                    myimages: widget.myimages,
                                  )));
                    }
                  },
                  label: const Text('Confirm'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
