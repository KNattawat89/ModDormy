// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/models/image.dart';
import '../../models/dorm.dart';

class PhotosSection extends StatefulWidget {
  final Dorm dorm;
  final bool post;
  List<Imagestring> myimages;

  PhotosSection(
      {Key? key,
      required this.dorm,
      required this.post,
      required this.myimages})
      : super(key: key);

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

  void deleteImage(int index) {
    setState(() {
      widget.dorm.imageList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.post) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Images : ',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[500]),
                  onPressed: getImageFromGallery,
                  child: Row(
                    children: const [
                      Icon(Icons.add),
                      Text('Images'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 200,
              child: GridView.builder(
                itemCount: widget.dorm.imageList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                          child: Image.file(
                            File(widget.dorm.imageList[index].path),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () => deleteImage(index),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Icon(Icons.delete_outline,
                                color: Color(0xff2A8089)),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: Column(
          children: [
            Row(
              children: const [
                Text('Images : ',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 200,
              child: GridView.builder(
                itemCount: widget.myimages.length,
                itemBuilder: (BuildContext context, int j) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          widget.myimages[j].image,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
              ),
            ),
            SizedBox(
              height: 37,
              width: 120,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.grey[500]),
                onPressed: getImageFromGallery,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add),
                    Text('Images'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 200,
                child: GridView.builder(
                  itemCount: widget.dorm.imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.file(
                              File(widget.dorm.imageList[index].path),
                              fit: BoxFit.cover,
                              width: 200,
                              height: 200,
                            ),
                          ),
                         ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: () => deleteImage(index),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: const Icon(Icons.delete_outline,
                                  color: Color(0xff2A8089)),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
