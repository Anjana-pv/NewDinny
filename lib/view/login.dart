import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/controller/firebase/user_login.dart';
import 'package:dinnytable/view/signup_screen.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
          Form(
        key: _formKey, // Add this line to provide the form key
        child: Column(
             children: [
              sized10,
             Customtextfeild(
              controller:clientcontroller.user ,
               hintText: 'Username', 
               icon: const Icon(Icons.person),
                obscureText: false,
                 keyboardType: TextInputType.name),
              sized10,
              Customtextfeild(
                controller: clientcontroller.password,
                 hintText:' Password',
                  icon: const Icon(Icons.lock), 
                  obscureText: true,
                   keyboardType: TextInputType.text),
              sized20,
              ElevatedButton(
                onPressed: () {
                   if (_formKey.currentState?.validate() ?? false) {
                  // print('$passwordController ');
                     clientcontroller.email.clear();
                     clientcontroller.password.clear();
                     
                  login(clientcontroller.email.text.trim(),
                      clientcontroller.password.text.trim());
                      // ClientHomescreen();
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
          ),
        ]),
      ),
    );
  }



}