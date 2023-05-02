import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm_item.dart';
import 'package:moddormy_flutter/models/dorm_list.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
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
  List<DormItem> _filteredData = [];
  List<DormItem> _data=[];
  bool isFav = false;

  void updateIsFav(){
    setState(() {
      isFav = !isFav;
    });
  }

  void getAllDorm() async {
    try {
      final response = await Caller.dio.get('/api/manage-dorm/getAllDorm');
      DormList d = DormList.fromJson(response.data);
      _data = d.data;
      setState(() {
        _filteredData = _data;
      });
    } catch (e) {
      print(e);
    }
  }


  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
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
            .where((element) => element.dormName
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
                          child: dormInfoHome(_filteredData[index].rating, _filteredData[index].dormName, _filteredData[index].minPrice,
                             _filteredData[index].maxPrice, _filteredData[index].coverImage,isFav,updateIsFav),
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
