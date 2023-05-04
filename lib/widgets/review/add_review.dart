import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/review/dropdown_section.dart';
import 'package:moddormy_flutter/widgets/review/star_section.dart';
import 'package:moddormy_flutter/widgets/review/text_section.dart';

import '../../models/review.dart';

class AddReview extends StatefulWidget {
  const AddReview({super.key});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  Review review = Review(
      review: "",
      priceRate: 0,
      locationRate: 0,
      facilityRate: 0,
      sanitaryRate: 0,
      securityRate: 0,
      overallRate: 0.0);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Card(
              color: const Color(0xffDFDADA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.all(14.0),
                child: RatingForm(
                  review: review,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
          child: Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // do something with the form data
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 8,
                backgroundColor: const Color(0xffDC6E46),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class RatingForm extends StatefulWidget {
  final Review review;
  const RatingForm({super.key, required this.review});

  @override
  State<RatingForm> createState() => _RatingFormState();
}

class _RatingFormState extends State<RatingForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StarSection(review: widget.review),
        Row(
          children: [
            Expanded(child: DropdownSection(review: widget.review)),
            const VerticalDivider(color: Colors.white, thickness: 1),
            Expanded(child: TextSection(review: widget.review)),
          ],
        )
      ],
    );
  }
}
