import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:moddormy_flutter/widgets/review/review_mockup.dart';

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
    return Container(
        height: MediaQuery.of(context).size.height * count * 0.21,
        child: Column(children: [
          for (var review in widget.reviews) showReview(reviews: review),
        ]));
  }
}

class showReview extends StatelessWidget {
  final Review reviews;
  const showReview({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    int rating = reviews.ratingOverall;
    String ratingString = rating.toStringAsFixed(1);

    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR00L8GRKSQVHDXAnex599APwTABc7_5WRD_w&usqp=CAU'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(reviews.user!.username),
          Text(
            DateFormat.yMMMd().format(reviews.createdAt!),
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Row(
            children: [
              RatingBarIndicator(
                rating: reviews.ratingOverall.toDouble(),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Color(0xffDC6E46),
                ),
                itemCount: 5,
                itemSize: 12.0,
                direction: Axis.horizontal,
              ),
              const SizedBox(width: 4.0),
              Text(
                '($ratingString)',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price: ${reviews.ratingPrice}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Location: ${reviews.ratingLocation}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Facility: ${reviews.ratingFacility}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Sanitary: ${reviews.ratingSanitary}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Security: ${reviews.ratingSecurity}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
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
        ],
      ),
    );
  }
}
