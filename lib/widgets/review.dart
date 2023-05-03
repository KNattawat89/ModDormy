import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/review/add_review.dart';
import 'package:moddormy_flutter/widgets/review/dorm_rating.dart';
import 'package:moddormy_flutter/widgets/review/review_mockup.dart';
import 'package:moddormy_flutter/widgets/review/user_review.dart';

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
            const DormRating(),
            const UserReview(),
            const AddReview(),
          ],
        ));
  }
}
