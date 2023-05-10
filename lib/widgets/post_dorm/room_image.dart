import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/models/image.dart';
import 'package:moddormy_flutter/models/room.dart';
import 'package:moddormy_flutter/utilities/caller.dart';

class RPhotosSection extends StatefulWidget {
  final Room room;
  final bool post;
  final bool conf;

  const RPhotosSection(
      {Key? key, required this.room, required this.post, required this.conf})
      : super(key: key);

  @override
  State<RPhotosSection> createState() => _RPhotosSectionState();
}

class _RPhotosSectionState extends State<RPhotosSection> {
  List<Imagestring> myRimages = [];

  Future<void> getRoomImages() async {
    try {
      final response = await Caller.dio
          .get('/api/manage-room/getRoomImage?roomId=${widget.room.id}');
      // debugPrint(response.data.toString());

      List<Imagestring> r = response.data
          .map<Imagestring>((e) => Imagestring.fromJson(e))
          .toList();

      setState(() {
        myRimages = r;
      });
      debugPrint(myRimages.toString());
    } on DioError catch (e) {
      debugPrint('$e error room image');
      debugPrint(e.response.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getRoomImages();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final ImagePicker picker = ImagePicker();

  void getImageFromGallery() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null && pickedFile.path.isNotEmpty) {
        widget.room.imageList.add(pickedFile);
      }
    });
  }

  void deleteImage(int index) {
    setState(() {
      widget.room.imageList.removeAt(index);
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
                itemCount: widget.room.imageList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          File(widget.room.imageList[index].path),
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
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
    } else if (widget.conf) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 200,
              child: GridView.builder(
                itemCount: myRimages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          myRimages[index].image,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
              ),
            ),
            widget.room.imageList.isEmpty
                ? const SizedBox(
                    height: 1,
                    width: 1,
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                      ),
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
                itemCount: myRimages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          myRimages[index].image,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
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
                  itemCount: widget.room.imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            File(widget.room.imageList[index].path),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
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
