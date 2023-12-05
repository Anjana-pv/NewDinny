import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/controllers/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Client_controller extends GetxController{

 TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController userController = TextEditingController();
 
 
  var loginlist =RxList<LoginModel>();
  final db =FirebaseFirestore.instance;


  Future<void> addContact() async {
    var client =  LoginModel(
     username: emailcontroller.text,
     password: passwordController.text,
     email: userController.text,

    );
    await db.collection("users").add(client.toJson()).whenComplete(() => ()=>printInfo(info: "contact Added"),);
    
  }

}