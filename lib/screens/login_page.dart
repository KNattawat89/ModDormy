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
                padding: const EdgeInsets.symmetric(vertical: 30.0),
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
  bool err = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Username",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
           SizedBox(
            height: 65,
              child: TextFormField(
                controller: _user,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    // isDense: true,
                    prefixIcon: Icon(Icons.person),
                    // contentPadding: EdgeInsets.zero,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Type your username",
                    
                    border: OutlineInputBorder(
                      
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
               
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
          SizedBox(
            height: 65,
              child: TextFormField(
                controller: _pass,
                 style: const TextStyle(fontSize: 18),
                decoration:  InputDecoration(
                    hintText: "Type your password",
                    prefixIcon: const Icon(Icons.key),
                    filled: true,
                    fillColor: Colors.white,
                    disabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                       )),
              ),
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
                      style: TextStyle(color: Color(0xFFDC6E46), fontSize: 14, decoration: TextDecoration.underline),
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
                  if (_formKey.currentState!.validate() & false) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const PostForm()),
                        ));
                  }
                  else{
                   setState(() {
                     err = !err;
                   });
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ),
               Container(
                    
                   margin: err? const EdgeInsets.only(top:30) : const EdgeInsets.only(top:0),
                         padding: err? const EdgeInsets.symmetric(horizontal: 30, vertical: 12) : const EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                       color: Color(0xFFFFCDD2),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                    ),
                    child: err? const Text("Enter the correct username and password",style: TextStyle(color: Colors.red,)) : const Text("")
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
                          color: Colors.black, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                    )),
              ],
            )
          ],
        ));
  }
}
