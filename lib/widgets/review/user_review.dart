// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import 'package:moddormy_flutter/widgets/review/review_mockup.dart';

import '../../models/review.dart';
import '../../provider/user_provider.dart';
import '../../utilities/caller.dart';

//List<ReviewM> reviews = generateMockReviews();

class UserReview extends StatefulWidget {
  final Function refresh;
  final List<Review> reviews;
  const UserReview(
      {super.key,
      required this.reviews,
      required void Function() this.refresh});

  @override
  State<UserReview> createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {
  @override
  Widget build(BuildContext context) {
    if (widget.reviews.isEmpty) {
      return const Center(
        child: Text('No review yet.'),
      );
    } else {
      return SizedBox(
          height: MediaQuery.of(context).size.height *
              widget.reviews.length *
              0.226,
          child: Column(children: [
            for (var review in widget.reviews)
              showReview(reviews: review, refresh: widget.refresh),
          ]));
    }
  }
}

// ignore: camel_case_types
class showReview extends StatelessWidget {
  final Review reviews;
  final Function refresh;
  const showReview({super.key, required this.reviews, required this.refresh});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return ListTile(
      title: userHeader(reviews, user.userId, context, refresh),
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

Widget userHeader(
    Review reviews, String userId, BuildContext context, Function refresh) {
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
      showDeleteButton(reviews, userId, context, refresh),
    ],
  );
}

Widget showDeleteButton(
    Review reviews, String userId, BuildContext context, Function refresh) {
  // final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000'));

  void deleteDormReview(int reviewId) async {
    //print(reviewId);
    try {
      final response = await Caller.dio
          .delete('/api/review/deleteDormReview?reviewId=$reviewId');
      refresh();
      //print(response.data.toString());
    } catch (e) {
      //print(e.toString());
    }
  }

  // ignore: unrelated_type_equality_checks
  if (reviews.user!.userId == userId) {
    return IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: const Text(
                  "Are you sure?",
                  textAlign: TextAlign.center,
                ),
                content: const Text(
                  "You will not be able to recover this review!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Color(0xff838383)),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            elevation: 8,
                            backgroundColor: const Color(0xff838383),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: const Text("Cancel")),
                      ElevatedButton(
                          onPressed: () {
                            // Perform the form submission here
                            Navigator.pop(context);
                            deleteDormReview(reviews.reviewId);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 8,
                            backgroundColor: const Color(0xffDC6E46),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: const Text("Yes, delete it!")),
                    ],
                  ),
                ],
              );
            },
          );
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
