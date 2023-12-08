import 'dart:io';

import 'package:dinnytable/controllers/registration_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

RegController regcontroller = Get.put(RegController());

Future<void> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    regcontroller.imageFile = File(pickedFile.path);
    regcontroller.update();
  }

}

  