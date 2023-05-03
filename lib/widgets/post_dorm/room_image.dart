import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/models/room.dart';

class RPhotosSection extends StatefulWidget {
  final Room room;

  const RPhotosSection({Key? key, required this.room}) : super(key: key);

  @override
  State<RPhotosSection> createState() => _RPhotosSectionState();
}

class _RPhotosSectionState extends State<RPhotosSection> {
  final ImagePicker picker = ImagePicker();

  void getImageFromGallery() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile!.path.isNotEmpty) {
        widget.room.imageList.add(pickedFile);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Images : ',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.grey[500]),
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
              itemCount: widget.room.imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    File(widget.room.imageList[index].path),
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
            ),
          ),
        ],
      ),
    );
  }
}
