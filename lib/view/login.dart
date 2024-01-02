
import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/controller/firebase/firebase_auth.dart';
import 'package:dinnytable/view/sign_upcard.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Clientcontroller clientcontroller = Get.put(Clientcontroller());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("assest/Apple_Watch_41mm_-_2-transformed.png"),
                ),
              ),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assest/image 9.png"),
              ),
            ),
          ),
          Column(
            children: [
              sized10,

              TextFieldWidgetD(
                icon: const Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                labeltext: "Email",
                controller: clientcontroller.emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                
              ),
              sized10,
              TextFieldWidgetD(
                icon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                labeltext: "Password",
                controller: clientcontroller.passwordController,
                keyboardType: TextInputType.name,
                obscureText: true,
                
              ),
              sized20,
              ElevatedButton(
                onPressed: () {
                  // print('$passwordController ');
                  login(clientcontroller.emailController.text.trim(),
                      clientcontroller.passwordController.text.trim());
                      // ClientHomescreen();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(206, 4, 52, 29)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 50.5)),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              sized30,
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
                              Get.to(const SignUp());
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
