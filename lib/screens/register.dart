import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/login_page.dart';
import 'package:moddormy_flutter/utilities/caller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFDC6E46),
        body: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
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
  bool _hindOfOpen = true;
  bool _confirmPass = true;
  bool _isLoading = true;
  final _formkey = GlobalKey<FormState>();
  final _user = TextEditingController();
  final _fname = TextEditingController();
  final _lname = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  UserAccount? _account = UserAccount.customer;
  String? message = "";
  bool err = false;
  bool userError = true;
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  void _togglePass() {
    setState(() {
      _hindOfOpen = !_hindOfOpen;
    });
  }

  void _toggleConfirmPass() {
    setState(() {
      _confirmPass = !_confirmPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error} 123123123");
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
                    margin: const EdgeInsets.only(top: 10.0, bottom: 5),
                    child: TextFormField(
                      controller: _user,
                      autofocus: true,
                      decoration: const InputDecoration(
                          labelText: "Username",
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          hintText: "Please enter 6-15 characters",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF2A8089), width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5)))),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[\S]{6,15}$').hasMatch(value)) {
                          return 'Please enter 6-15 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: _fname,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          labelText: "First name",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF2A8089), width: 2),
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
                    child: TextFormField(
                      controller: _lname,
                      decoration: const InputDecoration(
                          labelText: "Last name",
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF2A8089), width: 2),
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
                    child: TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                          labelText: "Email",
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF2A8089), width: 2),
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
                    child: TextFormField(
                      controller: _pass,
                      obscureText: _hindOfOpen,
                      decoration: InputDecoration(
                          hintText: "Please enter 8-15 characters",
                          labelText: "Password",
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              onPressed: _togglePass,
                              icon: _hindOfOpen
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF2A8089), width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5)))),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[\S]{8,15}$').hasMatch(value)) {
                          return 'Please enter 8-15 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      obscureText: _confirmPass,
                      decoration: InputDecoration(
                          labelText: "Confirm password",
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              onPressed: _toggleConfirmPass,
                              icon: _confirmPass
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF2A8089), width: 2),
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
                  SizedBox(
                      width: double.infinity,
                      height: err ? 70 : 0,
                      child: Container(
                          margin: err
                              ? const EdgeInsets.only(bottom: 10)
                              : const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                              color: Color(0xFFFFCDD2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                err
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Expanded(
                                          child: Text(
                                              message == ""
                                                  ? ""
                                                  : "The email address is already used",
                                              style: const TextStyle(
                                                color: Colors.red,
                                              )),
                                        ))
                                    : const Text("")
                              ]))),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _account = UserAccount.dormOwner;
                          });
                        },
                        child: Row(
                          children: [
                            Radio<UserAccount>(
                              value: UserAccount.dormOwner,
                              groupValue: _account,
                              activeColor: const Color(0xFF2A8089),
                              onChanged: (UserAccount? value) {
                                setState(() {
                                  _account = value;
                                });
                              },
                            ),
                            const Text(
                              'DormOwner',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _account = UserAccount.customer;
                          });
                        },
                        child: Row(
                          children: [
                            Radio<UserAccount>(
                              value: UserAccount.customer,
                              activeColor: const Color(0xFF2A8089),
                              groupValue: _account,
                              onChanged: (UserAccount? value) {
                                setState(() {
                                  _account = value;
                                });
                              },
                            ),
                            const Text(
                              'Customer',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: 39,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.5)),
                            ),
                            onPressed: () {
                              Navigator.pop(
                                  context, ModalRoute.withName('/register'));
                            },
                            child: const Text(
                              "Back to login",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            )),
                      )),
                      const SizedBox(width: 20),
                      Expanded(
                          child: SizedBox(
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
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  if (_isLoading) {
                                    showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                                content: SizedBox(
                                              height: 250,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                            color: Color(
                                                                0xFFDC6E46)),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text("Registering...")
                                                ],
                                              ),
                                            )));
                                    final credential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                            email: _email.text,
                                            password: _pass.text);

                                    setState(() {
                                      err = false;
                                    });

                                    final registerAcc = await Caller.dio
                                        .post("/api/auth/register", data: {
                                      "userid": credential.user?.uid,
                                      "username": _user.text,
                                      "fname": _fname.text,
                                      "lname": _lname.text,
                                      "email": _email.text,
                                      "account":
                                          _account == UserAccount.dormOwner
                                              ? "DormOwner"
                                              : "Customer",
                                    });
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    debugPrint(registerAcc.statusMessage);
                                  }

                                  if (_isLoading == false) {
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
                                                    "Congraturations, your account has been successful created",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(
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
                                                        Navigator.popUntil(
                                                            context,
                                                            ModalRoute.withName(
                                                                '/login'));
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
                                  }
                                  // ignore: use_build_context_synchronously
                                } on FirebaseAuthException catch (e) {
                                  setState(() {
                                    err = true;
                                    message = e.message;
                                    _isLoading = false;
                                  });
                                  if (_isLoading == false) {
                                    Navigator.of(context).pop();
                                  }
                                  debugPrint(e.message);
                                }
                              }
                            },
                            child: const Text(
                              "Confirm",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            )),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ]),
              ));
        });
  }
}
