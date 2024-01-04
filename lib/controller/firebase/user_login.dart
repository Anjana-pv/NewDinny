import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/controller/firebase/signin_auth.dart';
import 'package:dinnytable/view/home_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> login(String email, String password) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('clientdetail')
        .where('emailController',
         isEqualTo: regcontroller.email.text )
        .get();
     
    if (querySnapshot.docs.isNotEmpty) {
      final DocumentSnapshot usersDoc = querySnapshot.docs.first;
      final String storedPassword = usersDoc.get("passwordController");
      log(password);
      log(storedPassword);

      if (storedPassword == password) {
      Get.off(const ClientHomescreen());
      
        regcontroller.email.clear();
        regcontroller.password.clear();
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