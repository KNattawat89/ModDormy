

import 'package:flutter/material.dart';

TextFormField customTextFormFieldMinMaxPrice(String text){
  return TextFormField(
    validator: (value) {
      if (value == null ||
          value.isEmpty ||
          !RegExp(r'^[0-9]$').hasMatch(value)) {
        return 'Enter only number';
      } else {
        return null;
      }
    },
    cursorColor: const Color(0xFFDC6E46),
    decoration: InputDecoration(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFDC6E46)),
      ),
      hintText: text,
    ),
  );
}