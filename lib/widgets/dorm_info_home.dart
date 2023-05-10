import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/build_star_rate.dart';
import 'package:provider/provider.dart';

import '../models/dorm_item.dart';
import '../models/fav_preload.dart';
import '../provider/user_provider.dart';
import '../utilities/caller.dart';

class DormInfoHome extends StatefulWidget {
  const DormInfoHome({Key? key, required this.dormItem, this.removeFav})
      : super(key: key);
  final Function? removeFav;
  final DormItem dormItem;

  @override
  State<DormInfoHome> createState() => _DormInfoHomeState();
}

class _DormInfoHomeState extends State<DormInfoHome> {
  // bool widget.dormItem.isFav = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // widget.dormItem.isFav = widget.isFav;
  }

  String compareMinMaxPrice(int min, int max) {
    if (min == max) {
      return '$min';
    }
    return '$min - $max';
  }

  @override
  Widget build(BuildContext context) {
    final String currentRouteName = ModalRoute.of(context)?.settings.name ?? "";
    final user = Provider.of<UserProvider>(context);
    User? userLogin = FirebaseAuth.instance.currentUser;
    void updateIsFav() async {
      if (user.userId != '' && userLogin != null) {
        if (widget.dormItem.isFav) {
          setState(() {
            _isLoading = true;
            widget.dormItem.isFav = !widget.dormItem.isFav;
          });
          try {
            if (currentRouteName == '/home') {
              await Caller.dio.delete(
                  '/api/fav/deleteFav?userId=${user.userId}&dormId=${widget.dormItem.dormId}');
              debugPrint('remove fav from home');
            } else if (currentRouteName == '/fav') {
              if (_isLoading) {
                showDialog<String>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) => AlertDialog(
                          content: SizedBox(
                            height: 100,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircularProgressIndicator(
                                        color: Color(0xFFDC6E46)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Loading..")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));

                await Caller.dio.delete(
                    '/api/fav/deleteFav?userId=${user.userId}&dormId=${widget.dormItem.dormId}');
                Navigator.pop(context);
                debugPrint('remove fav from fav');
                if (FavPreload.homeReload != null) {
                  FavPreload.homeReload!();
                }
                widget.removeFav!(widget.dormItem.dormId);
                setState(() {
                  _isLoading = false;
                });
              }
            }
          } catch (e) {
            debugPrint("hi ka${e.toString()}");
          }
        } else {
          setState(() {
            widget.dormItem.isFav = !widget.dormItem.isFav;
          });
          try {
            await Caller.dio.post('/api/fav/postFav', data: {
              "dorm_id": widget.dormItem.dormId,
              "user_id": user.userId
            });
            // FavPreload.refreshFav();
            debugPrint("called post fav");
          } on DioError catch (e) {
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
                  foregroundColor: const Color(0xFFDC6E46),
                ),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFFDC6E46)),
                child: const Text("Login"),
              )
            ],
          ),
        );
      }
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
                    widget.dormItem.coverImage,
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
                      child: Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                            onTap: () {
                              updateIsFav();
                            },
                            child: widget.dormItem.isFav
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.white,
                                  )),
                      ))),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        buildStarRating(widget.dormItem.overallRate),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            widget.dormItem.dormName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        Text(
          compareMinMaxPrice(
              widget.dormItem.minPrice, widget.dormItem.maxPrice),
          style: const TextStyle(color: Color(0xFFDC6E46), fontSize: 14),
        ),
      ],
    );
  }
}
