import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/models/client_reg_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';





class Clientcontroller extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController resturentName = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController workHours = TextEditingController();
  TextEditingController totalSeats = TextEditingController();
  TextEditingController typeResturent = TextEditingController();
 
  File? imageFile;

  var loginlist = RxList<ClientRegModel>();
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  RxBool obscureText = true.obs;

  Future<bool> addContact(ClientRegModel clientinfo) async {
    Map<String, dynamic> clietRegMap = {
      "emailController": clientinfo.email,
      "passwordController": clientinfo.password,
      "userController": clientinfo.username,
      'restaurantName': clientinfo.restaurantName,
      'owner': clientinfo.owner,
      'address': clientinfo.address,
      'city': clientinfo.city,
      'type': clientinfo.type,
      'seatCount': clientinfo.seatCount,
      'workingHours': clientinfo.workingHours,
      'profileImage': clientinfo.profileImage,
      'pdf': clientinfo.pdf,
      'menuCards': clientinfo.menuCards,
       'two':clientinfo.t1,
      'four':clientinfo.t2,
      'six':clientinfo.t3,
      'twelve':clientinfo.t4
    };
    try {
      await FirebaseFirestore.instance
          .collection('clientdetail')
          .doc()
          .set(clietRegMap);
      return true;
    } catch (e) {
      return false;
    }
  }

  isUsernameTaken(String trim) {}

  isEmailTaken(String email) {}

  void togglePasswordVisibility() {
    obscureText.toggle();
  }

Future<bool> addtable(Tablemodel tabledata) async {
    Map<String, dynamic> tablemodel = {
     
     
    };
    try {
      await FirebaseFirestore.instance
          .collection('approvedOne')
          .doc()
          .set(tablemodel);
      return true;
    } catch (e) {
      return false;
    }
  }


 Future <void> getdatas()async{
  
 }



  Future<void> updateContact(String documentId, ClientRegModel updatedData) async {
    Map<String, dynamic> updatedMap = {
      "emailController": updatedData.email,
      "passwordController": updatedData.password,
      "userController": updatedData.username,
      'restaurantName': updatedData.restaurantName,
      'owner': updatedData.owner,
      'address': updatedData.address,
      'city': updatedData.city,
      'type': updatedData.type,
      'seatCount': updatedData.seatCount,
      'workingHours': updatedData.workingHours,
      'profileImage': updatedData.profileImage,
      'pdf': updatedData.pdf,
      'menuCards': updatedData.menuCards,
      'two': updatedData.t1,
      'four': updatedData.t2,
      'six': updatedData.t3,
      'twelve': updatedData.t4
    };

    try {
      await FirebaseFirestore.instance
          .collection('approvedOne')
          .doc(documentId) // Provide the document ID you want to update
          .update(updatedMap);
      print('Document updated successfully');
    } catch (e) {
      print('Error updating document: $e');
    }
  }


}




