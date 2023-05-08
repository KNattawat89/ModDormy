import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/post_dorm/room_cover_image.dart';
import 'package:moddormy_flutter/widgets/post_dorm/room_image.dart';
import 'package:moddormy_flutter/widgets/post_dorm/section_feature_row.dart';

import '../../models/room.dart';

class RoomItem extends StatefulWidget {
  final Room room;
  final bool post;

  const RoomItem({Key? key, required this.room, required this.post}) : super(key: key);

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
              const SizedBox(
                  width: 110,
                  child: Text(
                    'Room name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
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
                            border: OutlineInputBorder(),
                            hintText: 'Room name'),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                  width: 110,
                  child: Text(
                    'Price',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
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
                            border: OutlineInputBorder(), hintText: 'Price'),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                  width: 110,
                  child: Text(
                    'Room size',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
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
                            border: OutlineInputBorder(),
                            hintText: 'Room size'),
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
              const Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 16),
                child: Text(
                  'Room description',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
              ),
              TextFormField(
                maxLines: 10,
                minLines: 7,
                controller: descriptionController,
                onChanged: (value) {
                  widget.room.description = descriptionController.text;
                },
                decoration: const InputDecoration(border: OutlineInputBorder()),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'required';
                //   }
                //   return null;
                // },
              ),
            ],
          ),
          RCoverImageSection(room: widget.room),
          RPhotosSection(room: widget.room),
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
                        featureName: "Air-conditioner",
                        value: widget.room.feature.airConditioner,
                        onChanged: (value) => setState(
                              () => widget.room.feature.airConditioner = value,
                            )),
                    FeatureRow(
                        featureName: "Fan",
                        value: widget.room.feature.fan,
                        onChanged: (value) => setState(
                              () => widget.room.feature.fan = value,
                            )),
                    FeatureRow(
                        featureName: "Furnished",
                        value: widget.room.feature.furnished,
                        onChanged: (value) => setState(
                              () => widget.room.feature.furnished = value,
                            )),
                    FeatureRow(
                        featureName: "Water Heater",
                        value: widget.room.feature.waterHeater,
                        onChanged: (value) => setState(
                              () => widget.room.feature.waterHeater = value,
                            )),
                    FeatureRow(
                        featureName: "TV",
                        value: widget.room.feature.tv,
                        onChanged: (value) => setState(
                              () => widget.room.feature.tv = value,
                            )),
                    FeatureRow(
                        featureName: "Refrigerator",
                        value: widget.room.feature.refrigerator,
                        onChanged: (value) => setState(
                              () => widget.room.feature.refrigerator = value,
                            )),
                    FeatureRow(
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 7,
            ),
          ),
        ],
      ),
    ));
  }
}
