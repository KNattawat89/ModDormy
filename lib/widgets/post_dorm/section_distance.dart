import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm.dart';

class DistanceSection extends StatefulWidget {
  final Dorm dorm;
  const DistanceSection({super.key, required this.dorm});

  @override
  State<DistanceSection> createState() => _DistanceSectionState();
}

class _DistanceSectionState extends State<DistanceSection> {
  final distanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Distance',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          textAlign: TextAlign.start,
        ),
        Padding(
          //Distance
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: distanceController,
            onChanged: (value) {
              widget.dorm.distance = double.parse(distanceController.text);
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Distance'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
