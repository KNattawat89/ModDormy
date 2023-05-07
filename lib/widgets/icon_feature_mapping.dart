import 'package:flutter/material.dart';

class IconFeatureMapping extends StatelessWidget {
  final String name;
  const IconFeatureMapping({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    if (name == "Parking") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Wifi") {
      return const Icon(Icons.wind_power);
    } else if (name == "Smoke free") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Water heater") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Security guard") {
      return const Icon(Icons.ac_unit);
    } else if (name == "CCTV") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Keycard") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Lift") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Pet friendly") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Pool") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Fitness") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Air conditioner") {
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
