import 'package:flutter/material.dart';

Container rateFilter(bool rate, int rateNumber) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
      color: rate ? const Color(0xFFDC6E46) : Colors.white,
      border: Border.all(
          width: 2,
          color: rate ? const Color(0xFFDC6E46) : const Color(0xFFDEDEDE)),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Text(
          rateNumber == 5 ? '$rateNumber' : '≥$rateNumber',
          style: TextStyle(
              fontSize: 14,
              color: rate ? Colors.white : const Color(0xFFA2A2A2)),
        ),
        Icon(
          Icons.star,
          size: 20,
          color: rate ? Colors.white : const Color(0xFFA2A2A2),
        )
      ],
    ),
  );
}
