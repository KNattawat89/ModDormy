import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/home.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'menu_text_icon.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, this.refreshState}) : super(key: key);
  final Function? refreshState;

  @override
  Widget build(BuildContext context) {
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
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage("assets/images/profile.jpg"),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Kenglnwza007",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "kengza007@gmail.com",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      )
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
                      const MenuTextIcon(
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
                      const Divider(),
                      MenuTextIcon(
                        iconName: Icons.logout,
                        menuName: 'Logout',
                        route: '/logout',
                        refreshState: refreshState,
                      )
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
