import 'package:flutter/material.dart';

import 'package:moddormy_flutter/models/review.dart';

class TextSection extends StatefulWidget {
  final Review review;
  const TextSection({super.key, required this.review});

  @override
  State<TextSection> createState() => _TextSectionState();
}

class _TextSectionState extends State<TextSection> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.red[700]),
        border: InputBorder.none,
        hintText: 'Write your review here...',
        hintStyle: const TextStyle(color: Color(0xff858585), fontSize: 14),
        contentPadding: const EdgeInsets.all(10),
      ),
      // autofocus: true,
      maxLines: 9,
      onChanged: (value) {
        setState(() {
          widget.review.review = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a review';
        }
        return null;
      },
    );
  }
}
