import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_feature_row.dart';

import '../../models/dorm.dart';

class FeatureSection extends StatefulWidget {
  final Dorm dorm;

  const FeatureSection({Key? key, required this.dorm}) : super(key: key);

  @override
  State<FeatureSection> createState() => _FeatureSectionState();
}

class _FeatureSectionState extends State<FeatureSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Dorm Features',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
          FeatureRow(
              iconName: "Parking",
              featureName: "Parking",
              value: widget.dorm.feature.parking,
              onChanged: (value) =>
                  setState(() => widget.dorm.feature.parking = value)),
          FeatureRow(
              iconName: "Wifi",
              featureName: "Wi-Fi",
              value: widget.dorm.feature.wifi,
              onChanged: (value) =>
                  setState(() => widget.dorm.feature.wifi = value)),
          FeatureRow(
              iconName: "Smoke free",
              featureName: "Smoke Free",
              value: widget.dorm.feature.smokeFree,
              onChanged: (value) =>
                  setState(() => widget.dorm.feature.smokeFree = value)),
          FeatureRow(
              iconName: "CCTV",
              featureName: "CCTV",
              value: widget.dorm.feature.cctv,
              onChanged: (value) =>
                  setState(() => widget.dorm.feature.cctv = value)),
          // Keycard
          FeatureRow(
              iconName: "Keycard",
              featureName: "Keycard",
              value: widget.dorm.feature.keycard,
              onChanged: (value) =>
                  setState(() => widget.dorm.feature.keycard = value)),
          // Lift
          FeatureRow(
              iconName: "Lift",
              featureName: "Lift",
              value: widget.dorm.feature.lift,
              onChanged: (value) =>
                  setState(() => widget.dorm.feature.lift = value)),
          FeatureRow(
              iconName: "Pet friendly",
              featureName: "Pet Friendly",
              value: widget.dorm.feature.petFriendly,
              onChanged: (value) =>
                  setState(() => widget.dorm.feature.petFriendly = value)),
          FeatureRow(
              iconName: "Pool",
              featureName: "Pool",
              value: widget.dorm.feature.pool,
              onChanged: (value) =>
                  setState(() => widget.dorm.feature.pool = value)),
          FeatureRow(
              iconName: "Fitness",
              featureName: "Fitness",
              value: widget.dorm.feature.fitness,
              onChanged: (value) =>
                  setState(() => widget.dorm.feature.fitness = value)),
        ],
      ),
    );
  }
}
