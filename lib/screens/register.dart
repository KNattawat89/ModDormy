import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moddormy_flutter/screens/login_page.dart';

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
              height: 536,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(25.0),
              child: const RegisterForm(),
            ),
          ],
        ));
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formkey = GlobalKey<FormState>();
  bool isCheckedOwner = false;
  bool isCheckedCus = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
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
            Container(
              padding: const EdgeInsets.only(left: 30.0, right: 12.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Username",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 30,
                          width: 172,
                          child: Material(
                            elevation: 2,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              scrollPadding: const EdgeInsets.symmetric(
                                  horizontal: double.infinity),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)))),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                  return 'Enter Correct Email Address';
                                }
                                return null;
                              },
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Firstname",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 30,
                          width: 172,
                          child: Material(
                            elevation: 2,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              scrollPadding: const EdgeInsets.symmetric(
                                  horizontal: double.infinity),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)))),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                  return 'Enter Correct Email Address';
                                }
                                return null;
                              },
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Lastname",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 30,
                          width: 172,
                          child: Material(
                            elevation: 2,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              scrollPadding: const EdgeInsets.symmetric(
                                  horizontal: double.infinity),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)))),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                  return 'Enter Correct Email Address';
                                }
                                return null;
                              },
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Email",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 30,
                          width: 172,
                          child: Material(
                            elevation: 2,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              scrollPadding: const EdgeInsets.symmetric(
                                  horizontal: double.infinity),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)))),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                  return 'Enter Correct Email Address';
                                }
                                return null;
                              },
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 30,
                          width: 172,
                          child: Material(
                            elevation: 2,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              scrollPadding: const EdgeInsets.symmetric(
                                  horizontal: double.infinity),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)))),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                  return 'Enter Correct Email Address';
                                }
                                return null;
                              },
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Confirm password",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 30,
                          width: 172,
                          child: Material(
                            elevation: 2,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              scrollPadding: const EdgeInsets.symmetric(
                                  horizontal: double.infinity),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)))),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                  return 'Enter Correct Email Address';
                                }
                                return null;
                              },
                            ),
                          ))
                    ],
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Checkbox(
                activeColor: Colors.black,
                value: isCheckedOwner,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedOwner = value!;
                  });
                },
              ),
              const Text(
                "Dorm owner",
                style: TextStyle(fontSize: 15),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Checkbox(
                activeColor: const Color(0xFFDC6E46),
                value: isCheckedCus,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedCus = value!;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.only(right: 18.0),
                child: Text(
                  "Customer",
                  style: TextStyle(fontSize: 15),
                ),
              )
            ]),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                          style: TextStyle(fontSize: 14),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const LoginPage()),
                              ));
                        },
                        child: const Text(
                          "Confirm",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
