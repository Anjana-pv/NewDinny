import 'package:dinnytable/controllers/cient_controller.dart';
import 'package:dinnytable/firebase/firebase_auth.dart';
import 'package:dinnytable/screens/client_dart/sign_upcard.dart';
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
            padding: const EdgeInsets.only(top: 60),
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
            width: 250,
            height: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assest/image 9.png"),
              ),
            ),
          ),
          Column(
            children: [
              sized20,
             TextFieldWidgetD(
                    icon: const Icon(Icons.email,color: Colors.white,),
                    labeltext: "Email",
                    controller: clientcontroller.emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    
                    obscureText: false),
              sized10,
               TextFieldWidgetD(
                    icon: const Icon(Icons.lock,color: Colors.white,),
                    labeltext: "Password",
                    controller: clientcontroller.passwordController,
                    keyboardType: TextInputType.name,
                 
                    obscureText: true),
              sized20,
              ElevatedButton(
                onPressed: () {
                  login(clientcontroller.emailcontroller.text.trim(),
                      clientcontroller.passwordController.text.trim());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(206, 4, 52, 29)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 50.5)),
                ),
                child: const Text('Log in',style: TextStyle(fontSize: 16),),
              ),
             
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
                              Get.to(const SignUp());
                          }
                       )
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
