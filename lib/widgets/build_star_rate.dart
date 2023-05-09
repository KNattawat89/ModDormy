import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Row buildStarRating(double rating) {
  String formatRate = rating.toStringAsFixed(2);
  return Row(
    children: [
      RatingBarIndicator(
        rating: rating,
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Color(0xffDC6E46),
        ),
        unratedColor: const Color(0xFFE2E2E2),
        itemCount: 5,
        itemSize: 20.0,
        direction: Axis.horizontal,
      ),
      const SizedBox(width: 5),
      Text(
        '($formatRate)',
        style: const TextStyle(color: Color(0xFFA9A9A9)),
      ),
    ],
  );
}
