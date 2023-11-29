import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:dinnytable/screens/user_screens/home.dart';
import 'package:dinnytable/screens/user_screens/sign_upcard.dart';

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
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assest/dinner_image-removebg-preview (1).png"),
                  ),),),),
            Column(
              children: [
                sized20, 
            customTextField ("Email ", Icons.person, false, userController),
            sized10,
            customTextField("Password", Icons.lock, true, passwordController),
            sized10,
            const Padding(
              padding: EdgeInsets.only(left: 280),
              child: Text("Forget Password ?"),
            ),
            sized10,
            buttonclik(context, "Login", const HomeScreen()),
            sized30,
            sized20,
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
                        recognizer: TapGestureRecognizer()..onTap = () {
                       Get.to (const SignUp());
                        
                        })
                  ],
                ),
              ),
            )
          ],
        ),
          ]
        ),
      ),
    );
  }
}
