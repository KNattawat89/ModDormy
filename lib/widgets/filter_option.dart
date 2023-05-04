import 'package:flutter/material.dart';

Container filterOption({required String text, IconData? icon}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    decoration: BoxDecoration(
      color: const Color(0xFFDC6E46),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Wrap(
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            size: 18,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            // function
          },
          child: const Icon(
            Icons.cancel,
            color: Colors.white,
            size: 18,
          ),
        ),
      ],
    ),
  );
}
