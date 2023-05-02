import 'package:flutter/material.dart';

class FeatureRow extends StatelessWidget {
  final String featureName;
  final bool value;
  final Function(bool) onChanged;

  const FeatureRow(
      {Key? key,
      required this.featureName,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //Security guard
      children: [
        Checkbox(
          value: value,
          onChanged: (bool? value) {
            onChanged(value!);
          },
        ),
        Text(featureName)
      ],
    );
  }
}
