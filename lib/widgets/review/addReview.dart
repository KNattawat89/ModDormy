import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddReview extends StatefulWidget {
  const AddReview({super.key});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
        color: Color.fromARGB(255, 191, 189, 194),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 8,
        child: Container(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RatingForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'rate...',
                    style: TextStyle(fontSize: 15),
                  ),
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Text('write review...')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingForm extends StatefulWidget {
  const RatingForm({super.key});

  @override
  State<RatingForm> createState() => _RatingFormState();
}

class _RatingFormState extends State<RatingForm> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Overall   ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemSize: 20.0,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (newRating) {
            setState(() {
              rating = newRating;
            });
          },
        ),
      ],
    );
  }
}
