import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/icon_feature_mapping.dart';

class FeatureRow extends StatelessWidget {
  final String featureName;
  final bool value;
  final Function(bool) onChanged;
  final String iconName;

  const FeatureRow(
      {Key? key,
      required this.featureName,
      required this.value,
      required this.onChanged,
      required this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          activeColor: const Color(0xffdc6e46),
          onChanged: (bool? value) {
            onChanged(value!);
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: IconFeatureMapping(name: iconName),
        ),
        Text(featureName)
      ],
    );
  }
}
