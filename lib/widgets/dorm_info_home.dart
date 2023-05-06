import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/post_fav.dart';
import 'package:moddormy_flutter/widgets/build_star_rate.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import '../utilities/caller.dart';

class DormInfoHome extends StatefulWidget {
  const DormInfoHome(
      {Key? key,
      required this.dormId,
      required this.dormName,
      required this.rating,
      required this.pathImage,
      required this.minPrice,
      required this.maxPrice,
      required this.isFav})
      : super(key: key);
  final int rating;
  final int dormId;
  final String dormName;
  final int minPrice;
  final int maxPrice;
  final String pathImage;
  final bool isFav;

  @override
  State<DormInfoHome> createState() => _DormInfoHomeState();
}

class _DormInfoHomeState extends State<DormInfoHome> {
  bool _isFav = false;

  @override
  void initState(){
    super.initState();
    _isFav = widget.isFav;
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);
    void updateIsFav() async {
      if (user.userId != '') {
        if(_isFav){
          setState(() {
            _isFav = !_isFav;
          });
          try {
            await Caller.dio.delete('/api/fav/deleteFav?userId=${user.userId}&dormId=${widget.dormId}');
          } catch (e) {
            debugPrint(e.toString());
          }
        }else {
          setState(() {
            _isFav = !_isFav;
          });
          try {
            await Caller.dio.post('/api/fav/postFav',
                data: {"dorm_id": widget.dormId, "user_id": user.userId});
          } on DioError catch(e) {
            debugPrint(e.response.toString());
            Caller.handle(context, e);
          }

        }

      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Login required"),
              content: const Text("Please log in to favorite this dorm."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor:  const Color(0xFFDC6E46),
                  ),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor:  Colors.white,
                    backgroundColor: const Color(0xFFDC6E46)
                  ),
                  child: const Text("Login"),
                )
              ],
            ));
      }
    }

    String compareMinMaxPrice(int min, int max) {
      if (min == max) {
        return '$min';
      }
      return '$min - $max';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(90), // Image radius
                  child: Image.network(
                    widget.pathImage,
                    fit: BoxFit.cover,
                    height: 80,
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                      backgroundColor: const Color(0xA9888888),
                      // อย่าลืมปรับตรงนี้
                      child: Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                            onTap: () {
                              updateIsFav();
                            },
                            child: _isFav
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.white,
                                  )),
                        // : IconButton(
                        //   onPressed: () {
                        //     updateFav();
                        //   },
                        //   icon: const Icon(
                        //     Icons.favorite_outline,
                        //     color: Colors.black,
                        //     // size:30,
                        //   ),
                        // )
                      ))),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        buildStarRating(widget.rating),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            widget.dormName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        Text(
          compareMinMaxPrice(widget.minPrice, widget.maxPrice),
          style: const TextStyle(color: Color(0xFFDC6E46), fontSize: 14),
        ),
      ],
    );
  }
}
