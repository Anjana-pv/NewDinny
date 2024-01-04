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
}
