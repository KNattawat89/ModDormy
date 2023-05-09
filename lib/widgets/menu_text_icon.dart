import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/fav_preload.dart';
import 'package:moddormy_flutter/provider/user_provider.dart';
import 'package:moddormy_flutter/screens/favorite.dart';
import 'package:provider/provider.dart';

class MenuTextIcon extends StatelessWidget {
  const MenuTextIcon({
    Key? key,
    required this.iconName,
    required this.menuName,
    required this.route,
  }) : super(key: key);
  final IconData iconName;
  final String menuName;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconName,
        color: Colors.black87,
        size: 30,
      ),
      title: Text(menuName, style: const TextStyle(fontSize: 20)),
      onTap: () async {
        if (route == '/home') {
          Navigator.popUntil(context, ModalRoute.withName(route));
          if (FavPreload.homeReload != null) {
            FavPreload.homeReload!();
          }
          // refreshState!();
        } else if (route == '/logout') {
          await FirebaseAuth.instance.signOut();

          Provider.of<UserProvider>(context, listen: false).clearUser();
          if (FirebaseAuth.instance.currentUser == null) {
            debugPrint("User sign-out already");
          }
          // ignore: use_build_context_synchronously
          Navigator.popUntil(context, ModalRoute.withName('/home'));
          if (FavPreload.homeReload != null) {
            FavPreload.homeReload!();
          }
        } else {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}
