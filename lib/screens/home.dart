import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm_item.dart';
import 'package:moddormy_flutter/models/dorm_list.dart';
import 'package:moddormy_flutter/models/filter_item.dart';
import 'package:moddormy_flutter/models/user_item.dart';
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

class HomePage extends StatefulWidget {
  final FilterItem? argument;

  const HomePage({Key? key, this.argument}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController _searchController = TextEditingController();
  final dio = Dio();
  FilterItem newOption = FilterItem(
      minPrice: 0, maxPrice: 0, distant: 0, overallRating: '0', facilities: []);
  List<DormItem> _filteredData = [];
  List<DormItem> _data = [];
  List<UserItem> _userData = [];

  void getAllDorm() async {
    try {
      final response = await Caller.dio.get('/api/home/getAllDorm');
      DormList d = DormList.fromJson(response.data);
      _data = d.data;
      setState(() {
        _filteredData = _data;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool _isLoading = false;

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
      print(e);
    }
  }

  void getDormAll(String uid) async {
    try {
      final response = await Caller.dio.get('/api/home/getDormAll?userId=$uid');

      DormList d = DormList.fromJson(response.data);
      _data = d.data;
      setState(() {
        _filteredData = _data;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<DormItem>> refreshData() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _isLoading = true;
    });
    if (user!.uid != '') {
      // debugPrint(user!.uid);
      try {
        final response =
            await Caller.dio.post('/api/home/postFilteredDorm', data: {
          "userId": user!.uid,
          "min_price": newOption.minPrice,
          "max_price": newOption.maxPrice,
          "distant": newOption.distant,
          "rate": newOption.overallRating,
          "facilities": newOption.facilities
        });

        DormList d = DormList.fromJson(response.data);
        return d.data;
      } on DioError catch (e) {
        debugPrint(e.toString());
        return [];
      }
    } else {
      try {
        // อย่าลืมเรื่อง user login or not login
        debugPrint("FilteredNoFav");
        final response =
            await Caller.dio.post('/api/home/postFilteredNoFav', data: {
          "min_price": newOption.minPrice,
          "max_price": newOption.maxPrice,
          "distant": newOption.distant,
          "rate": newOption.overallRating,
          "facilities": newOption.facilities
        }); // change to post and put data
        DormList d = DormList.fromJson(response.data);
        return d.data;
      } catch (e) {
        debugPrint(e.toString());
        return [];
      }
    }
  }

  bool isNewOptionDefault() {
    return newOption.minPrice == 0 &&
        newOption.maxPrice == 0 &&
        newOption.distant == 0.0 &&
        newOption.overallRating == '' &&
        newOption.facilities.isEmpty;
  }

  void removeOption(String propertyName, [String? facilityName]) {
    switch (propertyName) {
      case 'minPrice':
        setState(() {
          newOption.minPrice = 0;
          refreshData();
        });

        break;
      case 'maxPrice':
        setState(() {
          newOption.maxPrice = 0;
          refreshData();
        });

        break;
      case 'distant':
        setState(() {
          newOption.distant = 0.0;
          refreshData();
        });

        break;
      case 'overallRating':
        setState(() {
          newOption.overallRating = '';
          refreshData();
        });

        break;
      case 'facilities':
        if (newOption.facilities.isNotEmpty && facilityName != null) {
          setState(() {
            newOption.facilities.remove(facilityName);
            refreshData();
          });
        }
        break;
      default:
        throw ArgumentError("Invalid property name: $propertyName");
    }
    // if (isNewOptionDefault()) {
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
    _searchController.addListener(_performSearch);
    if (user != null) {
      getUserProfile(user!.uid);
      getDormAll(user!.uid);
    } else {
      getAllDorm();
    }
    if (widget.argument != null) {
      newOption = widget.argument!;
    }
    // refreshData();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar(_searchController, context, refreshData),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 10,
              spacing: 10,
              children: [
                if (widget.argument != null) ...[
                  if (widget.argument?.minPrice != 0 ||
                      widget.argument?.maxPrice != 0)
                    filterOption(
                        text:
                            '${widget.argument?.minPrice} - ${widget.argument?.maxPrice} Baht',
                        field: 'minPrice',
                        removeFilter: removeOption),
                  if (widget.argument?.distant != 0)
                    filterOption(
                        text: '${widget.argument?.distant} from KMUTT',
                        icon: Icons.pin_drop,
                        field: 'distant',
                        removeFilter: removeOption),
                  if (widget.argument?.overallRating != '')
                    filterOption(
                        text: widget.argument?.overallRating ?? '',
                        icon: Icons.star,
                        field: 'overallRating',
                        removeFilter: removeOption),
                  ...List.generate(widget.argument?.facilities.length ?? 0,
                      (index) {
                    return filterOption(
                        text: widget.argument?.facilities[index] ?? '',
                        field: 'facilities',
                        removeFilter: removeOption);
                  }),
                ],
              ],
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
                              Image.asset('assets/images/no-results1.png', scale: 3,),
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
                    _filteredData = snapshot.data as List<DormItem>;
                    return Expanded(
                        child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 20,
                      childAspectRatio: (8 / 10),
                      children: List.generate(_filteredData.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context,
                                '/dorms/${_filteredData[index].dormId}');
                          },
                          child: DormInfoHome(
                            dormId: _filteredData[index].dormId,
                            dormName: _filteredData[index].dormName,
                            pathImage: _filteredData[index].coverImage,
                            isFav: _filteredData[index].isFav,
                            minPrice: _filteredData[index].minPrice,
                            maxPrice: _filteredData[index].maxPrice,
                            rating: _filteredData[index].overallRate,
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
