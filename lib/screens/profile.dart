// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/profile_reload.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'package:moddormy_flutter/screens/post_form.dart';
import 'package:moddormy_flutter/widgets/dorms_each_owner.dart';
import 'package:moddormy_flutter/widgets/edit_user_form.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void refreshState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ProfilePreload.profileReload = refreshState;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    // getting the size of the window
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    if (user.userId != '' && FirebaseAuth.instance.currentUser != null) {
      String name = "Name  :   ${user.firstname} ${user.lastname}";
      return Scaffold(
          backgroundColor: const Color(0xFFFFF8F0),
          endDrawer: const MyDrawer(),
          appBar: const MyAppbar(),
          body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(children: [
                Column(children: [
                  Stack(children: [
                    user.profileImage == "" || user.profileImage == null
                        ? const CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/profileNull.png',
                            ),
                            radius: 80,
                          )
                        : CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(
                              "http://moddormy.ivelse.com:8000${user.profileImage}",
                            ),
                          ),
                  ]),
                ]),
                const SizedBox(height: 10),
                Text(
                  user.username,
                  style: const TextStyle(fontSize: 24),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
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
                                  builder: (context) => const EditUserForm(),
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (user.firstname != null &&
                                user.lastname != null &&
                                user.firstname != "" &&
                                user.lastname != "")
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      name,
                                      // style: const TextStyle(
                                      //   fontSize: 15,
                                      // ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )
                            else
                              Row(
                                children: const [
                                  Expanded(child: Text("Name  :     -")),
                                ],
                              ),
                            const Padding(padding: EdgeInsets.only(bottom: 4)),
                            if (user.tel != null && user.tel != "")
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Tel       :   ${user.tel}",
                                    overflow: TextOverflow.ellipsis,
                                  ))
                                ],
                              )
                            else
                              Row(
                                children: const [
                                  Expanded(child: Text("Tel        :     -")),
                                ],
                              ),
                            const Padding(padding: EdgeInsets.only(bottom: 4)),
                            if (user.email != null && user.email != "")
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Email   :    ${user.email}",
                                      //style: const TextStyle(fontSize: 15),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )
                            else
                              Row(
                                children: const [
                                  Expanded(child: Text("Email  :     -")),
                                ],
                              ),
                            const Padding(padding: EdgeInsets.only(bottom: 4)),
                            if (user.lineId != null && user.lineId != "")
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "LineID :    ${user.lineId}",
                                      //style: const TextStyle(fontSize: 15),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )
                            else
                              Row(
                                children: const [
                                  Expanded(child: Text("LineID  :     -")),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (user.userType == "DormOwner")
                  Column(
                    children: [
                      Row(
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
                      Center(
                        child: SizedBox(
                            // constraints: BoxConstraints(
                            //   minWidth: 1,
                            //   maxWidth: 350.0,

                            // ),
                            width: width * 0.8,
                            height: height * 0.3,
                            child: const DormsEachOwner()),
                      ),
                    ],
                  ),
              ])));
    } else {
      return Scaffold(
        backgroundColor: const Color(0xFFFFF8F0),
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
                  Image.asset(
                    'assets/images/exclamation-mark.png',
                    scale: 4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'This feature will be available when you are logged in only',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (const LoginPage())));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(237, 215, 106, 56),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30) // set background color
                        ),
                    child: const Text('Login'),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
