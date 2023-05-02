import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moddormy_flutter/widgets/review/addReview.dart';
import 'package:moddormy_flutter/widgets/review/dormRating.dart';
import 'package:moddormy_flutter/widgets/review/reviewMockup.dart';
import 'package:moddormy_flutter/widgets/review/userReview.dart';

List<Review> reviews = generateMockReviews();

class DormReview extends StatefulWidget {
  const DormReview({super.key});

  @override
  State<DormReview> createState() => _DormReviewState();
}

class _DormReviewState extends State<DormReview> {
  int reviewCount = reviews.length;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Text("Review (" '$reviewCount' ")",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DormRating(),
            UserReview(),
            AddReview(),
          ],
        ));
  }
}
