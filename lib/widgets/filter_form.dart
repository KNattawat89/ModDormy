import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/CustomTextFormField.dart';
import 'package:moddormy_flutter/widgets/filter_facility.dart';
import 'package:moddormy_flutter/widgets/rate_in_filter.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:moddormy_flutter/widgets/review/headline_filter.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({Key? key}) : super(key: key);

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();
  bool rate = false;
  bool isSelect = false;

  void selectRate() {
    setState(() {
      rate = !rate;
    });
  }

  void selectFaci() {
    setState(() {
      isSelect = !isSelect;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                  Expanded(child: customTextFormFieldMinMaxPrice("Min price")),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(child: customTextFormFieldMinMaxPrice("Max price"))
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
                  Expanded(child: TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty || !RegExp(r'^[0-9][.]?[0-9]$').hasMatch(value)){
                        return 'Enter only number';
                      }else {
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
                  ),),
                  const SizedBox(width: 20,),
                  const Text("Km.",style: TextStyle(fontSize: 16),),
                  const SizedBox(width: 30,),
                ],
              )
            ],
          ),
          const SizedBox(height: 10,),
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
                          onTap: selectRate,
                          child: rateFilter(rate, 5 - index),
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
                    onTap: selectFaci,
                    child: filterFacility(isSelect, "Parking", Icons.car_crash),
                  ),
                  GestureDetector(
                    onTap: selectFaci,
                    child: filterFacility(isSelect, "Wifi", Icons.wifi),
                  ),
                  GestureDetector(
                    onTap: selectFaci,
                    child: filterFacility(
                        isSelect, "Smoke-free", Icons.smoke_free),
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
                    onTap: selectFaci,
                    child: filterFacility(
                        isSelect, "Security guard", Icons.security),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: selectFaci,
                    child: filterFacility(isSelect, "Pet friendly", Icons.pets),
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
                    onTap: selectFaci,
                    child: filterFacility(
                        isSelect, "Air conditioner", Icons.air_outlined),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: selectFaci,
                    child: filterFacility(isSelect, "Fan", FontAwesome5.fan),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
