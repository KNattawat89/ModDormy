import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/FilterController.dart';
import 'package:moddormy_flutter/models/filter_item.dart';
import 'package:moddormy_flutter/widgets/CustomTextFormField.dart';
import 'package:moddormy_flutter/widgets/filter_facility.dart';
import 'package:moddormy_flutter/widgets/rate_in_filter.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:moddormy_flutter/widgets/review/headline_filter.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({Key? key}) : super(key: key);

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();
  final FilterTextEditingController controller = FilterTextEditingController();
  List<String> facilities = [];

  // String rating = '';
  bool rate = false;
  bool isSelect = false;
  FilterItem filterItem = FilterItem(
      minPrice: 0, maxPrice: 0, distant: 0, overallRating: "0", facilities: []);

  void selectRate(String select) {
    setState(() {
      rate = !rate;
      filterItem.overallRating = select;
    });
  }

  void selectFaci(String selectItem) {
    if (filterItem.facilities.contains(selectItem)) {
      filterItem.facilities.remove(selectItem);
    } else {
      filterItem.facilities.add(selectItem);
    }
    setState(() {
      isSelect = !isSelect;
    });
  }

  bool getFacilitySelection(String selectItem) {
    return filterItem.facilities.contains(selectItem);
  }

  bool getRateSelection(int index) {
    String actualNumber = filterItem.overallRating.replaceAll("≥", "");
    try {
      int parsedNumber = int.parse(actualNumber);
      return parsedNumber == index;
    } catch (e) {
      print("Error parsing integer: $e");
      return false;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // price
                headlineFilter("Price"),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller.minPriceController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Enter only number';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: const Color(0xFFDC6E46),
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDC6E46)),
                        ),
                        hintText: "Min price",
                      ),
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    // อย่าลืม validate ให้ max มีค่า >=min
                    Expanded(
                        child: TextFormField(
                      controller: controller.maxPriceController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Enter only number';
                        } else if (int.parse(value) <
                            int.parse(controller.minPriceController.text)) {
                          return 'Max price > min price';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: const Color(0xFFDC6E46),
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDC6E46)),
                        ),
                        hintText: "Max price",
                      ),
                    ))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headlineFilter("Distant From KMUTT"),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.distantController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                            return 'Enter only number';
                          } else {
                            return null;
                          }
                        },
                        cursorColor: const Color(0xFFDC6E46),
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFDC6E46)),
                          ),
                          hintText: "Distant away from KMUTT",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Km.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // rate
                headlineFilter("Overall Rate"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      5,
                      (index) => GestureDetector(
                            onTap: () {
                              selectRate(
                                  (5 - index) == 5 ? "5" : "≥${5 - index}");
                            },
                            child: rateFilter(
                                getRateSelection(5 - index), 5 - index),
                          )),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // facilities
                headlineFilter("Facilities"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectFaci("Parking");
                      },
                      child:
                          filterFacility(getFacilitySelection("Parking"), "Parking", Icons.car_crash),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectFaci("Wifi");
                      },
                      child: filterFacility(getFacilitySelection("Wifi"), "Wifi", Icons.wifi),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectFaci("Smoke-free");
                      },
                      child: filterFacility(
                          getFacilitySelection("Smoke-free"), "Smoke-free", Icons.smoke_free),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectFaci("Security guard");
                      },
                      child: filterFacility(
                          getFacilitySelection("Security guard"), "Security guard", Icons.security),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectFaci("Pet friendly");
                      },
                      child:
                          filterFacility(getFacilitySelection("Pet friendly"), "Pet friendly", Icons.pets),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectFaci("Air conditioner");
                      },
                      child: filterFacility(
                          getFacilitySelection("Air conditioner"), "Air conditioner", Icons.air_outlined),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectFaci("Fan");
                      },
                      child: filterFacility(getFacilitySelection("Fan"), "Fan", FontAwesome5.fan),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // print(filterItem.overallRating);
                  Navigator.pop(context);
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                decoration: BoxDecoration(
                    color: const Color(0xFFDC6E46),
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  "Apply",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
