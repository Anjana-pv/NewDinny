import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/controller/firebase/signin_auth.dart';
import 'package:dinnytable/view/demo.dart';
import 'package:dinnytable/view/home_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> login(String email, String password) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLogin = prefs.getBool('first_login') ?? true;
     
    if (isFirstLogin) {
     Get.to(FrostedGlassScreen());
      await prefs.setBool('first_login', false);
      return;
    }
    QuerySnapshot acceptedSnapshot = await FirebaseFirestore.instance
        .collection('approvedOne')
        .where('emailController', 
        isEqualTo: regcontroller.email.text)
        .where('passwordController',
       isEqualTo: regcontroller.password.text) 
        .get();

   
    if (acceptedSnapshot.docs.isNotEmpty) {
      Get.off(const ClientHomescreen());
      regcontroller.email.clear();
      regcontroller.password.clear();
      print(regcontroller.email.text);
      return;
    }
     QuerySnapshot rejectedSnapshot = await FirebaseFirestore.instance
        .collection('rejected')
        .where('emailController', 
        isEqualTo: email)
        .get();
 
  
  if (rejectedSnapshot.docs.isNotEmpty) {
      
      Get.snackbar(
        'Error',
        'Your request has been rejected by the admin.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    
    QuerySnapshot clientDetailSnapshot = await FirebaseFirestore.instance
        .collection('clientdetail')
        .where('emailController', isEqualTo: email)
        .get();

    if (clientDetailSnapshot.docs.isNotEmpty) {
     
      Get.snackbar(
        'Information',
        'Your request is pending. Please wait for admin approval.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.yellow,
        colorText: Colors.black,
      );
      return;
    }

     Get.snackbar(
      'Error',
      'Invalid email or password',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
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


