import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm_item.dart';
import 'package:moddormy_flutter/models/dorm_list.dart';
import 'package:moddormy_flutter/models/filter_item.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:moddormy_flutter/widgets/dorm_info_home.dart';
import 'package:moddormy_flutter/widgets/search_bar.dart';
import '../widgets/filter_option.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  final FilterItem? argument;

  const HomePage({Key? key, this.argument}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final dio = Dio();
  late FilterItem newOption = widget.argument ??
      FilterItem(
          minPrice: 0,
          maxPrice: 0,
          distant: 0,
          overallRating: '0',
          facilities: []);
  List<DormItem> _filteredData = [];
  List<DormItem> _data = [];
  bool isFav = false;

  void updateIsFav() {
    setState(() {
      isFav = !isFav;
    });
    // print('min price ${newOption.minPrice}');
    // print('max price ${newOption.maxPrice}');
    // print('distant ${newOption.distant}');
    // print('rate ${newOption.overallRating}');
    // print('facilities ${newOption.facilities}');
  }

  void getAllDorm() async {
    try {
      final response = await Caller.dio.get('/api/home/getAllDorm');
      DormList d = DormList.fromJson(response.data);
      _data = d.data;
      setState(() {
        _filteredData = _data;
      });
    } catch (e) {
      // print(e);
    }
  }

  bool _isLoading = false;

  void getFilterDorm() async {
    setState(() {
      _isLoading = true;
    });
    try {
      // อย่าลืมเรื่อง user login or not login
      final response = await Caller.dio.post('/api/home/getFilter', data: {
        "min_price": newOption.minPrice,
        "max_price": newOption.maxPrice,
        "distant": newOption.distant,
        "rate": newOption.overallRating,
        "facilities": newOption.facilities
      }); // change to post and put data
      DormList d = DormList.fromJson(response.data);
      _data = d.data;
      setState(() {
        _filteredData = _data;
      });
      await Future.delayed(const Duration(milliseconds: 1000));

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void removeOption(String propertyName, [String? facilityName]) {
    switch (propertyName) {
      case 'minPrice':
        setState(() {
          newOption.minPrice = 0;
          getFilterDorm();
        });

        break;
      case 'maxPrice':
        setState(() {
          newOption.maxPrice = 0;
          getFilterDorm();
        });

        break;
      case 'distant':
        setState(() {
          newOption.distant = 0.0;
          getFilterDorm();
        });

        break;
      case 'overallRating':
        setState(() {
          newOption.overallRating = '';
          getFilterDorm();
        });

        break;
      case 'facilities':
        if (newOption.facilities.isNotEmpty && facilityName != null) {
          setState(() {
            newOption.facilities.remove(facilityName);
            getFilterDorm();
          });
        }
        break;
      default:
        throw ArgumentError("Invalid property name: $propertyName");
    }
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar(_searchController, context),
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
                        field: 'price',
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
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Color(0xFFDC6E46)),
                  )
                : Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 20,
                      childAspectRatio: (8 / 10),
                      children: List.generate(_filteredData.length, (index) {
                        return Container(
                          child: dormInfoHome(
                              _filteredData[index].rating,
                              _filteredData[index].dormName,
                              _filteredData[index].minPrice,
                              _filteredData[index].maxPrice,
                              _filteredData[index].coverImage,
                              isFav,
                              updateIsFav),
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
