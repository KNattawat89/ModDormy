import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moddormy_flutter/provider/user_provider.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
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
        print(e.message);
      }

      // setState(() {
      //   user.setProfileImage(file);
      // });
    }

    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text('Profile Image : ',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[500]),
                  onPressed: () {
                    getImage();
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
            user.profileImage == ""
                ? Image.asset('assets/images/profileNull.png')
                : Image.network(
                    "http://moddormy.ivelse.com:8000${user.profileImage}"),
          ],
        ));
  }
}
