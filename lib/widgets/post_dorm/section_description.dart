import 'package:flutter/material.dart';

import '../../models/dorm.dart';

class DescriptionSection extends StatefulWidget {
  final Dorm dorm;
  const DescriptionSection({Key? key, required this.dorm}) : super(key: key);

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0, left: 16),
          child: Text(
            'Dorm description',
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          //dorm desc
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            maxLines: 10,
            minLines: 7,
            controller: descriptionController,
            onChanged: (value) {
              widget.dorm.description = descriptionController.text;
            },
            decoration:
            const InputDecoration(border: OutlineInputBorder()),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'required';
            //   }
            //   return null;
            // },
          ),
        ),
      ],
    );
  }
}
