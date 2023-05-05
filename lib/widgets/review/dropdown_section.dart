import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:moddormy_flutter/models/review.dart';

class DropdownSection extends StatefulWidget {
  final Review review;
  const DropdownSection({super.key, required this.review});

  @override
  State<DropdownSection> createState() => _DropdownSectionState();
}

class _DropdownSectionState extends State<DropdownSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // price
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: DropdownButtonFormField2<int>(
            decoration: const InputDecoration.collapsed(
              hintText: '',
              border: InputBorder.none,
            ),
            isExpanded: true,
            isDense: true,
            hint: const Text(
              'Price',
            ),
            iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                    color: Color(0xffDC6E46), size: 20),
                iconSize: 14),
            dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8),
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
            ),
            onChanged: (int? newValue) {
              setState(() => widget.review.priceRate = newValue!);
            },
            items: <int>[1, 2, 3, 4, 5].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                          value,
                          (index) => const Icon(
                                Icons.star,
                                color: Color(0xffDC6E46),
                                size: 14,
                              )),
                    ),
                    Text(
                      '$value',
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xffDC6E46)),
                    ),
                  ],
                ),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select a rating';
              }
              return null;
            },
          ),
        ),

        // location
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: DropdownButtonFormField2<int>(
            decoration: const InputDecoration.collapsed(
              hintText: '',
              border: InputBorder.none,
            ),
            isExpanded: true,
            isDense: true,
            hint: const Text('Location'),
            iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                    color: Color(0xffDC6E46), size: 20),
                iconSize: 14),
            dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8),
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
            onChanged: (int? newValue) {
              setState(() => widget.review.locationRate = newValue!);
            },
            items: <int>[1, 2, 3, 4, 5].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                          value,
                          (index) => const Icon(
                                Icons.star,
                                color: Color(0xffDC6E46),
                                size: 14,
                              )),
                    ),
                    Text(
                      '$value',
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xffDC6E46)),
                    ),
                  ],
                ),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select a rating';
              }
              return null;
            },
          ),
        ),

        // facility
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: DropdownButtonFormField2<int>(
            decoration: const InputDecoration.collapsed(
              hintText: '',
              border: InputBorder.none,
            ),
            isExpanded: true,
            isDense: true,
            hint: const Text('Facility'),
            iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                    color: Color(0xffDC6E46), size: 20),
                iconSize: 14),
            dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8),
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
            onChanged: (int? newValue) {
              setState(() => widget.review.facilityRate = newValue!);
            },
            items: <int>[1, 2, 3, 4, 5].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                          value,
                          (index) => const Icon(
                                Icons.star,
                                color: Color(0xffDC6E46),
                                size: 14,
                              )),
                    ),
                    Text(
                      '$value',
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xffDC6E46)),
                    ),
                  ],
                ),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select a rating';
              }
              return null;
            },
          ),
        ),
        // sanitary
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: DropdownButtonFormField2<int>(
            decoration: const InputDecoration.collapsed(
              hintText: '',
              border: InputBorder.none,
            ),
            isExpanded: true,
            isDense: true,
            hint: const Text('Sanitary'),
            iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                    color: Color(0xffDC6E46), size: 20),
                iconSize: 14),
            dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8),
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
            onChanged: (int? newValue) {
              setState(() => widget.review.sanitaryRate = newValue!);
            },
            items: <int>[1, 2, 3, 4, 5].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                          value,
                          (index) => const Icon(
                                Icons.star,
                                color: Color(0xffDC6E46),
                                size: 14,
                              )),
                    ),
                    Text(
                      '$value',
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xffDC6E46)),
                    ),
                  ],
                ),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select a rating';
              }
              return null;
            },
          ),
        ),

        // security
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: DropdownButtonFormField2<int>(
            decoration: const InputDecoration.collapsed(
              hintText: '',
              border: InputBorder.none,
            ),
            isExpanded: true,
            isDense: true,
            hint: const Text('Security'),
            iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                    color: Color(0xffDC6E46), size: 20),
                iconSize: 14),
            dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8),
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
            onChanged: (int? newValue) {
              setState(() => widget.review.securityRate = newValue!);
            },
            items: <int>[1, 2, 3, 4, 5].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                          value,
                          (index) => const Icon(
                                Icons.star,
                                color: Color(0xffDC6E46),
                                size: 14,
                              )),
                    ),
                    Text(
                      '$value',
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xffDC6E46)),
                    ),
                  ],
                ),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select a rating';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
