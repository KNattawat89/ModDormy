import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:moddormy_flutter/widgets/post_dorm/room_cover_image.dart';
import 'package:moddormy_flutter/widgets/post_dorm/room_image.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_feature_row.dart';

import '../../models/room.dart';

class RoomItem extends StatefulWidget {
  final Room room;
  final bool post;

  const RoomItem({Key? key, required this.room, required this.post})
      : super(key: key);

  @override
  State<RoomItem> createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.room.name;
    priceController.text = widget.room.price.toString();
    sizeController.text = widget.room.size;
    descriptionController.text = widget.room.description;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 135,
                  child: Row(
                    children: const [
                      Text(
                        'Room name',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        onChanged: (value) {
                          widget.room.name = nameController.text;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF2A8089), width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))),
                            hintText: 'Room name',
                            labelText: 'Room name*',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 85, 85, 85))),
                        validator: (value) {
                          if (value == null || value.isEmpty || value == '') {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 135,
                  child: Row(
                    children: const [
                      Icon(LineIcons.wallet),
                      Text(
                        ' Price',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.red),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: priceController,
                        onChanged: (value) {
                          widget.room.price = int.parse(priceController.text);
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF2A8089), width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))),
                            hintText: 'Price',
                            labelText: 'Price*',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 85, 85, 85))),
                        validator: (value) {
                          if (value == null || value.isEmpty || value == '') {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 135,
                  child: Row(
                    children: const [
                      Icon(LineIcons.alternateExpandArrows),
                      Text(
                        ' Room size',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.red),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: sizeController,
                        onChanged: (value) {
                          widget.room.size = sizeController.text;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF2A8089), width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))),
                            hintText: 'Room size',
                            labelText: "Room size*",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 85, 85, 85))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: Row(
                  children: const [
                    Text(
                      'Room description',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '*',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              TextFormField(
                maxLines: 10,
                minLines: 7,
                controller: descriptionController,
                onChanged: (value) {
                  widget.room.description = descriptionController.text;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF2A8089), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12.5)))),
                validator: (value) {
                  if (value == null || value.isEmpty || value == '') {
                    return 'required';
                  }
                  return null;
                },
              ),
            ],
          ),
          RCoverImageSection(
            room: widget.room,
            post: widget.post,
          ),
          RPhotosSection(
            room: widget.room,
            post: widget.post,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Features',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
                Column(
                  children: [
                    FeatureRow(
                        iconName: "Air conditioner",
                        featureName: "Air-conditioner",
                        value: widget.room.feature.airConditioner,
                        onChanged: (value) => setState(
                              () => widget.room.feature.airConditioner = value,
                            )),
                    FeatureRow(
                        iconName: "Fan",
                        featureName: "Fan",
                        value: widget.room.feature.fan,
                        onChanged: (value) => setState(
                              () => widget.room.feature.fan = value,
                            )),
                    FeatureRow(
                        iconName: "Furnished",
                        featureName: "Furnished",
                        value: widget.room.feature.furnished,
                        onChanged: (value) => setState(
                              () => widget.room.feature.furnished = value,
                            )),
                    FeatureRow(
                        iconName: "Water heater",
                        featureName: "Water Heater",
                        value: widget.room.feature.waterHeater,
                        onChanged: (value) => setState(
                              () => widget.room.feature.waterHeater = value,
                            )),
                    FeatureRow(
                        iconName: "TV",
                        featureName: "TV",
                        value: widget.room.feature.tv,
                        onChanged: (value) => setState(
                              () => widget.room.feature.tv = value,
                            )),
                    FeatureRow(
                        iconName: "Refrigerator",
                        featureName: "Refrigerator",
                        value: widget.room.feature.refrigerator,
                        onChanged: (value) => setState(
                              () => widget.room.feature.refrigerator = value,
                            )),
                    FeatureRow(
                        iconName: "Bathroom",
                        featureName: "Bathroom",
                        value: widget.room.feature.bathroom,
                        onChanged: (value) => setState(
                              () => widget.room.feature.bathroom = value,
                            )),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 3,
          ),
        ],
      ),
    ));
  }
}
