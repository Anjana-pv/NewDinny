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
  void dispose() {
     emailcontroller.dispose();
     passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 110, left: 20),
            child: Text(
              "Create an Account",
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
            ),
          ),
          sized30,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             reusableTextfeild("Email", Icons.mail, false, emailcontroller,),

            ],
          ),
          sized10,
          customTextField("Password", Icons.lock, true, passwordController,),
          sized30,sized20,
          buttonclik(context,"Sign Up",  const ResgistrationScreen()),
          sized20,sized30,
          const Text("Or"),
         
          sized20,
          GestureDetector(
            onTap: (){
          
          signinggogle();
            },
            child: Container(
              width: 300,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),

              ),
              child: const Center(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.google,color: Colors.white,),
                    SizedBox(width:5),
                    Text("SignUp with Google")
                  ],
                )
                )
              ),
            ),
        ],
      ),
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
  } catch (e) {
    
    print("Error signing in with Google: $e");
  }

  Future signup() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text.trim(),
       password: passwordController.text.trim());
  }
}

  




  