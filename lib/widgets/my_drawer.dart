import 'package:flutter/material.dart';
import 'menu_text_icon.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:[
          DrawerHeader(
              decoration:
              const BoxDecoration(
                  color: Color(0xFFDC6E46)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/profile.jpg"),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Kenglnwza007",style: TextStyle(color:Colors.white,fontSize:20 ,fontWeight: FontWeight.bold),),
                          Text("kengza007@gmail.com",style: TextStyle(color:Colors.white,fontSize: 14),)
                        ],
                      )
                    ],
                  )
                ],
              )
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                menuTextIcon(context,Icons.home, "Home",'/'),
                menuTextIcon(context,Icons.account_circle, "Profile",'/profile'),
                menuTextIcon(context,Icons.favorite, "Favorite",'/fav'),
                const Divider(),
                menuTextIcon(context,Icons.logout, "Logout",'/logout')
              ],
            ),
          )
        ],
      ),
    );
  }
}
