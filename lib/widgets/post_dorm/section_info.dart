import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/dorm.dart';

class InfoSection extends StatefulWidget {
  final Dorm dorm;
  const InfoSection({Key? key, required this.dorm}) : super(key: key);

  @override
  State<InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  final nameController = TextEditingController();
  final houseNoController = TextEditingController();
  final streetController = TextEditingController();
  final soiController = TextEditingController();
  final subDistrictController = TextEditingController();
  final districtController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
                width: 100,
                child: Text(
                  'Dorm name',
                  textAlign: TextAlign.center,
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  onChanged: (value) {
                    widget.dorm.name = nameController.text;
                  },
                  decoration:
                  const InputDecoration(border: OutlineInputBorder()),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
                width: 100,
                child: Text(
                  'Address',
                  textAlign: TextAlign.center,
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: houseNoController,
                  onChanged: (value) {
                    widget.dorm.houseNo = houseNoController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'House No.'),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                //address
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: soiController,
                  onChanged: (value) {
                    widget.dorm.soi = soiController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Soi'),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 100,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: streetController,
                  onChanged: (value) {
                    widget.dorm.street = streetController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Street'),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 100,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: subDistrictController,
                  onChanged: (value) {
                    widget.dorm.subDistrict = subDistrictController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sub-district'),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 100,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: districtController,
                  onChanged: (value) {
                    widget.dorm.district = districtController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'District'),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 100,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cityController,
                  onChanged: (value) {
                    widget.dorm.city = cityController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'City'),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: zipCodeController,
                  onChanged: (value) {
                    widget.dorm.zipCode = zipCodeController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Zipcode'),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
