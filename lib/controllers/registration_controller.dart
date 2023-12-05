import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/controllers/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegController extends GetxController{



TextEditingController resturentName = TextEditingController();
   TextEditingController ownerName = TextEditingController();
   TextEditingController address = TextEditingController();
   TextEditingController pincode = TextEditingController();
   TextEditingController workHours = TextEditingController();
   TextEditingController totalSeats = TextEditingController();
   TextEditingController typeResturent =TextEditingController();

var reglist =RxList<RegModel>();
  final db =FirebaseFirestore.instance;



  Future<void> addReg() async {
    var clientReg = RegModel(

  resturentName :resturentName.text,
  ownerName:ownerName.text,
  address:address.text,
  pincode:pincode.text,
  totalSeats:totalSeats.text,
  typeResturent:typeResturent.text,
  workHours:workHours.text,  
    );
    
    await db.collection("RegistrarionForm").add(clientReg.toJson()).whenComplete(() => ()=>printInfo(info: "Sbmitted"),);
    
  }

}


