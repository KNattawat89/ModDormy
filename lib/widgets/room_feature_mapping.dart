import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RoomFeatureMapping extends StatelessWidget {
  final String name;
  const RoomFeatureMapping({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    if (name == "Air conditioner") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Fan") {
      return const Icon(Icons.wind_power);
    } else if (name == "Furnished") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Water heater") {
      return const Icon(Icons.ac_unit);
    } else if (name == "TV") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Refrigerator") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Bathroom") {
      return const Icon(Icons.ac_unit);
    } else {
      return const Text("x");
    }
  }
}
