import 'package:flutter/material.dart';

import '../../models/room.dart';

class RoomItem extends StatefulWidget {
  final Room room;

  const RoomItem({Key? key, required this.room}) : super(key: key);

  @override
  State<RoomItem> createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
                width: 100,
                child: Text(
                  'Room name',
                  textAlign: TextAlign.center,
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
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
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
                width: 100,
                child: Text(
                  'Price',
                  textAlign: TextAlign.center,
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: priceController,
                      onChanged: (value) {
                        widget.room.price = priceController.text;
                      },
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
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
                width: 100,
                child: Text(
                  'Room size',
                  textAlign: TextAlign.center,
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
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
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
              padding: EdgeInsets.only(top: 8.0, left: 16),
              child: Text(
                'Room description',
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              //dorm desc
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
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
            ),
          ],
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Cover Image :'),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('how?') //CoverImageUploadButton(),
                ),
          ],
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Images :'),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('how?') //UploadPhotoButton(),
                ),
          ],
        ),
        Column(
          children: [
            const Text(
              'Features',
              textAlign: TextAlign.start,
            ),
            Row(
              children: [
                Checkbox(
                  value: widget.room.airConditioner,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.room.airConditioner = value!;
                    });
                  },
                ),
                const Text('Air Conditioner')
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: widget.room.fan,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.room.fan = value!;
                    });
                  },
                ),
                const Text('Fan')
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
