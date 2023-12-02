
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/firebase/db_functions.dart';
import 'package:dinnytable/screens/client_dart/home_client.dart';
import 'package:dinnytable/screens/client_dart/registratio.dart';
import 'package:dinnytable/screens/client_dart/sign_upcard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


Future<void> login(String email, String password) async {
    try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
       if (querySnapshot.docs.isNotEmpty) {
        final DocumentSnapshot usersDoc = querySnapshot.docs.first;
        final String storedPassword = usersDoc.get("password"); 
        if (storedPassword == password) {
          Get.to(const ClientHomescreen());
            emailcontroller.clear();
          passwordController.clear();
        } 
      } else {
          log("Invalid email or password");
        }
    } catch (e) {
    log("Error during login: $e");
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
    Get.to(const RegistrationScreen());
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
    Get.to(const RegistrationScreen());
  } catch (e) {
    print("Error during sign up: $e");
  }
}


