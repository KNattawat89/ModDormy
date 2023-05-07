// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/edit_profile.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'package:moddormy_flutter/screens/post_form.dart';
// import 'package:moddormy_flutter/widgets/dorms_each_owner.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    if (user.userId != '' && FirebaseAuth.instance.currentUser != null) {
      return Scaffold(
        endDrawer: const MyDrawer(),
        appBar: const MyAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  // when u want to update user profile on db please use this method together
                  // it will update UserProvider as well
                  //-----------------
                  // UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
                  // UserItem userProfile = await UserApiService.getUserProfile(uid, userProvider);
                  // noted: in the getUserProfile method, it has async function already don't have to use async func.
                  //-----------------

                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: user.profileImage != null
                              ? const AssetImage(
                                  'assets/images/profileNull.png') //ใส่เป็นnullไว้ก่อน ยังไม่มีรูป
                              : const AssetImage(
                                  'assets/images/profileNull.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.username,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfilePage(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Image.asset(
                                  'assets/images/edit_black.png',
                                  width: 19,
                                  height: 19,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(22, 8, 8, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Name
                                  if (user.firstname != null &&
                                      user.lastname != null &&
                                      user.firstname != "" &&
                                      user.lastname != "")
                                    Text(
                                      "Name  :   ${user.firstname} ${user.lastname}",
                                      style: const TextStyle(fontSize: 15),
                                    )
                                  else
                                    const Text("Name  :     -"),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 4)),
                                  //Tel
                                  if (user.tel != null && user.tel != "")
                                    Text(
                                      "Tel       :   ${user.tel}",
                                      style: const TextStyle(fontSize: 15),
                                    )
                                  else
                                    const Text("Tel        :     -"),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 4)),
                                  //Email
                                  if (user.email != null && user.email != "")
                                    Text(
                                      "Email  :    ${user.email}",
                                      style: const TextStyle(fontSize: 15),
                                    )
                                  else
                                    const Text("Email  :     -"),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 4)),
                                  //LineID
                                  if (user.lineId != null && user.lineId != "")
                                    Text(
                                      "LineID :    ${user.lineId}",
                                      style: const TextStyle(fontSize: 15),
                                    )
                                  else
                                    const Text("LineID  :     -"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //if (user.userType == "DormOwner")
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 13, 0, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Dorm Description",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 70),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PostForm()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                237, 215, 106, 56), // set background color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 1, vertical: 1),
                            minimumSize: const Size(100, 30),
                          ),
                          child: const Text(
                            "Add Dorm",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                            //children: const [DormsEachOwner()],
                            )
                      ],
                    )
                  ],
                ),
              ]),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        endDrawer: const MyDrawer(),
        appBar: const MyAppbar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      'This feature will be available when you are logged in only'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          237, 215, 106, 56), // set background color
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
