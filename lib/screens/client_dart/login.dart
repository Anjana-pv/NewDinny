import 'package:dinnytable/firebase/firebase_auth.dart';
import 'package:dinnytable/screens/client_dart/sign_upcard.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController userController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           Padding(
             padding: const EdgeInsets.only(top:60),
              child: Container(
                 width: 200,
                  height: 200,
                   decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assest/Apple_Watch_41mm_-_2-transformed.png"),
                    ),
                  ),
              ),
           ),
            Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assest/image 9.png"),
                  ),
                ),
              ),
          Column(
            children: [
              sized20,
              reusableTextfeild("Email ", Icons.person, false, emailcontroller),
              sized10,
              reusableTextfeild(
                  "Password", Icons.lock, true, passwordController),
              sized10,
              ElevatedButton(
                  onPressed: () {
                    login(emailcontroller.text.trim(),
                        passwordController.text.trim());
                  },
                  child: const Text("Login")),
              sized50,
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: 'New User? ',
                      ),
                      TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(SignUp());
                            })
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
  