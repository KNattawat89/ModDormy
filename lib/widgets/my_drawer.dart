import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/provider/user_provider.dart';
import 'package:moddormy_flutter/screens/home.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'package:moddormy_flutter/screens/register.dart';
import 'package:provider/provider.dart';
import 'menu_text_icon.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFFDC6E46)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      user.profileImage == ''
                          ? const CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage("assets/images/profileNull.png"),
                            )
                          : CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  'http://moddormy.ivelse.com:8000${user.profileImage}')),
                      const SizedBox(width: 15),
                      Expanded(
                          child: user.userId != ''
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.username,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      //textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      user.email,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                      //textAlign: TextAlign.justify,
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Text(
                                      '|',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterPage(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Register",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ))
                    ],
                  )
                ],
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      cosnt MenuTextIcon(
                          iconName: Icons.home,
                          menuName: 'Home',
                          route: '/home'),
                      const MenuTextIcon(
                          iconName: Icons.account_circle,
                          menuName: 'Profile',
                          route: '/profile'),
                      const MenuTextIcon(
                          iconName: Icons.favorite,
                          menuName: 'Favorite',
                          route: '/fav'),
                      user.userId != '' ? const Divider() : const Text(''),
                      user.userId != ''
                          ? const MenuTextIcon(
                              iconName: Icons.logout,
                              menuName: 'Logout',
                              route: '/logout',
                            )
                          : const Text('')
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
