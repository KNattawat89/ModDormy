import 'package:flutter/material.dart';

Row buildStarRating(int rating) {
  List<Widget> stars = [];
  for (int i = 0; i < rating; i++) {
    stars.add(const Icon(Icons.star, color: Color(0xFFDC6E46),size: 20,));
  }
  int remaining = 5 - stars.length;
  for (int i = 0; i < remaining; i++) {
    stars.add(const Icon(Icons.star, color: Color(0xFFE2E2E2),size: 20));
  }
  return Row(
    children: [
      Row(children: stars),
      const SizedBox(width: 5),
      Text(
        '($rating.0)',
        style: const TextStyle(color: Color(0xFFA9A9A9)),
      ),
    ],
  );
}
