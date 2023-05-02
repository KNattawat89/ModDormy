import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/register.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'package:moddormy_flutter/utilities/caller.dart';

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
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}" + "123123123");
          }

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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ],
                      )),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5)))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5)))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5)))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5)))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5)))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5)))),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value != _pass.text) {
                          return 'Please confirm your password';
                        }
                        return null;
                      },
                    ),
                  ),
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
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
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
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                          
                                            email: _email.text,
                                            password: _pass.text);
                                    final  registerAcc = await Caller.dio.post(
                                        "/api/auth/register",
                                        data: {
                                            "username": _user.text,
                                            "password": _pass.text,
                                            "fname": _fname.text,
                                            "lname": _lname.text,
                                            "email": _email.text,
                                            "account": _account ==
                                                    UserAccount.dormOwner
                                                ? "DormOwner"
                                                : "Customer",
                                                "tel": "095123123"
                                                });
                                    debugPrint(registerAcc.statusMessage);
                                    // ignore: use_build_context_synchronously
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        content: SizedBox(
                                            height: 250,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 20),
                                                  child: Image.asset(
                                                      'assets/images/checkedmark.png'),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10.0),
                                                  child: Text(
                                                    'Successful Registration',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 20.0),
                                                  child: Text(
                                                      "Congraturations, your account has been successful created"),
                                                ),
                                                SizedBox(
                                                  width: 130,
                                                  height: 39,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFFDC6E46),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                            color:
                                                                Colors.white),
                                                      )),
                                                )
                                              ],
                                            )),
                                      ),
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    debugPrint(e.message);
                                  }
                                }
                              },
                              child: const Text(
                                "Confirm",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  )
                ]),
              ));
        });
  }
}
