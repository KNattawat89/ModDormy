// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
// import 'package:moddormy_flutter/widgets/edit_profile_image.dart';

import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import 'my_appbar.dart';
import 'my_drawer.dart';

class EditUserForm extends StatefulWidget {
  const EditUserForm({Key? key}) : super(key: key);

  @override
  _EditUserFormState createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _FnameController = TextEditingController();
  TextEditingController _LnameController = TextEditingController();
  TextEditingController _TelController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _LineIDController = TextEditingController();
  // late FocusNode focusNode1 = FocusNode();
  // FocusNode myFocusNode2 = FocusNode();
  // FocusNode myFocusNode3 = FocusNode();
  // FocusNode myFocusNode4 = FocusNode();
  // FocusNode myFocusNode5 = FocusNode();

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProvider>(context, listen: false);
    _FnameController.text = user.firstname;
    _LnameController.text = user.lastname;
    _TelController.text = user.tel;
    _EmailController.text = user.email;
    _LineIDController.text = user.lineId;
    // focusNode1 = FocusNode();
  }

  @override
  void dispose() {
    // focusNode1.dispose();
    // myFocusNode2.dispose();
    // myFocusNode3.dispose();
    // myFocusNode4.dispose();
    // myFocusNode5.dispose();
    super.dispose();
  }

  // void _requestFocus() {
  //   setState(() {
  //     FocusScope.of(context).requestFocus(focusNode1);
  //   });
  // }

  // void _requestFocus2() {
  //   setState(() {
  //     FocusScope.of(context).requestFocus(myFocusNode2);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    //late FocusNode focusNode1 = FocusNode();
    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar: const MyAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(children: [
            // Other widgets here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  Stack(
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
                                      'assets/images/profileNull.png')
                                  : const AssetImage(
                                      'assets/images/profileNull.png'),
                            ),
                          ),
                          child: GestureDetector(
                              // onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           const EditProfileImage(),
                              //     ),
                              //   );
                              // },
                              child: Stack(children: [
                            Positioned(
                              bottom: 2,
                              right: 2,
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFDC6E46),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 5, 5, 5),
                                    child: Image.asset(
                                      'assets/images/edit.png',
                                      width: 17,
                                      height: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])))
                    ],
                  ),
                ])
              ],
            ),
            const SizedBox(height: 10),
            Text(
              user.username,
              style: const TextStyle(fontSize: 24),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Edit Profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Form(
              key: _formkey,
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 10.0),
                            TextFormField(
                              //focusNode: focusNode1,
                              //onTap: _requestFocus,
                              decoration: const InputDecoration(
                                labelText: 'First Name',
                                // floatingLabelStyle: TextStyle(
                                //   color: focusNode1.hasFocus
                                //       ? Colors.red
                                //       : Colors.black,
                                // ),
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(128, 38, 38, 38)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          DefaultSelectionStyle.defaultColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2A8089)),
                                ),
                              ),
                              controller: _FnameController,
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: _LnameController,
                              //focusNode: focusNode,
                              //initialValue: _FnameController.text,
                              decoration: const InputDecoration(
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(128, 38, 38, 38)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          DefaultSelectionStyle.defaultColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2A8089)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            TextField(
                              controller: _TelController,
                              decoration: const InputDecoration(
                                labelText: 'Tel.',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(128, 38, 38, 38)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          DefaultSelectionStyle.defaultColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2A8089)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            TextField(
                              controller: _EmailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(128, 38, 38, 38)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          DefaultSelectionStyle.defaultColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2A8089)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            TextField(
                              controller: _LineIDController,
                              decoration: const InputDecoration(
                                labelText: 'LineID',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(128, 38, 38, 38)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          DefaultSelectionStyle.defaultColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2A8089)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your code for handling the button press here
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        237, 215, 106, 56), // set background color
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    minimumSize: const Size(100, 40),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
