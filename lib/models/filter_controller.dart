import 'package:flutter/material.dart';

class FilterTextEditingController {
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  final TextEditingController distantController = TextEditingController();

  String get firstName => minPriceController.text;
  set firstName(String value) => minPriceController.text = value;

  String get distant => distantController.text;
  set distant(String value) => distantController.text = value;

  String get lastName => maxPriceController.text;
  set lastName(String value) => maxPriceController.text = value;

  void dispose() {
    minPriceController.dispose();
    maxPriceController.dispose();
    distantController.dispose();
  }
}
