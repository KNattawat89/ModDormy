// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm.dart';
import 'package:moddormy_flutter/models/profile_dorm.dart';
import 'package:moddormy_flutter/models/profile_dorm_list.dart';
import 'package:moddormy_flutter/provider/user_provider.dart';
import 'package:moddormy_flutter/screens/dorm_detail.dart';
import 'package:moddormy_flutter/screens/edit_dorm.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:provider/provider.dart';

class DormsEachOwner extends StatefulWidget {
  const DormsEachOwner({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DormsEachOwnerState createState() => _DormsEachOwnerState();
}

class _DormsEachOwnerState extends State<DormsEachOwner> {
  List<ProfileDorm> _profileDorms = [];

  Future<void> _fetchDorms(String userId) async {
    final response =
        await Caller.dio.get('/api/profile/getProfileDorm?userId=$userId');
    if (response.statusCode == 200) {
      ProfileDormList data1 = ProfileDormList.fromJson(response.data);
      setState(() {
        _profileDorms = data1.data;
      });
    } else {
      throw Exception('Failed to fetch dorms');
    }
  }

  Future<void> deleteRooms(int dormId) async {
    try {
      final response1 =
          await Caller.dio.delete('/api/manage-room/deleteRoom?dormId=$dormId');
      //print(response1.data.toString());
    } catch (e) {
      //print(e.toString());
    }
  }

  Future<void> deleteDorm(int dormId) async {
    try {
      final response2 =
          await Caller.dio.delete('/api/manage-dorm/deleteDorm?dormId=$dormId');
      //print(response2.data.toString());
    } catch (e) {
      //print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      _fetchDorms(userProvider.userId);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    if (_profileDorms.isEmpty) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "No Dorm Available",
              style: TextStyle(fontSize: 20),
            )
          ],
        )
      ]);
    }
    return Scrollbar(
      thumbVisibility: true, //always show scrollbar
      thickness: 0, //width of scrollbar
      radius: const Radius.circular(20), //corner radius of scrollbar
      scrollbarOrientation: ScrollbarOrientation.right,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _profileDorms.length,
        itemBuilder: (context, index) {
          final dorm = _profileDorms[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DormDetail(
                    dormId: dorm.dormId,
                  ),
                ),
              );
            },
            child: ListTile(
              leading: Image.network(dorm.coverImage.toString()),
              title: Text(dorm.dormName),
              subtitle: Text(dorm.createdAt.toString().substring(0, 10)),
              trailing: AspectRatio(
                aspectRatio: 1.8,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditForm(dormId: dorm.dormId),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(6, 5),
                              backgroundColor: const Color(
                                  0xff858585) // Set minimum button size to 80x30
                              ),
                          child: const Text("edit"),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: const Color(0xffDFDADA),
                                  title: const Center(
                                      child: Text(
                                    'Are you sure?',
                                    style: TextStyle(fontSize: 24),
                                  )),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text(
                                        'You will not be able to',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text('recover this dorm!',
                                          style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(
                                                  0xff858585) // set background color
                                              // padding:
                                              //     const EdgeInsets.symmetric(
                                              //         horizontal: 1,
                                              //         vertical: 1),
                                              // minimumSize:
                                              //     const Size(100, 30),
                                              ),
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(3)),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    237, 215, 106, 56),
                                          ),
                                          child: const Text('Yes, delete it!'),
                                          onPressed: () async {
                                            // Perform API call to delete the dorm
                                            await deleteRooms(dorm.dormId);
                                            await deleteDorm(dorm.dormId);
                                            // Pop the dialog and refresh the dorm list
                                            // ignore: use_build_context_synchronously
                                            Navigator.of(context).pop();
                                            setState(() async {
                                              // reload the dorm list
                                              _profileDorms =
                                                  await _fetchDorms(user.userId)
                                                      as List<ProfileDorm>;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            'assets/images/delete.png',
                            width: 25.0,
                            height: 25.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              contentPadding: const EdgeInsets.all(4),
            ),
          );
        },
      ),
    );
  }
}
