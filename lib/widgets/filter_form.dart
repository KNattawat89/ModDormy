import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:moddormy_flutter/models/fav_preload.dart';
import 'package:moddormy_flutter/models/filter_controller.dart';
import 'package:moddormy_flutter/models/filter_item.dart';
import 'package:moddormy_flutter/widgets/filter_facility.dart';
import 'package:moddormy_flutter/widgets/rate_in_filter.dart';
import 'package:moddormy_flutter/widgets/review/headline_filter.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({Key? key, required this.filterItem}) : super(key: key);

  final FilterItem filterItem;
  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();
  final FilterTextEditingController controller = FilterTextEditingController();
  List<String> facilities = [];
  bool _isLoading = false;
  bool isSelect = false;
  FilterItem filterItem = FilterItem(
      minPrice: 0,
      maxPrice: 0,
      distant: 0,
      overallRating: '',
      facilities: [],
      search: '');

  void selectRate(String select) {
    if (filterItem.overallRating == select) {
      setState(() {
        filterItem.overallRating = '';
      });
    } else {
      setState(() {
        filterItem.overallRating = select;
      });
    }
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

  void loadFilterOption() {
    setState(() {
      _isLoading = true;
    });
  }

  void getFilterOption() {
    setState(() {
      _isLoading = false;
    });
  }

  bool getRateSelection(int index) {
    String actualNumber = filterItem.overallRating.replaceAll("≥", "");
    try {
      int parsedNumber = int.parse(actualNumber);
      return parsedNumber == index;
    } catch (e) {
      // print("Error parsing integer: $e");
      return false;
    }
  }

  void applyFilters(FilterItem data) {
    setState(() {
      widget.filterItem.search = filterItem.search;
      widget.filterItem.overallRating = filterItem.overallRating;
      widget.filterItem.facilities = filterItem.facilities;
      widget.filterItem.distant = filterItem.distant;
      widget.filterItem.maxPrice = filterItem.maxPrice;
      widget.filterItem.minPrice = filterItem.minPrice;
    });
    // widget.refreshState();
    if (FavPreload.homeReload != null) {
      FavPreload.homeReload!();
    }
    Navigator.pop(context);
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => const HomePage(),
    //   ),
    // );
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
                      if (value == null || value.isEmpty) {
                        return null;
                      } else {
                        if (!RegExp(r'^\d+$').hasMatch(value)) {
                          return "Enter only number";
                        } else {
                          return null;
                        }
                      }
                    },
                    cursorColor: const Color(0xFF2A8089),
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2A8089)),
                      ),
                      hintText: "Min price",
                    ),
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: controller.maxPriceController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      } else {
                        if (int.parse(value) <
                            int.parse(controller.minPriceController.text)) {
                          return 'Max price >= min price';
                        } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                          return 'Enter only number';
                        }
                      }
                      return null;
                    },
                    cursorColor: const Color(0xFF2A8089),
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2A8089)),
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
                            !RegExp(r'^(\d+(\.\d+)?)?$').hasMatch(value)) {
                          return 'Enter only number';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: const Color(0xFF2A8089),
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2A8089)),
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
                      selectRate((5 - index) == 5 ? "5" : "≥${5 - index}");
                    },
                    child: rateFilter(getRateSelection(5 - index), 5 - index),
                  ),
                ),
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
                    child: filterFacility(getFacilitySelection("Parking"),
                        "Parking", LineIcons.car),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectFaci("Wifi");
                    },
                    child: filterFacility(
                        getFacilitySelection("Wifi"), "Wifi", LineIcons.wifi),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectFaci("Smoke-free");
                    },
                    child: filterFacility(getFacilitySelection("Smoke-free"),
                        "Smoke-free", LineIcons.smokingBan),
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
                        getFacilitySelection("Security guard"),
                        "Security guard",
                        LineIcons.userShield),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      selectFaci("Pet friendly");
                    },
                    child: filterFacility(getFacilitySelection("Pet friendly"),
                        "Pet friendly", Icons.pets_outlined),
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
                        getFacilitySelection("Air conditioner"),
                        "Air conditioner",
                        Icons.ac_unit),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      selectFaci("Fan");
                    },
                    child: filterFacility(
                        getFacilitySelection("Fan"), "Fan", LineIcons.fan),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                loadFilterOption();
                filterItem = FilterItem(
                    minPrice: controller.minPriceController.text.isNotEmpty
                        ? int.parse(controller.minPriceController.text)
                        : 0,
                    maxPrice: controller.maxPriceController.text.isNotEmpty
                        ? int.parse(controller.maxPriceController.text)
                        : 0,
                    distant: controller.distantController.text.isNotEmpty
                        ? double.parse(controller.distantController.text)
                        : 0,
                    overallRating: filterItem.overallRating == ''
                        ? '0'
                        : filterItem.overallRating,
                    facilities: filterItem.facilities,
                    search: '');
                // print('min price ${filterItem.minPrice}');
                // print('max price ${filterItem.maxPrice}');
                // print('distant ${filterItem.distant}');
                // print('rate [${filterItem.overallRating}], []');
                // print('facilities ${filterItem.facilities}');
                await Future.delayed(const Duration(milliseconds: 1000));
                getFilterOption();
                applyFilters(filterItem);
                // widget.refreshData();
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
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
          ),
          const SizedBox(
            height: 20,
          ),
          _isLoading
              ? const CircularProgressIndicator(
                  color: Color(0xFFDC6E46),
                  strokeWidth: 2,
                )
              : const Text("")
        ],
      ),
    );
  }
}
