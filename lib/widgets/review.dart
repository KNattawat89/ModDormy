import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/review/add_review.dart';
import 'package:moddormy_flutter/widgets/review/dorm_rating.dart';
// import 'package:moddormy_flutter/widgets/review/review_mockup.dart';
import 'package:moddormy_flutter/widgets/review/user_review.dart';

import '../models/review.dart';
import '../utilities/caller.dart';

//List<ReviewM> reviews = generateMockReviews();

class DormReview extends StatefulWidget {
  final int dormId;
  const DormReview({Key? key, required this.dormId}) : super(key: key);

  @override
  State<DormReview> createState() => _DormReviewState();
}

class _DormReviewState extends State<DormReview> {
  int reviewCount = 0;
  List<Review> reviews = [];
  //final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000'));

  void getDormReview(int dormId) async {
    //print('test');
    try {
      final response =
          await Caller.dio.get('/api/review/getDormReview?dormId=$dormId');
      //print(response.data.toString());
      List<Review> r =
          response.data.map<Review>((json) => Review.fromJson(json)).toList();
      //r.forEach((e) => print(e.toJson().toString()));
      setState(() {
        reviews = r;
        reviewCount = reviews.length;
      });
    } catch (e) {
      //print(e.toString());
    }
  }

  bool isLoaded = false;

  void refresh() async {
    getDormReview(widget.dormId);
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getDormReview(widget.dormId);
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
            DormRating(reviews: reviews),
            UserReview(reviews: reviews, refresh: refresh),
            AddReview(dormId: widget.dormId, refresh: refresh),
          ],
        ));
  }
}
