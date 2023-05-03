import 'package:flutter/material.dart';

import '../../models/dorm.dart';

class ContractSection extends StatefulWidget {
  final Dorm dorm;

  const ContractSection({Key? key, required this.dorm}) : super(key: key);

  @override
  State<ContractSection> createState() => _ContractSectionState();
}

class _ContractSectionState extends State<ContractSection> {
  final advPaymentController = TextEditingController();
  final electricController = TextEditingController();
  final waterController = TextEditingController();
  final otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Contract Detail'),
        Padding(
          //advance payment
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: advPaymentController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Advance payment'),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Enter';
            //   }
            //   return null;
            // },
          ),
        ),
        Padding(
          //electric price
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: electricController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Electric price'),
          ),
        ),
        Padding(
          //water price
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: waterController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Water price'),
          ),
        ),
        Padding(
          //other
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: otherController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'other'),
          ),
        ),
      ],
    );
  }
}
