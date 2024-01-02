import 'package:dinnytable/controller/firebase/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool validateForm() {
  bool isValid = true;

  if (clientcontroller.userController.text.isEmpty) {
    Get.snackbar(
      'Error',
      'Please enter your username.',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    isValid = false;
  }

  if (clientcontroller.emailController.text.isEmpty) {
    Get.snackbar(
      'Error',
      'Please enter your email.',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    isValid = false;
  }

  if (clientcontroller.passwordController.text.isEmpty) {
    Get.snackbar(
      'Error',
      'Please enter your password.',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    isValid = false;
  }

  return isValid;
}
