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
  void initState() {
    super.initState();
    distanceController.text = widget.dorm.distance.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    'Distance',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.red),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const Text(
                'Distance from KMUTT',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.start,
              ),
            ],
          ),
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.5))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2A8089), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(12.5))),
                labelText: 'Distance* (KM)',
                labelStyle: TextStyle(color: Color.fromARGB(255, 85, 85, 85))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required and must be a number';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
