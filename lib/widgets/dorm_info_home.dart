import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'package:moddormy_flutter/widgets/build_star_rate.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       child:  IconButton(
//         icon: Icons.abc_outlined,
//       onPressed: 
//       },
//       ),
//     );
//   }
// }

final navigatorKey = GlobalKey<NavigatorState>();


Column dormInfoHome(int rating, String dormName, int minPrice, int maxPrice,
    String pathImage, bool isFav, Function updateFav) {
  String compareMinMaxPrice(int min, int max) {
    if (min == max) {
      return '$min';
    }
    return '$min - $max';
  }

MaterialApp(
   
    navigatorKey: navigatorKey, // Setting a global key for navigator
  );
  BuildContext context;
  return
   Column(
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
                  pathImage,
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
                      child:   isFav
                          ? IconButton(
                              onPressed: () {
                               
                                updateFav();
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                // size:30,
                              ))
            
                              
                          : IconButton(
                              onPressed: () {
                                // FirebaseAuth.instance.currentUser == null ? 
                                // updateFav() : showDialog(context: context, builder: (context) => )
                              },
                              icon: const Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                                // size:30,
                              ),
                            )
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
      buildStarRating(rating),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          dormName,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      Text(
        compareMinMaxPrice(minPrice, maxPrice),
        style: const TextStyle(color: Color(0xFFDC6E46), fontSize: 14),
      ),
    ],
  );
}
