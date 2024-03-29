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
  void initState() {
    super.initState();
    descriptionController.text = widget.dorm.description;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: const [
              Text(
                'Dorm description',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              Text(
                '*',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.red),
              ),
            ],
          ),
        ),
        Padding(
          //dorm desc
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            maxLines: 10,
            minLines: 7,
            controller: descriptionController,
            onChanged: (value) {
              widget.dorm.description = descriptionController.text;
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.5))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2A8089), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(12.5)))),
            validator: (value) {
              if (value == null || value.isEmpty || value == '') {
                return 'required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
