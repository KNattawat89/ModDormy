// ignore_for_file: unnecessary_null_comparison, prefer_final_fields, non_constant_identifier_names, library_private_types_in_public_api

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/models/profile_reload.dart';
import 'package:moddormy_flutter/screens/profile.dart';
import 'package:moddormy_flutter/utilities/caller.dart';

import 'package:provider/provider.dart';

import '../models/upload_cover_image.dart';
import '../provider/user_provider.dart';
import 'my_appbar.dart';
import 'my_drawer.dart';

class EditUserForm extends StatefulWidget {
  const EditUserForm({Key? key}) : super(key: key);

  @override
  _EditUserFormState createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {
  final _formkey = GlobalKey<FormState>();
  bool newImage = false;
  TextEditingController _UnameController = TextEditingController();
  TextEditingController _FnameController = TextEditingController();
  TextEditingController _LnameController = TextEditingController();
  TextEditingController _TelController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _LineIDController = TextEditingController();

  Future<void> editData(String userId) async {
    final user = Provider.of<UserProvider>(context, listen: false);
    user.setProfileImage(user.image);
    try {
      // print('head');
      await Caller.dio.put(
        '/api/profile/editUser?userId=$userId',
        data: {
          "profile_image": user.profileImage,
          "username": _UnameController.text,
          "fname": _FnameController.text,
          "lname": _LnameController.text,
          "email": _EmailController.text,
          "tel": _TelController.text,
          "line_id": _LineIDController.text,
          "user_type": user.userType,
        },
      );
      user.updatedUser(
          _UnameController.text,
          _FnameController.text,
          _LnameController.text,
          _EmailController.text,
          _TelController.text,
          _LineIDController.text);
      ProfilePreload.profileReload!();
      // print('tail');
    } catch (e) {
      debugPrint('error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProvider>(context, listen: false);
    _UnameController.text = user.username;
    _FnameController.text = user.firstname;
    _LnameController.text = user.lastname;
    _TelController.text = user.tel;
    _EmailController.text = user.email;
    _LineIDController.text = user.lineId;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void uploadNewImage() async {
    final user = Provider.of<UserProvider>(context, listen: false);
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      // User did not select an image
      return;
    }
    final bytes = await file.readAsBytes();
    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(
        bytes,
        filename: 'image.jpg',
        // contentType: MediaType.parse('image/jpeg'),
      )
    });

    try {
      final profileimage = await Caller.dio.post(
        "/api/upload/coverImage",
        data: formData,
        options: Options(
          contentType: 'multipart/form-data', // Specify the content type here
        ),
      );
      UploadCoverImage d = UploadCoverImage.fromJson(profileimage.data);
      setState(() {
        user.setPreviewImage(d.image);
        newImage = true;
      });
      debugPrint(user.image);
    } on DioError catch (e) {
      debugPrint('error: ${e.message}');
    }

    // setState(() {
    //   user.setProfileImage(file);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar: const MyAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(children: [
            // Other widgets here
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                Stack(children: [
                  newImage
                      ? CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                              "http://moddormy.ivelse.com:8000${user.image}"),
                        )
                      : user.profileImage == "" || user.profileImage == null
                          ? const CircleAvatar(
                              radius: 80,
                              backgroundImage:
                                  AssetImage('assets/images/profileNull.png'),
                            )
                          : CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(
                                  "http://moddormy.ivelse.com:8000${user.profileImage}"),
                            ),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: GestureDetector(
                      onTap: () {
                        uploadNewImage();
                      },
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFFDC6E46),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(6, 5, 5, 5),
                            child: Image.asset(
                              'assets/images/edit.png',
                              scale: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ]),
            ]),

            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Edit Profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Form(
              key: _formkey,
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 10.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(128, 38, 38, 38)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          DefaultSelectionStyle.defaultColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2A8089)),
                                ),
                              ),
                              controller: _UnameController,
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              //focusNode: focusNode1,
                              //onTap: _requestFocus,
                              decoration: const InputDecoration(
                                labelText: 'First Name',
                                // floatingLabelStyle: TextStyle(
                                //   color: focusNode1.hasFocus
                                //       ? Colors.red
                                //       : Colors.black,
                                // ),
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(128, 38, 38, 38)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          DefaultSelectionStyle.defaultColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2A8089)),
                                ),
                              ),
                              controller: _FnameController,
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: _LnameController,
                              //focusNode: focusNode,
                              //initialValue: _FnameController.text,
                              decoration: const InputDecoration(
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(128, 38, 38, 38)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          DefaultSelectionStyle.defaultColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2A8089)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            TextField(
                              controller: _TelController,
                              decoration: const InputDecoration(
                                labelText: 'Tel.',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(128, 38, 38, 38)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          DefaultSelectionStyle.defaultColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2A8089)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            TextField(
                              controller: _EmailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(128, 38, 38, 38)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          DefaultSelectionStyle.defaultColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2A8089)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            TextField(
                              controller: _LineIDController,
                              decoration: const InputDecoration(
                                labelText: 'LineID',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(128, 38, 38, 38)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          DefaultSelectionStyle.defaultColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2A8089)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                    backgroundColor: Colors.grey,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    label: const Text('Cancel')),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 1, vertical: 1),
                //       minimumSize: const Size(100, 40),
                //       backgroundColor: Colors.grey),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const ProfilePage(),
                //       ),
                //     );
                //   },
                //   child: const Text(
                //     'Cancel',
                //     style: TextStyle(fontSize: 18),
                //   ),
                // ),
                // SizedBox(
                //   width: 30,
                // ),
                const Padding(padding: EdgeInsets.fromLTRB(28, 0, 30, 0)),
                FloatingActionButton.extended(
                    backgroundColor: const Color.fromARGB(237, 215, 106, 56),
                    onPressed: () async {
                      await editData(user.userId);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    label: const Text('Save')),
                // ElevatedButton(
                //   onPressed: () async {
                //     await editData(user.userId);
                //     // ignore: use_build_context_synchronously
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const ProfilePage(),
                //       ),
                //     );
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color.fromARGB(
                //         237, 215, 106, 56), // set background color
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                //     minimumSize: const Size(100, 40),
                //   ),
                //   child: const Text(
                //     'Save',
                //     style: TextStyle(fontSize: 18),
                //   ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
