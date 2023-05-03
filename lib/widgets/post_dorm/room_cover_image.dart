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
            widget.room.coverImage == null
                ? const Text(
                    'No image selected.',
                    textAlign: TextAlign.center,
                  )
                : Image.file(
                    File(widget.room.coverImage!.path),
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
          ],
        ));
  }
}
