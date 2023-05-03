import 'package:flutter/material.dart';


ListTile menuTextIcon(BuildContext context,IconData name,String menuName, String route) {
  return ListTile(
    leading: Icon(name,color: Colors.black87,size: 30,),
    title: Text(menuName,style: const TextStyle(fontSize: 20)),
    onTap: () {
      if (route == '/'){
        Navigator.popUntil(context,ModalRoute.withName('/'));
      }else {
        Navigator.pushNamed(context, route);
      }
    },
  );
}