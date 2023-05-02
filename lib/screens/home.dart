import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/widgets/dormInfo_home.dart';
import '../widgets/MyAppbar.dart';
import '../widgets/MyDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final dio = Dio();
  List<dynamic> dormName = [];
  final List<String> _data = [];
  bool isFav = false;

  void updateIsFav(){
    setState(() {
      isFav = !isFav;
    });
  }

  void getAllDorm() async {
    try {
      final response =
          await dio.get('http://localhost:8000/api/manage-dorm/getAllDorm');
      if (response.statusCode == 200) {
        dormName = response.data["data"];
        for (var map in dormName) {
          _data.add(map["DormName"]);
        }
        // print(_data);
      } else {
        print('Request failed with status code: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    }
  }

  // ดึงชื่อหอมาจาก db มาใส่ตรงนี้
  List<String> _filteredData = [];
  bool _isLoading = false;
  int rate = 4;

  @override
  void initState() {
    super.initState();
    _filteredData = _data;
    _searchController.addListener(_performSearch);
    getAllDorm();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    //Simulates waiting for an API call
    await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      _filteredData = _data
          .where((element) => element
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      endDrawer: const MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
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
                            controller: _searchController,
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
            ),
            const SizedBox(
              height: 20,
            ),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Color(0xFFDC6E46)),
                  )
                : Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: (8 / 10),
                      children: List.generate(_filteredData.length, (index) {
                        return Container(
                          child: dormInfoHome(rate, _filteredData[index], 5000,
                              6500, 'assets/images/dorm.jpg',isFav,updateIsFav),
                        );
                      }),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
