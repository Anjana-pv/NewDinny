import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class OfferController extends GetxController {

  RxList<String> imageUrls = <String>[].obs;
  RxInt currectIndex = 0.obs;

   void onItemTapped(int index) {
   
      currectIndex.value = index;
    
  }


  Future<bool> uploadImage(String imageUrl) async {
    try {
      final storage = FirebaseStorage.instance;
      String fileName = basename(imageUrl);
      Reference storageReference =
          storage.ref().child('OfferImage/$fileName');
      TaskSnapshot uploadTask =
          await storageReference.putFile(File(imageUrl));
      String downloadUrl = await uploadTask.ref.getDownloadURL();
      final response = await addpicture(downloadUrl);
      if (response) {  
        log('Saved Successfully');
        return true;
      } else {
        log('Please Check your internet connection');
        return false;
      }
    } catch (e) {
      log('Please Check your internet connection');
      return false;
    }
  }

  Future<bool> addpicture(String imageurl) async {
    

    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('offers')
          .doc('cXxWMZArE1eBlkDXwx09') 
          .get();

      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    List<dynamic> currentImages = data['imageUrls'] ?? [];
    currentImages.add(imageurl);

      await FirebaseFirestore.instance
          .collection('offers')
          .doc('cXxWMZArE1eBlkDXwx09')
          .update({'imageUrls': currentImages});

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    }

    try {
      String imageUrl = pickedFile.path;
      imageUrls.add(imageUrl);
      update();
    } catch (e) {
      log('$e');
    }
  }

  Future<bool> addImageToFirebase() async {
    if (imageUrls.isEmpty) {
      return false;
    }

    final bool response = await uploadImage(imageUrls.last);
    if (response) {
      Get.snackbar('Success', 'Image uploaded successfully');
      return true;
      
    } else {
      Get.snackbar('Error', 'Failed to upload image');
      return false;
    }
  }
}
