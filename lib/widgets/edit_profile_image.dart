// ignore_for_file: unnecessary_null_comparison, await_only_futures

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/provider/user_provider.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

class EditProfileImage extends StatefulWidget {
  //UserProvider user = Provider.of<UserProvider>(context as BuildContext);
  const EditProfileImage({Key? key}) : super(key: key);

  @override
  State<EditProfileImage> createState() => _EditProfileImageState();
}

class _EditProfileImageState extends State<EditProfileImage> {
  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context);
    void getImage() async {
      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
      print("file: $file");
      if (file == null) {
        // User did not select an image
        return;
      }
      final bytes = await file.readAsBytes();
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromBytes(bytes, filename: 'image.jpg')
      });

      try {
        final profileimage =
            await Caller.dio.post("/api/upload/coverImage", data: formData);
        print('response: ${profileimage.data}');
      } on DioError catch (e) {
        print('error: ${e.message}');
      }

      // setState(() {
      //   user.setProfileImage(file);
      // });
    }

    return Scaffold(
        endDrawer: const MyDrawer(),
        appBar: const MyAppbar(),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Profile Image : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 23)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[500],
                        maximumSize: Size.fromRadius(70),
                      ),
                      onPressed: () async {
                        //getImage();
                        XFile? file = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        final Response = await Caller.dio
                            .post("/api/upload/coverImage", data: file);
                        user.setProfileImage(file.toString());
                        print(user.profileImage);
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.add),
                          Text('Profile Image'),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    width: 230,
                    height: 230,
                    child: user.profileImage == "" || user.profileImage == null
                        ? Image.asset('assets/images/profileNull.png')
                        : Image.network(
                            "http://moddormy.ivelse.com:8000${user.profileImage}"),
                  ),
                ),
              ],
            )));
  }
}
