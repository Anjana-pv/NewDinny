import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/models/registration_model.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegController extends GetxController {
  TextEditingController resturentName = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController workHours = TextEditingController();
  TextEditingController totalSeats = TextEditingController();
  TextEditingController typeResturent = TextEditingController();
  
  File? imageFile;

  var reglist = RxList<RegModel>();
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  

  Future<void> creatregistration()async{
   var regdata=RegModel(
    resturentName: resturentName.text.trim(), 
    ownerName: ownerName.text.trim(), 
    address: address.text.trim(), 
    pincode: pincode.text.trim(), 
    totalSeats: totalSeats.text.trim(),
     typeResturent: typeResturent.text.trim(),
      workHours: workHours.text.trim(), 
      imageUrls: null,
       documentPDFUrl: " ",
        imageUrl: " ");
    
       await db.collection("registrationData").add(regdata.toJson()).whenComplete(()=>printInfo(info: "Created data"),);
   

  }
  Future<void>readata()async{
    var gettingdata= await db.collection("registrationData").get();
    for(var regdata in gettingdata.docs){
      reglist.add(RegModel.fromJson(regdata.data()));
    }
  }
}