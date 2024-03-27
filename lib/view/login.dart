import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/controller/firebase/user_login.dart';
import 'package:dinnytable/view/signup_screen.dart';
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
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
          Form(
            key: formKey,
            child: Column(
              children: [
                sized10,
                Customtextfeild(
                  controller: clientcontroller.email,
                  hintText: 'Email',
                  icon: const Icon(Icons.person),
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!GetUtils.isEmail(value)) {
                      return 'Enter a valid email address';
                    }
                    return null; 
                  },
                ),
                sized10,
                Customtextfeild(
                  controller: clientcontroller.password,
                  hintText: ' Password',
                  icon: const Icon(Icons.lock),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters long.';
                    }
                    return null;
                  },
                ),
                sized20,
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      login(clientcontroller.email.text.trim(),
                          clientcontroller.password.text.trim());
                    }
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
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.black),
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
          ),
        ]),
      ),
    );
  }
}
