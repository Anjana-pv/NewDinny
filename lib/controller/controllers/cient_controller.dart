
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/models/client_reg_model.dart';
import 'package:dinnytable/view/splash_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Clientcontroller extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController resturentName = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController totalSeats = TextEditingController();
  TextEditingController typeResturent = TextEditingController();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();

  File? imageFile;

  var loginlist = RxList<ClientRegModel>();
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  RxBool obscureText = true.obs;

  

  @override
  void onInit() {
    super.onInit();
    fetchDatas();
  }

  Future<bool> addContact(ClientRegModel clientinfo) async {
    Map<String, dynamic> clietRegMap = {
      "email": clientinfo.email,
      "password": clientinfo.password,
      "username": clientinfo.username,
      'restaurantName': clientinfo.restaurantName,
      'owner': clientinfo.owner,
      'address': clientinfo.address,
      'city': clientinfo.city,
      'type': clientinfo.type,
      'seatCount': clientinfo.seatCount,
      'startingtime': clientinfo.staringtime,
      'endingtime': clientinfo.endingTime,
      'profileImage': clientinfo.profileImage,
      'pdf': clientinfo.pdf,
      'menuCards': clientinfo.menuCards,
      't1': clientinfo.t1,
      't2': clientinfo.t2,
      't3': clientinfo.t3,
      't4': clientinfo.t4
    };
    try {
      await FirebaseFirestore.instance
          .collection('clientdetail')
          .doc()
          .set(clietRegMap);
final SharedPreferences pref =await SharedPreferences.getInstance();
   pref.setBool("isLogined",true );
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
    Map<String, dynamic> tablemodel = {};
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


  Future<void> updateContact(
      String documentId, ClientRegModel updatedData) async {
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
      'startingtime': updatedData.staringtime,
      'endingtime': updatedData.endingTime,
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
          .doc(documentId)
          .update(updatedMap);
      print('Document updated successfully');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

 Future<void> fetchDatas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     final id = prefs.getString('resturent_id');
     log("$id");

    
  }
  Future<void> deleteUser() async {
    SharedPreferences getuserId = await SharedPreferences.getInstance();
    final userId = getuserId.getString('resturent_id');

    try {
      await FirebaseFirestore.instance.collection('approvedOne').doc(userId).delete();
    } catch (error) {
      log('Error deleting user: $error');
    }
  }
  Future<void> logout() async {
    SharedPreferences prefsId = await SharedPreferences.getInstance();
    await prefsId.setBool('isLogined', false);
    Get.offAll(SplashScreen());
  }

}
