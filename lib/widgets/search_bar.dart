import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/fav_preload.dart';
import 'package:moddormy_flutter/widgets/filter_form.dart';

import '../models/filter_item.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.filterItem}) : super(key: key);
  final FilterItem filterItem;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // search bar
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Color(0xFFE2E2E2),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.search,
                  color: Color(0xFFDC6E46),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      widget.filterItem.search = value;
                      if (FavPreload.homeReload != null) {
                        FavPreload.homeReload!();
                      }
                      // widget.refreshState();
                    },
                    style: const TextStyle(fontSize: 14),
                    cursorColor: Colors.black87,
                    decoration: const InputDecoration(
                      hintText: "search dorm",
                      hintStyle: TextStyle(fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        // filter icon
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFFE2E2E2),
          child: IconButton(
            onPressed: () {
              // does not dev with filter yet
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return FractionallySizedBox(
                    heightFactor: 0.8,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Filter",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.cancel,
                                color: Colors.black87,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        FilterForm(
                          filterItem: widget.filterItem,
                        ),
                      ]),
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: Color(0xFFDC6E46),
            ),
          ),
        )
      ],
    );
  }
}
