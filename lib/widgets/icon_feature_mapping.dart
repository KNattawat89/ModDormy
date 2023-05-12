import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class IconFeatureMapping extends StatelessWidget {
  final String name;
  const IconFeatureMapping({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    if (name == "Parking") {
      return const Icon(LineIcons.car);
    } else if (name == "Wifi") {
      return const Icon(LineIcons.wifi);
    } else if (name == "Smoke free") {
      return const Icon(LineIcons.smokingBan);
    } else if (name == "Water heater") {
      return const Icon(LineIcons.shower);
    } else if (name == "Security guard") {
      return const Icon(LineIcons.userShield);
    } else if (name == "CCTV") {
      return Image.network(
        'https://cdn-icons-png.flaticon.com/512/3773/3773934.png',
        width: 22,
        height: 22,
      );
    } else if (name == "Keycard") {
      return const Icon(LineIcons.identificationCard);
    } else if (name == "Lift") {
      return const Icon(Icons.elevator_rounded);
    } else if (name == "Pet friendly") {
      return const Icon(Icons.pets_outlined);
    } else if (name == "Pool") {
      return const Icon(LineIcons.swimmingPool);
    } else if (name == "Fitness") {
      return const Icon(LineIcons.dumbbell);
    } else if (name == "Air conditioner") {
      return const Icon(Icons.ac_unit);
    } else if (name == "Fan") {
      return const Icon(LineIcons.fan);
    } else if (name == "Furnished") {
      return const Icon(LineIcons.couch);
    } else if (name == "TV") {
      return const Icon(LineIcons.television);
    } else if (name == "Refrigerator") {
      return const Icon(Icons.kitchen_rounded);
    } else if (name == "Bathroom") {
      return const Icon(Icons.wc_rounded);
    } else {
      return const Text("x");
    }
  }
}
