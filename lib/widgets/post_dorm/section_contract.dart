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
  void initState() {
    // TODO: implement initState
    super.initState();
    advPaymentController.text = widget.dorm.advPayment.toString();
    electricController.text = widget.dorm.electric.toString();
    waterController.text = widget.dorm.water.toString();
    otherController.text = widget.dorm.other.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  'Contract Detail',
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
          ),
          Padding(
            //advance payment
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: advPaymentController,
              onChanged: (value) {
                widget.dorm.advPayment = int.parse(advPaymentController.text);
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.5))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2A8089), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(12.5))),
                  labelText: 'Advance payment* (Months)',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 85, 85, 85))),
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
              keyboardType: TextInputType.number,
              controller: electricController,
              onChanged: (value) {
                widget.dorm.electric = double.parse(electricController.text);
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.5))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2A8089), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(12.5))),
                  labelText: 'Electric price* (baht/unit)',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 85, 85, 85))),
            ),
          ),
          Padding(
            //water price
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              //keyboardType: TextInputType.number,
              controller: waterController,
              onChanged: (value) {
                widget.dorm.water = double.parse(waterController.text);
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.5))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2A8089), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(12.5))),
                  labelText: 'Water price* (baht/unit)',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 85, 85, 85))),
            ),
          ),
          Padding(
            //other
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
            child: TextFormField(
              controller: otherController,
              onChanged: (value) {
                widget.dorm.other = otherController.text;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.5))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2A8089), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(12.5))),
                  labelText: 'other',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 85, 85, 85))),
            ),
          ),
        ],
      ),
    );
  }
}
