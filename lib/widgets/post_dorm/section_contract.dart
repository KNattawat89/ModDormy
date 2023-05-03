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
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contract Detail',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            textAlign: TextAlign.start,
          ),
          Padding(
            //advance payment
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: advPaymentController,
              onChanged: (value) {
                widget.dorm.advPayment = advPaymentController.text;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Advance payment'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter';
                }
                return null;
              },
            ),
          ),
          Padding(
            //electric price
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: electricController,
              onChanged: (value) {
                widget.dorm.electric = electricController.text;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Electric price'),
            ),
          ),
          Padding(
            //water price
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: waterController,
              onChanged: (value) {
                widget.dorm.water = waterController.text;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Water price'),
            ),
          ),
          Padding(
            //other
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: otherController,
              onChanged: (value) {
                widget.dorm.other = otherController.text;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'other'),
            ),
          ),
        ],
      ),
    );
  }
}
