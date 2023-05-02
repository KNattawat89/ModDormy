import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/filter_facility.dart';
import 'package:moddormy_flutter/widgets/rate_in_filter.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({Key? key}) : super(key: key);

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool rate = false;
  bool isSelect = false;

  void selectRate() {
    setState(() {
      rate = !rate;
    });
  }
  void selectFaci(){
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
          CheckboxListTile(
            activeColor: Color(0xFFDC6E46),
            contentPadding: EdgeInsets.zero,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.monetization_on,
                    color: Colors.black87,
                  ),
                ),
                Text('Price')
              ],
            ),
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading, // label position
          ),
          CheckboxListTile(
            activeColor: const Color(0xFFDC6E46),
            contentPadding: EdgeInsets.zero,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.monetization_on,
                    color: Colors.black87,
                  ),
                ),
                Text('Price')
              ],
            ),
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading, // label position
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Rate",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            children:  [
              Text(
                "Facilities",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    child: filterFacility(isSelect, "Smoke-free", Icons.smoke_free),
                  ),

                ],

              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: selectFaci,
                    child: filterFacility(isSelect, "Security guard", Icons.security),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: selectFaci,
                    child: filterFacility(isSelect, "Pet friendly", Icons.pets),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: selectFaci,
                    child: filterFacility(isSelect, "Air conditioner", Icons.air_outlined),
                  ),
                  SizedBox(width: 10,),
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
