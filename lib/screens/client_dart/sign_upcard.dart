import 'package:dinnytable/firebase/db_functions.dart';
import 'package:dinnytable/screens/client_dart/login.dart';
import 'package:dinnytable/screens/client_dart/registratio.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordController = TextEditingController();

class SignUp extends StatefulWidget {
  SignUp({Key? key});
  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Column(
         children: [
            const Text(
              "Create an Account",
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
            
          ),
          Container(
            width: 200,
            height: 200,

            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assest/Apple_Watch_41mm_-_2-transformed.png'))),
          ),
          sized30,
             Center(
                child: Column(
                  children: [
                  reusableTextfeild(
                    "UserName",
                    Icons.person,
                    false,
                    userController,
                  ),
                  sized20,
                    reusableTextfeild("Email", Icons.mail, false, emailcontroller),
                   sized20,
                  reusableTextfeild("Password",Icons.lock, true,passwordController),
                  sized30,
                    ElevatedButton(onPressed: (){
                      signup();
                    }, child: Text("Sign up")),
                     sized30,
                       const Text("Or"),
                  sized30,
                   GestureDetector(
            onTap: () {
              signinggogle();
            },
            child: Container(
                width: 300,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 79, 79),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text("SignUp with Google",style: TextStyle(color: Colors.white),)
                  ],
                ))),
           
                   )
                ]),
              ),
            ],
             )
          );
        }
}

signinggogle() async {
  try {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
    Get.to(const ResgistrationScreen());
    emailcontroller.clear();
  } catch (e) {
   print("Error signing in with Google: $e");
  }
}
  Future signup() async {
   try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailcontroller.text.trim(),
      password: passwordController.text.trim(),
    );


    addUser(
      userController.text.trim(),
      emailcontroller.text.trim(),
      passwordController.text.trim(),
    );
    Get.to(const ResgistrationScreen());
    } catch (e) {
   
    print("Error during sign up: $e");
  }
  }

