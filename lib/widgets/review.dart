//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/review/add_review.dart';
import 'package:moddormy_flutter/widgets/review/dorm_rating.dart';
// import 'package:moddormy_flutter/widgets/review/review_mockup.dart';
import 'package:moddormy_flutter/widgets/review/user_review.dart';
import 'package:provider/provider.dart';

import '../models/review.dart';
import '../provider/user_provider.dart';
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
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        color: const Color(0xffFFF8F0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Review (" '$reviewCount' ")",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            DormRating(reviews: reviews),
            UserReview(reviews: reviews, refresh: refresh),
            //AddReview(dormId: widget.dormId, refresh: refresh),
            showAddReview(context, widget.dormId, refresh)
          ],
        ));
  }
}

Widget showAddReview(
    BuildContext context, int dormId, void Function() refresh) {
  final user = Provider.of<UserProvider>(context);
  if (user.userType == 'DormOwner') {
    return const SizedBox();
  } else {
    return AddReview(dormId: dormId, refresh: refresh);
  }
}
