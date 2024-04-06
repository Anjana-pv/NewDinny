 import 'dart:developer';
import 'dart:io';
import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/view/registratio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> uploadImage(XFile pickedFile, BuildContext context) async {
    try {
      String uniqueFilename = DateTime.now().millisecondsSinceEpoch.toString();
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('profileImg');
      Reference referenceImagetoupload =
          referenceDirImages.child(uniqueFilename);
      await referenceImagetoupload.putFile(
        File(pickedFile.path),
        SettableMetadata(contentType: 'image/jpeg'),
      );
      Get.dialog(
      const Dialog(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Uploading '),
            ],
          ),
        ),
      ),
    );
      downloadUrlImage = await referenceImagetoupload.getDownloadURL();
    } catch (e) {
      log('Error uploading file: $e');
    }
  }
  bool validateFields(Clientcontroller regcontroller) {
  if (
      imageurl.value.isEmpty) {
    
    Get.snackbar(
      'Error',
      'All fields must be filled and an image must be added.',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return false;
  }

  return true;
  }
Future<bool> shouldShowCard() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool cardAlreadyShown = prefs.getBool('cardAlreadyShown') ?? false;

  if (!cardAlreadyShown) {
    // If the card hasn't been shown, set the status to true
    prefs.setBool('cardAlreadyShown', true);
    return true;
  } else {
    return false;
  }
}
  