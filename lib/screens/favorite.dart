import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm_list.dart';
import 'package:moddormy_flutter/provider/user_provider.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import 'package:provider/provider.dart';
import '../models/dorm_item.dart';
import '../utilities/caller.dart';
import '../widgets/dorm_info_home.dart';
import '../widgets/my_appbar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key, this.favDormArgu, this.refreshState}) : super(key: key);
  final List<DormItem>? favDormArgu;
  final Function? refreshState;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<DormItem> defaultFavDorm = [];

  void removeFav(int dormId) {
    defaultFavDorm.removeWhere((dorm) => dorm.dormId == dormId);
    setState(() {});
    defaultFavDorm.forEach((dorm) {
      print('Dorm ${dorm.dormId}: ${dorm.isFav}');
    });
  }
  @override
  void initState(){
    super.initState();
    if(defaultFavDorm != null){
      setState(() {
        defaultFavDorm = widget.favDormArgu!;
      });

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
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 20,
              childAspectRatio: (8 / 10),
              children: List.generate(defaultFavDorm.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/dorms/${defaultFavDorm[index].dormId}');
                  },
                  child: DormInfoHome(
                    dormId: defaultFavDorm[index].dormId,
                    dormName: defaultFavDorm[index].dormName,
                    pathImage: defaultFavDorm[index].coverImage,
                    isFav: defaultFavDorm[index].isFav,
                    minPrice: defaultFavDorm[index].minPrice,
                    maxPrice: defaultFavDorm[index].maxPrice,
                    rating: defaultFavDorm[index].overallRate,
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
