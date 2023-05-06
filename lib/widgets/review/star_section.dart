import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moddormy_flutter/models/review.dart';

class StarSection extends StatefulWidget {
  final Review review;
  const StarSection({super.key, required this.review});

  @override
  State<StarSection> createState() => _StarSectionState();
}

class _StarSectionState extends State<StarSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Overall   ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        RatingBar.builder(
          initialRating: widget.review.ratingOverall.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemSize: 20.0,
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Color(0xffDC6E46)),
          onRatingUpdate: (newRating) {
            setState(() {
              () => widget.review.ratingOverall = newRating as int;
            });
          },
          unratedColor: Colors.white,
        ),
      ],
    );
  }
}
