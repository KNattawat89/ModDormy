import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moddormy_flutter/screens/ResetPassPage.dart';
import 'package:moddormy_flutter/screens/login_page.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({super.key});

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
              height: 243,
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
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 18),
                ),
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
                      decoration: const InputDecoration(
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
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                              builder: ((context) => const ResetPassPage()),
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
      ),
    );
  }
}
