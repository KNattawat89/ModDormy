import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    // print(user.userId);

    // when u want to update user profile on db please use this method together
    // it will update UserProvider as well
    //-----------------
    // UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    // UserItem userProfile = await UserApiService.getUserProfile(uid, userProvider);
    // noted: in the getUserProfile method, it has async function already don't have to use async func.
    //-----------------

    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar: const MyAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            user.userId != '' && FirebaseAuth.instance.currentUser != null
                ? Column(
                    children: [
                      Text(user.username),
                      Text(user.email),
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Please login'),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
          ])
        ],
      ),
    );
  }
}
