import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moddormy_flutter/widgets/review/review_mockup.dart';

List<ReviewM> reviews = generateMockReviews();

class UserReview extends StatefulWidget {
  const UserReview({super.key});

  @override
  State<UserReview> createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {
  @override
  Widget build(BuildContext context) {
    var count = 0;
    if (reviews.length == 0) {
      count = 1;
    } else {
      count = reviews.length;
    }
    return Container(
      height: MediaQuery.of(context).size.height * count * 0.2,
      child: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          ReviewM review = reviews[index];
          int rating = review.overallRate;
          String ratingString = rating.toStringAsFixed(1);
          int wholeRating = rating.floor();
          List<Widget> starRating = [];
          for (int i = 0; i < wholeRating; i++) {
            starRating.add(const Icon(Icons.star, color: Colors.orange));
          }
          if (rating - wholeRating > 0) {
            starRating.add(const Icon(Icons.star_half, color: Colors.orange));
          }
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
                Text(review.userId),
                Text(
                  DateFormat.yMMMd().format(review.createDate),
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
                    Row(children: starRating),
                    const SizedBox(width: 4.0),
                    Text('($ratingString)'),
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
                            'Price: ${review.priceRate}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Location: ${review.locationRate}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Facility: ${review.facilityRate}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Sanitary: ${review.sanitaryRate}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Security: ${review.securityRate}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      flex: 2,
                      child: Text(
                        review.reviewText,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
