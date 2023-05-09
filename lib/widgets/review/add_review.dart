import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:moddormy_flutter/widgets/review.dart';
// import 'package:moddormy_flutter/models/user_item.dart';
import 'package:moddormy_flutter/widgets/review/dropdown_section.dart';
import 'package:moddormy_flutter/widgets/review/star_section.dart';
import 'package:moddormy_flutter/widgets/review/text_section.dart';
import 'package:provider/provider.dart';

import '../../models/review.dart';
import '../../provider/user_provider.dart';
import '../../utilities/caller.dart';

class AddReview extends StatefulWidget {
  final Function refresh;
  final int dormId;
  const AddReview(
      {super.key, required this.dormId, required void Function() this.refresh});
  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  void postReview(Review review) async {
    try {
      //print(review.toJson().toString() + 'try');
      // ignore: unused_local_variable
      final response = await Caller.dio
          .post('/api/review/addDormReview', data: review.toJson());
      widget.refresh();
      //print(response.data.toString() + 'try');
      //print(FirebaseAuth.instance.currentUser);
      // ignore: unused_catch_clause
    } on DioError catch (e) {
      //print(e.toString());
      //print(review.toJson().toString() + 'catch');
      //print(FirebaseAuth.instance.currentUser);
      //print(e.toString());
      //print(e.response?.data.toString());
    }
  }

  final _formKey = GlobalKey<FormState>();
  Review review = Review(
      dormId: 0,
      review: "",
      ratingPrice: 0,
      ratingLocation: 0,
      ratingFacility: 0,
      ratingSanitary: 0,
      ratingSecurity: 0,
      ratingOverall: 0,
      createdAt: null,
      userId: "",
      user: null,
      reviewId: 0);

  @override
  void initState() {
    super.initState();
    review = Review(
      dormId: widget.dormId,
      review: "",
      ratingPrice: 0,
      ratingLocation: 0,
      ratingFacility: 0,
      ratingSanitary: 0,
      ratingSecurity: 0,
      ratingOverall: 0,
      createdAt: null,
      userId: "",
      user: null,
      reviewId: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    review.userId = user.userId;
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
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
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
                  _formKey.currentState!.save();
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
                          "Are you sure to confirm your review?",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff838383)),
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
                                    if (user.userId != '' &&
                                        FirebaseAuth.instance.currentUser !=
                                            null) {
                                      Navigator.pop(context);
                                      postReview(review);
                                      review = Review(
                                        dormId: widget.dormId,
                                        review: "",
                                        ratingPrice: 0,
                                        ratingLocation: 0,
                                        ratingFacility: 0,
                                        ratingSanitary: 0,
                                        ratingSecurity: 0,
                                        ratingOverall: 0,
                                        createdAt: null,
                                        userId: user.userId,
                                        user: null,
                                        reviewId: 0,
                                      );
                                      _formKey.currentState!.reset();
                                    } else {
                                      Navigator.pop(context);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            elevation: 8,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            title: const Text(
                                              "Error",
                                              textAlign: TextAlign.center,
                                            ),
                                            content: const Text(
                                              "Please login to post a review",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff838383)),
                                            ),
                                            actions: [
                                              Center(
                                                child: ElevatedButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      elevation: 8,
                                                      backgroundColor:
                                                          const Color(
                                                              0xffDC6E46),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                    ),
                                                    child: const Text("OK")),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 8,
                                    backgroundColor: const Color(0xffDC6E46),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  child: const Text("Yes, post it!")),
                            ],
                          ),
                        ],
                      );
                    },
                  );

                  //print(user.userId);
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(90, 30),
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
