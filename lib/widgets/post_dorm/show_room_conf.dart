import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/image.dart';
import 'package:moddormy_flutter/models/room.dart';
import 'package:moddormy_flutter/utilities/caller.dart';

class ShowRoomImages extends StatefulWidget {
  final Room room;
  const ShowRoomImages({super.key, required this.room});

  @override
  State<ShowRoomImages> createState() => _ShowRoomImagesState();
}

class _ShowRoomImagesState extends State<ShowRoomImages> {
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

  @override
  Widget build(BuildContext context) {
    if (myRimages.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
                          shrinkWrap: true,
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
