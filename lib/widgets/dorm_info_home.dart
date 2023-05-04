import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/build_star_rate.dart';

Column dormInfoHome(int rating, String dormName, int minPrice, int maxPrice,
    String pathImage, bool isFav, Function updateFav) {
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
                      child: isFav
                          ? IconButton(
                              onPressed: () {
                                updateFav();
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                // size:30,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                updateFav();
                              },
                              icon: const Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                                // size:30,
                              ),
                            ),
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
