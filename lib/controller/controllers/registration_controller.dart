
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/models/client_reg_model.dart';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class RegController extends GetxController {
  TextEditingController resturentName = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController workHours = TextEditingController();
  TextEditingController totalSeats = TextEditingController();
  TextEditingController typeResturent = TextEditingController();

  File? imageFile;

  var reglist = RxList<ClientRegModel>();
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  Future<bool> creatregistration(ClientRegModel clientData) async {
    Map<String, dynamic> clietRegMap = {
      'restaurantName': clientData.restaurantName,
      'owner': clientData.owner,
      'address': clientData.address,
      'city': clientData.city,
      'type': clientData.type,
      'seatCount': clientData.seatCount,
      'workingHours': clientData.workingHours,
      'profileImage': clientData.profileImage,
      'pdf': clientData.pdf,
      'menuCards': clientData.menuCards,
    };
    try {
      await FirebaseFirestore.instance
          .collection('clients')
          .doc()
          .set(clietRegMap);
          return true;
    } catch (e) {
      return false; 
    }
  }

  
}

Future<void> pickAndUploadPdf(RxString pdfUrls) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );

  if (result != null) {
    File pdfFile = File(result.files.single.path!);
    await uploadPdf(pdfFile, pdfUrls);
  }
}

Future<void> uploadPdf(File pdfFile, RxString pdf) async {
  try {
    final storage = FirebaseStorage.instance;
    String fileName = basename(pdfFile.path);
    Reference storageReference = storage.ref().child('pdfs/$fileName');
    final uploadImage = await storageReference.putFile(pdfFile);
    pdf.value = await storageReference.getDownloadURL();
    print('PDF uploaded successfully');
  } catch (e) {
    print('Error uploading PDF: $e');
  }
}

Future<void> pickImagesAndUpload(RxList cardUrls) async {
  List<File> pickedImages = [];

  final picker = ImagePicker();
  final pickedFileList = await picker.pickMultiImage();

  if (pickedFileList != null) {
    pickedImages =
        pickedFileList.map((pickedFile) => File(pickedFile.path)).toList();
    uploadImages(pickedImages, cardUrls);
  }
}

Future<void> uploadImages(List<File> imgFiles, RxList cardUrls) async {
  try {
    final storage = FirebaseStorage.instance;

    for (File imgFile in imgFiles) {
      String fileName = basename(imgFile.path);
      Reference storageReference = storage.ref().child('menuCards/$fileName');
      await storageReference.putFile(imgFile);
      cardUrls.add(await storageReference.getDownloadURL());
    }

    print('Images uploaded successfully');
  } catch (e) {
    print('Error uploading images: $e');
  }
}
