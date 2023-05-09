import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm_list.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import '../models/dorm_item.dart';
import '../utilities/caller.dart';
import '../widgets/dorm_info_home.dart';
import '../widgets/my_appbar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key})
      : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<DormItem> favDorm = [];
  User? user = FirebaseAuth.instance.currentUser;
  bool _isLoading = false;

  void removeFav(int dormId) {
    favDorm.removeWhere((dorm) => dorm.dormId == dormId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print("fav screen init state");
    // if(FavPreload.favs != null){
    //   setState(() {
    //     favDorm = FavPreload.favs!;
    //   });
    // }
    if (user != null) {
      getFavDorm();
    }
  }

  void getFavDorm() async {
    try {
      setState(() {
        _isLoading = true;
      });
      String uid = user!.uid;
      final response = await Caller.dio.get('/api/fav/getFav?userId=$uid');
      DormList d = DormList.fromJson(response.data);
      setState(() {
        favDorm = d.data;
        _isLoading = false;
      });
      print("gatfaved");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      endDrawer: const MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Favorite Dorms",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            favDorm.isEmpty
                ? const SizedBox(
                    height: 0,
                  )
                : const SizedBox(
                    height: 20,
                  ),
            _isLoading
                ? Column(
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFDC6E46),
                        ),
                      )
                    ],
                  )
                : favDorm.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/favorite-4.png',
                                scale: 3,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "No Favorite yet",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                              const Text(
                                  'Save your favorite dorms and find them here later')
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 20,
                        childAspectRatio: (8 / 10),
                        children: List.generate(favDorm.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/dorms/${favDorm[index].dormId}');
                            },
                            child: DormInfoHome(
                              dormItem: favDorm[index],
                              removeFav: removeFav,
                            ),
                          );
                        }),
                      )),
          ],
        ),
      ),
    );
  }
}
