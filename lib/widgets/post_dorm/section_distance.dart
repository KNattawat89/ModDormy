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
    // TODO: implement initState
    super.initState();
    distanceController.text = widget.dorm.distance.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Distance',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            textAlign: TextAlign.start,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF2A8089), width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5))), labelText: 'Distance'),
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
