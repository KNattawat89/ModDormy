import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/build_star_rate.dart';

Column dormInfoHome(
    int rating, String dormName, int minPrice, int maxPrice, String pathImage) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(80), // Image radius
              child: Image.asset(pathImage, fit: BoxFit.cover,height: 80,),
            ),
          )
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
        '$minPrice - $maxPrice',
        style: const TextStyle(color: Color(0xFFDC6E46), fontSize: 12),
      ),
    ],
  );
}
