import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/review/add_review.dart';
import 'package:moddormy_flutter/widgets/review/dorm_rating.dart';
import 'package:moddormy_flutter/widgets/review/review_mockup.dart';
import 'package:moddormy_flutter/widgets/review/user_review.dart';

import '../models/review.dart';

//List<ReviewM> reviews = generateMockReviews();

class DormReview extends StatefulWidget {
  const DormReview({Key? key}) : super(key: key);

  @override
  State<DormReview> createState() => _DormReviewState();
}

class _DormReviewState extends State<DormReview> {
  int reviewCount = 0;
  List<Review> reviews = [];
  final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000'));

  void getDormReview(int dormId) async {
    //print('test');
    try {
      final response =
          await dio.get('/api/review/getDormReview?dormId=$dormId');
      print(response.data.toString());

      setState(() {
        this.reviews =
            response.data.map<Review>((json) => Review.fromJson(json)).toList();
        reviewCount = reviews.length;
        print(this.reviews);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getDormReview(20);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xffFFF8F0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Review (" '$reviewCount' ")",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const DormRating(),
            const UserReview(),
            const AddReview(),
          ],
        ));
  }
}
