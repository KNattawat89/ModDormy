import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/dorm.dart';

class CoverImageSection extends StatefulWidget {
  final Dorm dorm;
  final bool post;
  const CoverImageSection({Key? key, required this.dorm, required this.post})
      : super(key: key);

  @override
  State<CoverImageSection> createState() => _CoverImageSectionState();
}

class _CoverImageSectionState extends State<CoverImageSection> {
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        widget.dorm.coverImage = file;
      });
    }

    if (widget.post) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text('Cover Image : ',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[500]),
                    onPressed: getImage,
                    child: Row(
                      children: const [
                        Icon(Icons.add),
                        Text('Cover Image'),
                      ],
                    ),
                  ),
                ],
              ),
              widget.dorm.coverImage == null
                  ? const Text(
                      'No image selected.',
                      textAlign: TextAlign.center,
                    )
                  : Image.file(
                      File(widget.dorm.coverImage!.path),
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
            ],
          ));
    } else { // edit
      return Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text('Cover Image : ',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[500]),
                    onPressed: getImage,
                    child: Row(
                      children: const [
                        Icon(Icons.add),
                        Text('Cover Image'),
                      ],
                    ),
                  ),
                ],
              ),
              widget.dorm.coverImage == null
                  ? Image.network(widget.dorm.coverimageString)
                  : Image.file(
                      File(widget.dorm.coverImage!.path),
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
            ],
          ));
    }
  }
}
