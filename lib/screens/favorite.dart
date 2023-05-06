import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import '../utilities/caller.dart';
import '../widgets/dorm_info_home.dart';
import '../widgets/my_appbar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  void getFavDorm() async {
    try {
      final response = await Caller.dio.get('/api/fav/getFav?userId=');
      // put type here
    } catch (e) {
      print(e);
    }
  }

  bool isFav = true;
  void updateIsFav() {
    setState(() {
      isFav = !isFav;
    });
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
                children: List.generate(5, (index) {
                  return Container(
                    child: Placeholder(),
                    // dormInfoHome(
                    //     5,
                    //     'dorm $index',
                    //     2000,
                    //     5000,
                    //     'http://moddormy.ivelse.com:8000/images/412494.jpeg',
                    //     isFav,
                    //     updateIsFav),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
