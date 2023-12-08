import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/models/registration_model.dart';
import 'package:file_picker/file_picker.dart';
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
   List<File?> menuImages = [];
  File? documentPDF;
  File? imageFile;

  var reglist = RxList<RegModel>();
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  Future<void> addReg() async {
    if (imageFile == null || menuImages.isEmpty || documentPDF == null) {
      print("Please select an image, at least one menu image, and a document PDF.");
      return;
    }
final restaurantImageRef =
        storage.ref().child('registration_images/${DateTime.now()}_restaurant.jpg');
    await restaurantImageRef.putFile(imageFile!);
    final String restaurantImageUrl = await restaurantImageRef.getDownloadURL();
    
 final menuImageUrls = await uploadImages(menuImages);
    final String documentPDFUrl = await uploadDocumentPDF(documentPDF);

    var clientReg = RegModel(
      resturentName: resturentName.text.trim(),
      ownerName: ownerName.text.trim(),
      address: address.text.trim(),
      pincode: pincode.text.trim(),
      totalSeats: totalSeats.text.trim(),
      typeResturent: typeResturent.text.trim(),
      workHours: workHours.text.trim(),
        imageUrls: [restaurantImageUrl, ...menuImageUrls],
      documentPDFUrl: documentPDFUrl, imageUrl: '',
    );

    await db
        .collection("RegistrarionForm")
        .add(clientReg.toJson())
        .whenComplete(
          () => () => printInfo(info: "Sbmitted"),
        );
    reset();
  }

Future<List<String>> uploadImages(List<File?> images) async {
    List<String> imageUrls = [];

    for (File? imageFile in images) {
      final imageRef =
          storage.ref().child('registration_images/${DateTime.now()}_menu.jpg');
      await imageRef.putFile(imageFile!);
      imageUrls.add(await imageRef.getDownloadURL());
    }

    return imageUrls;
  }

  Future<String> uploadDocumentPDF(File? pdfFile) async {
    final pdfRef =
        storage.ref().child('registration_documents/${DateTime.now()}_document.pdf');
    await pdfRef.putFile(pdfFile!);
    return pdfRef.getDownloadURL();
  }
  



  reset() {
    resturentName.text = " ";
    ownerName.text = " ";
    address.text = " ";
    pincode.text = " ";
    totalSeats.text = " ";
    typeResturent.text = " ";
    workHours.text;
    imageFile = null;
    menuImages.clear();
    documentPDF = null;
  }

}