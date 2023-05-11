import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm_item.dart';
import 'package:moddormy_flutter/models/dorm_list.dart';
import 'package:moddormy_flutter/models/fav_preload.dart';
import 'package:moddormy_flutter/models/filter_item.dart';
import 'package:moddormy_flutter/models/user_item.dart';
import 'package:moddormy_flutter/screens/favorite.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:moddormy_flutter/widgets/dorm_info_home.dart';
import 'package:moddormy_flutter/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import '../models/user_list.dart';
import '../provider/user_provider.dart';
import '../widgets/filter_option.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dorm_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FilterItem argument = FilterItem(
      minPrice: 0,
      maxPrice: 0,
      distant: 0,
      overallRating: '0',
      facilities: [],
      search: '');
  String search = '';
  User? user = FirebaseAuth.instance.currentUser;
  final dio = Dio();
  List<UserItem> _userData = [];
  List<DormItem> favDorm = [];

  // final TextEditingController _searchController = TextEditingController();
  // FilterItem argument = FilterItem(
  //     minPrice: 0, maxPrice: 0, distant: 0, overallRating: '0', facilities: [], search: '');
  // List<DormItem> _data = [];
  // bool _isLoading = false;

  // void getAllDorm() async {
  // print('min: ${argument.minPrice}');
  // print('max: ${argument.maxPrice}');
  // print("distant: ${argument.distant}");
  // print("rate: ${argument.overallRating}");
  // print('facilities: ${argument.facilities}');
  // print("hello from getAllDorm");
  //   try {
  //     final response = await Caller.dio.get('/api/home/getAllDorm');
  //     DormList d = DormList.fromJson(response.data);
  //     _data = d.data;
  //     setState(() {
  //       _filteredData = _data;
  //     });
  //     // print(_filteredData);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  // void getDormAll(String uid) async {
  //   try {
  //     final response = await Caller.dio.get('/api/home/getDormAll?userId=$uid');
  //
  //     DormList d = DormList.fromJson(response.data);
  //     _data = d.data;
  //     setState(() {
  //       _filteredData = _data;
  //     });
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  void getUserProfile(String uid) async {
    try {
      final response =
          await Caller.dio.get('/api/profile/getProfile?userId=$uid');
      UserList u = UserList.fromJson(response.data);
      _userData = u.data;
      Provider.of<UserProvider>(context, listen: false).setUser(
          _userData[0].userId,
          _userData[0].profileImage ?? '',
          _userData[0].username,
          _userData[0].firstname,
          _userData[0].lastname,
          _userData[0].email,
          _userData[0].telephone ?? '',
          _userData[0].lineId ?? '',
          _userData[0].userType);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<DormItem>> refreshData() async {
    User? user = FirebaseAuth.instance.currentUser;
    // setState(() {
    //   _isLoading = true;
    // });
    // try {
    if (user != null && user.uid.isNotEmpty) {
      final response =
          await Caller.dio.post('/api/home/postFilteredDorm', data: {
        "userId": user.uid,
        "min_price": argument.minPrice,
        "max_price": argument.maxPrice,
        "distant": argument.distant,
        "rate": argument.overallRating,
        "facilities": argument.facilities
      });

      DormList d = DormList.fromJson(response.data);
      return d.data;
    } else {
      final response =
          await Caller.dio.post('/api/home/postFilteredNoFav', data: {
        "min_price": argument.minPrice,
        "max_price": argument.maxPrice,
        "distant": argument.distant,
        "rate": argument.overallRating,
        "facilities": argument.facilities
      }); // change to post and put data
      // print(response.requestOptions.data);
      DormList d = DormList.fromJson(response.data);
      return d.data;
    }
    // เอา try catch ออกเพราะใน FutureBuilder มีตัวจัดการ error อยู่แล้ว
    // ถ้าใส่ try catch มันจะจัดการ error ให้เสร็จก่อนจะไปถึง FutureBuilder
    // } catch (e) {
    //   debugPrint(e.toString());
    //   return [];
    // }
  }

  // bool isArgumentDefault() {
  //   return argument.minPrice == 0 &&
  //       argument.maxPrice == 0 &&
  //       argument.distant == 0.0 &&
  //       argument.overallRating == '' &&
  //       argument.facilities.isEmpty;
  // }

  void removeOption(String propertyName, [String? facilityName]) {
    switch (propertyName) {
      case 'minPrice':
        setState(() {
          argument.minPrice = 0;
        });

        break;
      case 'maxPrice':
        setState(() {
          argument.maxPrice = 0;
        });

        break;
      case 'distant':
        setState(() {
          argument.distant = 0.0;
        });

        break;
      case 'overallRating':
        setState(() {
          argument.overallRating = '0';
        });

        break;
      case 'facilities':
        if (argument.facilities.isNotEmpty && facilityName != null) {
          setState(() {
            argument.facilities.remove(facilityName);
          });
        }
        break;
      default:
        throw ArgumentError("Invalid property name: $propertyName");
    }
    // if (isargumentDefault()) {
    //   if (user != null) {
    //     getDormAll(user!.uid);
    //   } else {
    //     getAllDorm();
    //   }
    //   return;
    // }
  }

  @override
  void initState() {
    super.initState();
    // _searchController.addListener(_performSearch);
    if (user != null) {
      getUserProfile(user!.uid);
      getFavDorm(user!.uid);
      // getDormAll(user!.uid);
    }

    FavPreload.homeReload = refreshState;
    // else {
    //   getAllDorm();
    // }
    // if (argument != null) {
    //   argument = argument!;
    // }
    // refreshData();
  }

  void getFavDorm(String uid) async {
    print("hello");
    try {
      final response = await Caller.dio.get('/api/fav/getFav?userId=$uid');
      DormList d = DormList.fromJson(response.data);
      favDorm = d.data;
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // _searchController.dispose();
    super.dispose();
  }

  List<DormItem> _performSearch(List<DormItem> dormList) {
    List<DormItem> filteredData = dormList
        .where((element) => element.dormName
            .toLowerCase()
            .contains(argument.search.toLowerCase()))
        .toList();
    return filteredData;
  }

  void refreshState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MyAppbar(),
      endDrawer: const MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              filterItem: argument,
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 10,
              spacing: 10,
              children: [
                // if (argument != null) ...[
                if (argument.minPrice != 0 || argument.maxPrice != 0)
                  filterOption(
                      text: '${argument.minPrice} - ${argument.maxPrice} Baht',
                      field: 'minPrice',
                      removeFilter: removeOption),
                if (argument.distant != 0)
                  filterOption(
                      text: '${argument.distant} from KMUTT',
                      icon: Icons.pin_drop,
                      field: 'distant',
                      removeFilter: removeOption),
                if (argument.overallRating != '' &&
                    argument.overallRating != '0')
                  filterOption(
                      text: argument.overallRating,
                      icon: Icons.star,
                      field: 'overallRating',
                      removeFilter: removeOption),
                ...List.generate(argument.facilities.length, (index) {
                  return filterOption(
                      text: argument.facilities[index],
                      field: 'facilities',
                      removeFilter: removeOption);
                }),
              ],
              // ],
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: refreshData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/no-results1.png',
                                scale: 3,
                              ),
                              const Text(
                                "No Result Found",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                  "We couldn't find what you're looking for."),
                              const Text("Try searching for something else.")
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    List<DormItem> filteredData =
                        snapshot.data as List<DormItem>;
                    filteredData = _performSearch(filteredData);
                    return Expanded(
                        child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 20,
                      childAspectRatio: (8 / 10),
                      children: List.generate(filteredData.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (DormDetail(
                                          dormId: filteredData[index].dormId,
                                          dormItem: filteredData[index],
                                        ))));
                          },
                          child: DormInfoHome(
                            dormItem: filteredData[index],
                          ),
                        );
                      }),
                    ));
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: Color(0xFFDC6E46)),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
