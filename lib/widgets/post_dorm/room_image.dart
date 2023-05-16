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

  const RPhotosSection({
    Key? key,
    required this.room,
    required this.post,
  }) : super(key: key);

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
    //post
    if (widget.post) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 8, 16),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text('Images',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20)),
                        Text(
                          '*       ',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    const Text(
                      '( Minimum 3 images )  ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: ElevatedButton(
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
                ),
              ],
            ),
            widget.room.imageList.isEmpty
                ? const Text('')
                : Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: GridView.builder(
                        shrinkWrap: false,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.room.imageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.file(
                                  File(widget.room.imageList[index].path),
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 200,
                                ),
                              ),
                              Positioned(
                                top: 9,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () => deleteImage(index),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: const Icon(Icons.delete_outline,
                                        color: Color(0xFFDC6E46)),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      );

      //edit
    } else {
      if (myRimages.isEmpty) {
        return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text('Images',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20)),
                            Text(
                              '*       ',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: ElevatedButton(
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
                    ),
                  ],
                ),
              ],
            ));
      } else {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text('Images',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20)),
                          Text(
                            '*       ',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: ElevatedButton(
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: myRimages.length,
                    itemBuilder: (BuildContext context, int j) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            myRimages[j].image,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              widget.room.imageList.isEmpty
                  ? const Text(
                      '',
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Text(
                              "Added images :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: GridView.builder(
                              shrinkWrap: false,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.room.imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.file(
                                        File(widget.room.imageList[index].path),
                                        fit: BoxFit.cover,
                                        width: 200,
                                        height: 200,
                                      ),
                                    ),
                                    Positioned(
                                      top: 9,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap: () => deleteImage(index),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: const Icon(
                                              Icons.delete_outline,
                                              color: Color(0xFFDC6E46)),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        );
      }
    }
  }
}
