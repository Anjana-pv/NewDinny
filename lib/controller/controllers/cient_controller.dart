import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/models/client_reg_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Clientcontroller extends GetxController{

 TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController userController = TextEditingController();
 
  var loginlist =RxList<Clientuser>();
  final db =FirebaseFirestore.instance;

  Future<bool> addContact(Clientuser clientinfo) async {
    Map<String, dynamic> clietRegMap = {
      "emailController":clientinfo.email,
      "passwordController":clientinfo.password,
      "userController":clientinfo.username,

    };
    try {
      await FirebaseFirestore.instance
          .collection('userinfo')
          .doc()
          .set(clietRegMap);
          return true;
    } catch (e) {
      return false; 
    }
  }

  isUsernameTaken(String trim) {}

}