import 'package:flutter/material.dart';

Row searchBar(TextEditingController searchController) {
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
                  controller: searchController,
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
            print("hi");
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
