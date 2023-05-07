import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/provider/user_provider.dart';


ListTile menuTextIcon(BuildContext context,IconData name,String menuName, String route) {
  UserProvider user;
  return ListTile(
    leading: Icon(name,color: Colors.black87,size: 30,),
    title: Text(menuName,style: const TextStyle(fontSize: 20)),
    onTap: () async{
      if (route == '/home'){
        Navigator.popUntil(context,ModalRoute.withName(route));
      }
         else if (route == '/logout'){
          await FirebaseAuth.instance.signOut();
          if (FirebaseAuth.instance.currentUser == null) {
            debugPrint("User sign-out already");
          }
        // ignore: use_build_context_synchronously
        Navigator.popUntil(context,ModalRoute.withName('/home'));
      }
      else{
        Navigator.pushNamed(context, route);
      }
    },
  );
}