import 'package:flutter/material.dart';

Container filterFacility(bool isSelect, String text,IconData icon) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
      color: isSelect ? const Color(0xFFDC6E46) : Colors.white,
      border: Border.all(width: 2, color: const Color(0xFFDC6E46)),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: isSelect ? Colors.white : const Color(0xFFDC5E46),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text,
            style: TextStyle(
                fontSize: 14,
                color: isSelect ? Colors.white : const Color(0xFFDC6E46)))
      ],
    ),
  );
}
