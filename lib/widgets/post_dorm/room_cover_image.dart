import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/models/room.dart';

class RCoverImageSection extends StatefulWidget {
  final Room room;
  final bool post;

  const RCoverImageSection({Key? key, required this.room, required this.post})
      : super(key: key);

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

    //post
    if (widget.post) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 8, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Row(
                    children: const [
                      Text('Cover Image',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20)),
                      Text(
                        '*',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: ElevatedButton(
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
                  ),
                ],
              ),
              widget.room.coverImage == null
                  ? const Text(
                      '',
                      textAlign: TextAlign.center,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.file(
                        File(widget.room.coverImage!.path),
                        fit: BoxFit.cover,
                        height: 350,
                        width: 350,
                      ),
                    ),
            ],
          ));
    } else {
      //edit
      return Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Row(
                    children: const [
                      Text('Cover Image',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20)),
                    ],
                  ),
                  const Text(
                    '*',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: ElevatedButton(
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
                  ),
                ],
              ),
              widget.room.coverImage == null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        widget.room.coverimageString,
                        fit: BoxFit.cover,
                        height: 350,
                        width: 350,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.file(
                        File(widget.room.coverImage!.path),
                        fit: BoxFit.cover,
                        height: 350,
                        width: 350,
                      ),
                    ),
            ],
          ));
    }
  }
}
