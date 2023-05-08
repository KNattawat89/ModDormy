import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/fav_preload.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFDC6E46),
      actions: [
        Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 35, // Changing Drawer Icon Size
            ),
          );
        }),
        const SizedBox(
          width: 10,
        )
      ],
      leading: IconButton(
          // App icon
          icon: Image.asset('assets/logo/Logo.png'),
          onPressed: () => {
                if (FavPreload.homeReload != null) {FavPreload.homeReload!()},
                Navigator.popUntil(context, ModalRoute.withName('/home')),
              }),
      leadingWidth: 100,
    );
  }
}
