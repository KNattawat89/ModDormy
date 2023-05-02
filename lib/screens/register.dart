import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'package:moddormy_flutter/screens/post_dorm.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFDC6E46),
        body: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 620,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(25.0),
              child: const RegisterForm(),
            ),
          ],
        ));
  }
}

enum UserAccount { dormOwner, customer }

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formkey = GlobalKey<FormState>();
  final _user = TextEditingController();
  final _fname = TextEditingController();
  final _lname = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  UserAccount? _account = UserAccount.customer;
  bool isCheckedOwner = false;
  bool isCheckedCus = false;
  bool checkOne = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Register",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                )),
            // Row(children: const [
            //   Text(
            //     "Username",
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ]),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 50,
              child: TextFormField(
                controller: _user,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    hintText: "Username",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.5)))),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[\S]{8,15}$').hasMatch(value)) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
            ),
            // Row(children: const [
            //   Text(
            //     "Firstname",
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ]),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 50,
              child: TextFormField(
                controller: _fname,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    hintText: "First name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.5)))),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
            ),
            // Row(children: const [
            //   Text(
            //     "Lastname",
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ]),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 50,
              child: TextFormField(
                controller: _lname,
                decoration: const InputDecoration(
                    hintText: "Last name",
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.5)))),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
            ),
            // Row(children: const [
            //   Text(
            //     "Email",
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ]),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 50,
              child: TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                    hintText: "Email",
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.5)))),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),
            // Row(children: const [
            //   Text(
            //     "Password",
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ]),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 50,
              child: TextFormField(
                controller: _pass,
                decoration: const InputDecoration(
                    hintText: "Password",
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.5)))),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[\S]{8,15}$').hasMatch(value)) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            // Row(children: const [
            //   Text(
            //     "Confirm password",
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ]),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Confirm password",
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.5)))),
                validator: (value) {
                  if (value == null || value.isEmpty || value != _pass.text) {
                    return 'Please confirm your password';
                  }
                  return null;
                },
              ),
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   Checkbox(
            //     isError: true,
            //     activeColor: Colors.black,
            //     value: isCheckedOwner,
            //     onChanged: (bool? value) {
            //       if (isCheckedOwner == false) {
            //         setState(() {
            //           isCheckedOwner = value!;
            //           isCheckedCus = false;
            //           checkOne = true;
            //         });
            //       }
            //     },
            //   ),
            //   const Text(
            //     "Dorm owner",
            //     style: TextStyle(fontSize: 15),
            //   )
            // ]),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text(
                      'dormOwner',
                      style: TextStyle(fontSize: 12),
                    ),
                    leading: Radio<UserAccount>(
                      value: UserAccount.dormOwner,
                      groupValue: _account,
                      onChanged: (UserAccount? value) {
                        setState(() {
                          _account = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Customer'),
                    leading: Radio<UserAccount>(
                      value: UserAccount.customer,
                      groupValue: _account,
                      onChanged: (UserAccount? value) {
                        setState(() {
                          _account = value;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),

            // const Padding(
            //   padding: EdgeInsets.only(right: 18.0),
            //   child: Text(
            //     "Customer",
            //     style: TextStyle(fontSize: 15),
            //   ),
            // ),

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 130,
                    height: 39,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.5)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const LoginPage()),
                              ));
                        },
                        child: const Text(
                          "Back to login",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    width: 130,
                    height: 39,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDC6E46),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.5)),
                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: SizedBox(
                                    height: 250,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Image.asset(
                                              'assets/images/checkedmark.png'),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 10.0),
                                          child: Text(
                                            'Successful Registration',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 20.0),
                                          child: Text(
                                              "Congraturations, your account has been successful created"),
                                        ),
                                        SizedBox(
                                          width: 130,
                                          height: 39,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFFDC6E46),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.5)),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: ((context) =>
                                                          const LoginPage()),
                                                    ));
                                              },
                                              child: const Text(
                                                "Continue",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              )),
                                        )
                                      ],
                                    )),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Confirm",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
