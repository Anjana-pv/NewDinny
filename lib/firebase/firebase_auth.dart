import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/screens/client_dart/home_client.dart';
import 'package:dinnytable/screens/client_dart/sign_upcard.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
        
        print("Invalid email or password");
       
      }
    } catch (e) {
      print("Error during login: $e");
    }
  }

