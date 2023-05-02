import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/dorm.dart';

class PhotosSection extends StatefulWidget {
  final Dorm dorm;

  const PhotosSection({Key? key, required this.dorm}) : super(key: key);

  @override
  State<PhotosSection> createState() => _PhotosSectionState();
}

class _PhotosSectionState extends State<PhotosSection> {
  final ImagePicker picker = ImagePicker();

  void getImageFromGallery() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile!.path.isNotEmpty) {
        widget.dorm.imageList.add(pickedFile);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Images'),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 30 +
                  MediaQuery.of(context).size.height *
                      (widget.dorm.imageList.length) *
                      0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[500]),
                    onPressed: getImageFromGallery,
                    child: const Text('Add Image'),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: widget.dorm.imageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            File(widget.dorm.imageList[index].path),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
