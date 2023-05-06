import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/reset_pass_page.dart';
import 'package:moddormy_flutter/screens/login_page.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({super.key});

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
              margin: const EdgeInsets.all(35.0),
              child: const ForgotForm(),
            ),
          ],
        ));
  }
}

class ForgotForm extends StatefulWidget {
  const ForgotForm({super.key});

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  Future verifyEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const ResetPassPage()),
          ));
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

  final _formkey = GlobalKey<FormState>();
  final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 65,
                child: TextFormField(
                  controller: _email,
                  autofocus: true,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                      // isDense: true,
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Color(0xFF2A8089),
                      // contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Type your email",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF2A8089), width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0)))),
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
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.,
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
                  ),
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
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            verifyEmail();
                          }
                        },
                        child: const Text(
                          "Confirm",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )),
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
