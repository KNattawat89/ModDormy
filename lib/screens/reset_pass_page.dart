import 'package:flutter/material.dart';
import 'package:moddormy_flutter/screens/login_page.dart';

class ResetPassPage extends StatelessWidget {
  const ResetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFDC6E46),
        body: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(20.0),
              child: Column(children: [
                const Padding(
                    padding: EdgeInsets.only(top: 60, bottom: 10),
                    child: Text(
                      "Check your email",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
               const Padding(
                  padding:  EdgeInsets.only(bottom: 50.0),
                  child: 
                      Flexible(
                        child: Text(
                          "Please check your inbox and click in the received link to reset a password",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    
                  ),
                ),
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
                const SizedBox(
                  height: 20,
                )
              ]),
            ),
          ],
        ));
  }
}
