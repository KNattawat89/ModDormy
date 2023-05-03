import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/dorm.dart';

class CoverImageSection extends StatefulWidget {
  final Dorm dorm;

  const CoverImageSection({Key? key, required this.dorm}) : super(key: key);

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

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cover Image',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[500]),
                  onPressed: getImage,
                  child: const Text('Add Cover Image'),
                ),
                widget.dorm.coverImage == null
                    ? const Text('No image selected.')
                    : Image.file(
                        File(widget.dorm.coverImage!.path),
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
