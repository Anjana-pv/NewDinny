import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/models/client_reg_model.dart';
import 'package:dinnytable/view/home_client.dart';
import 'package:dinnytable/view/registratio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

Clientcontroller clientcontroller = Get.put(Clientcontroller());

Future<void> login(String email, String password) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('userinfo')
        .where('emailController', isEqualTo: clientcontroller.emailController.text )
        .get();
     
    if (querySnapshot.docs.isNotEmpty) {
      final DocumentSnapshot usersDoc = querySnapshot.docs.first;
      final String storedPassword = usersDoc.get("passwordController");
      log(password);
      log(storedPassword);

      if (storedPassword == password) {
      Get.off(const ClientHomescreen());
        clientcontroller.emailController.clear();
        clientcontroller.passwordController.clear();
        return;
      } else {
        Get.snackbar(
          'Error',
          'Invalid email or password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Invalid email or password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  } catch (e) {
    log("Error during login: $e");
    Get.snackbar(
      'Error',
      'An unexpected error occurred. Please try again.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
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
    Get.to(const RegistrationScreen());
    clientcontroller.emailController.clear();
  } catch (e) {
    print("Error signing in with Google: $e");
  }
}

Future<void> signup() async {
  try {

    String email = clientcontroller.emailController.text.trim();
    String password = clientcontroller.passwordController.text.trim();
     String username = clientcontroller.userController.text.trim();

    
    bool? isUsernameTaken = await clientcontroller.isUsernameTaken(username);

    if (isUsernameTaken != null && isUsernameTaken) {
      print("Username is already taken. Please choose a different username.");
     return;
    }


    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

  
    User? user = FirebaseAuth.instance.currentUser;
    await user?.updateDisplayName(username);

   
    await clientcontroller.addContact(Clientuser(
      email: email,
      password: password,
       username: username,
    ));

     clientcontroller.emailController.clear();
    clientcontroller.passwordController.clear();
    clientcontroller.userController.clear();

  
    print("Signup successful!");
  } catch (e) {
    print("Error during sign up: $e");
   
    print("Signup failed. Please try again.");
  }
}
