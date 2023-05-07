import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
// import 'package:moddormy_flutter/widgets/review/review_mockup.dart';

import '../../models/review.dart';

//List<ReviewM> reviews = generateMockReviews();

class UserReview extends StatefulWidget {
  final List<Review> reviews;
  const UserReview({super.key, required this.reviews});

  @override
  State<UserReview> createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {
  @override
  Widget build(BuildContext context) {
    var count = 0;
    if (widget.reviews.isEmpty) {
      count = 1;
    } else {
      count = widget.reviews.length;
    }
    //for (var room in widget.dorm.rooms) RoomItem(room: room),
    return SizedBox(
        height: MediaQuery.of(context).size.height * count * 0.226,
        child: Column(children: [
          for (var review in widget.reviews) showReview(reviews: review),
        ]));
  }
}

// ignore: camel_case_types
class showReview extends StatelessWidget {
  final Review reviews;
  const showReview({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: userHeader(reviews),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      subtitle: Column(
        children: [
          reviewContent(reviews),
          const Divider(thickness: 0.5, height: 20.0, color: Colors.grey)
        ],
      ),
    );
  }
}

Widget userHeader(Review reviews) {
  return Row(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage(
            reviews.user!.profileImage ?? 'assets/images/profileNull.png'),
      ),
      const SizedBox(width: 10.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //username+date
          Row(
            children: [
              Text(
                reviews.user!.username,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(width: 4.0),
              Text(
                DateFormat.yMMMd().format(reviews.createdAt!),
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),

          //rating
          Row(
            children: [
              RatingBarIndicator(
                rating: reviews.ratingOverall.toDouble(),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Color(0xffDC6E46),
                ),
                itemCount: 5,
                itemSize: 14.0,
                direction: Axis.horizontal,
              ),
              const SizedBox(width: 4.0),
              Text(
                '(${reviews.ratingOverall.toStringAsFixed(1)})',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),

      //delete button
      const Spacer(),
      showDeleteButton(reviews),
    ],
  );
}

Widget showDeleteButton(Review reviews) {
  final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000'));

  void deleteDormReview(int reviewId) async {
    //print(reviewId);
    try {
      final response =
          await dio.delete('/api/review/deleteDormReview?reviewId=$reviewId');
      //print(response.data.toString());
    } catch (e) {
      //print(e.toString());
    }
  }

  if (reviews.user!.userId == 'aH5CdH3VqlS1vVeqJ20WFKvGvmo2') {
    return IconButton(
        onPressed: () {
          deleteDormReview(reviews.reviewId);
        },
        icon: const Icon(Icons.delete_outline),
        color: const Color(0xffDC6E46));
  }
  return const SizedBox(
    height: 48,
    width: 32,
  );
}

Widget reviewContent(Review reviews) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: fiveRates(reviews)),
        const VerticalDivider(thickness: 0.5, width: 20.0, color: Colors.grey),
        Expanded(
          flex: 2,
          child: Text(
            reviews.review,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

Widget fiveRates(Review reviews) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Text(
            reviews.ratingPrice.toStringAsFixed(1),
            style: const TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          Text(
            reviews.ratingLocation.toStringAsFixed(1),
            style: const TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          Text(
            reviews.ratingFacility.toStringAsFixed(1),
            style: const TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          Text(
            reviews.ratingSanitary.toStringAsFixed(1),
            style: const TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          Text(
            reviews.ratingSecurity.toStringAsFixed(1),
            style: const TextStyle(color: Colors.black, fontSize: 14.0),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Price',
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          Text(
            'Location',
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          Text(
            'Facility',
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          Text(
            'Sanitary',
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          Text(
            'Security',
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
        ],
      ),
    ],
  );
}
