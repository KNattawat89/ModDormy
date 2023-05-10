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
  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    nameController.text = widget.dorm.name;
    houseNoController.text = widget.dorm.houseNo;
    streetController.text = widget.dorm.street;
    soiController.text = widget.dorm.soi;
    subDistrictController.text = widget.dorm.subDistrict;
    districtController.text = widget.dorm.district;
    cityController.text = widget.dorm.city;
    zipCodeController.text = widget.dorm.zipCode.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 130,
                  child: Text(
                    'Dorm name',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  onChanged: (value) {
                    widget.dorm.name = nameController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF2A8089), width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      hintText: 'Dorm Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Row(children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
                width: 100,
                child: Text(
                  'Address',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                )),
          ),
        ]),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: houseNoController,
                  onChanged: (value) {
                    widget.dorm.houseNo = houseNoController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF2A8089), width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      labelText: 'House No.'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
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
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF2A8089), width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      labelText: 'Soi'),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: streetController,
                  onChanged: (value) {
                    widget.dorm.street = streetController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF2A8089), width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      labelText: 'Street'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: subDistrictController,
                  onChanged: (value) {
                    widget.dorm.subDistrict = subDistrictController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF2A8089), width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      labelText: 'Sub-district'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: districtController,
                  onChanged: (value) {
                    widget.dorm.district = districtController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF2A8089), width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      labelText: 'District'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cityController,
                  onChanged: (value) {
                    widget.dorm.city = cityController.text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF2A8089), width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      labelText: 'City'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: zipCodeController,
                  onChanged: (value) {
                    widget.dorm.zipCode = int.parse(zipCodeController.text);
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF2A8089), width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.5))),
                      labelText: 'Zipcode'),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 5) {
                      return 'required 5 digit number';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
