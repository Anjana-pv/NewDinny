 import 'dart:io';

import 'package:dinnytable/controller/controllers/registration_controller.dart';
import 'package:dinnytable/view/registratio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
      print('Error uploading file: $e');
    }
  }
  bool validateFields(RegController regcontroller) {
  if (regcontroller.resturentName.text.isEmpty ||
      regcontroller.ownerName.text.isEmpty ||
      regcontroller.address.text.isEmpty ||
      regcontroller.city.text.isEmpty ||
      regcontroller.totalSeats.text.isEmpty ||
      regcontroller.typeResturent.text.isEmpty ||
      regcontroller.workHours.text.isEmpty ||
      imageurl.value.isEmpty) {
    // Display an error message if any field is empty
    Get.snackbar(
      'Error',
      'All fields must be filled and an image must be added.',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return false;
  }

  return true;
}
