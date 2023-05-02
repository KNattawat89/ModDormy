import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/forgotpass_page.dart';
import 'package:moddormy_flutter/screens/post_form.dart';
import 'package:moddormy_flutter/screens/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF8F0),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Image.asset(
                  'assets/logo/Logo2.png',
                  width: 184,
                  height: 184,
                ),
              ),
              const LoginForm()
            ],
          ),
        ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _user = TextEditingController();
  final _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Username : ",
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
                          controller: _user,
                         style: const TextStyle(overflow: TextOverflow.fade),
                          scrollPadding: const EdgeInsets.symmetric(horizontal: double.infinity),
                          decoration: const InputDecoration(
                            isDense: true,
                        
                            // contentPadding: EdgeInsets.zero,
                              filled: true,
                              fillColor: Colors.white,
                              
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)))),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Password : ",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: 172,
                    height: 30,
                    child: Material(
                      elevation: 2,
                      shadowColor: Colors.black,
                      child: TextFormField(
                        controller: _pass,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)))),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r'^[\S]+[\w\s]{0,7}$')
                                  .hasMatch(value)) {
                            return 'Enter Correct Email Address';
                          }
                          return null;
                        },
                      ),
                    ))
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const ForgotPassPage()),
                          ));
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: Color(0xFFDC6E46), fontSize: 14),
                    )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 130,
              height: 39,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDC6E46),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.5))),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const PostForm()),
                        ));
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 14),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const RegisterPage()),
                          ));
                    },
                    child: const Text(
                      "Create",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ));
  }
}
