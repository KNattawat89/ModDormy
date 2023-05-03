import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/models/room.dart';

class RCoverImageSection extends StatefulWidget {
  final Room room;

  const RCoverImageSection({Key? key, required this.room}) : super(key: key);

  @override
  State<RCoverImageSection> createState() => _RCoverImageSectionState();
}

class _RCoverImageSectionState extends State<RCoverImageSection> {
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        widget.room.coverImage = file;
      });
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Cover Image'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.grey[500]),
                onPressed: getImage,
                child: const Text('Add Cover Image'),
              ),
              widget.room.coverImage == null
                  ? const Text('No image selected.')
                  : Image.file(
                      File(widget.room.coverImage!.path),
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
