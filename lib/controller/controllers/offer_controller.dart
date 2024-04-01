import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfferController extends GetxController {
  String imageUrl = '';
  RxInt currectIndex = 0 .obs;


  void onItemTapped(int index) {
   
      currectIndex.value = index;
    
  }

  Future <bool>uploadImage(String imageUrl) async {
    try {
      final storage = FirebaseStorage.instance;
      String fileName = basename(imageUrl);
      Reference storageReference = storage.ref().child('OfferImage/$fileName');
      TaskSnapshot uploadTask = await storageReference.putFile(File(imageUrl));
      String downloadUrl = await uploadTask.ref.getDownloadURL();
      final response = await addpicture(downloadUrl);
      if (response) {
        log( 'Saved Successfully');
        return true;
       
      } else {
        log('Please Check your internet connection');
        return false ;
            }
    } catch (e) {
      log( 'Please Check your internet connection'); 
      return false;
     
    }
  }

  Future<bool> addtable(String imageurl) async {
    SharedPreferences restruentPrefs = await SharedPreferences.getInstance();
    String resturentId = restruentPrefs.getString('resturent_id').toString();

    Map<String, dynamic> offerMap = {'imageUrl': imageurl};
    try {
      FirebaseFirestore.instance
          .collection('approvedOne')
          .doc(resturentId)
          .collection('offerding')
          .add(offerMap);

      return true;
    } catch (e) {
      return false;
    }
  }
Future<bool> addpicture(String imageurl) async {
    SharedPreferences restruentPrefs = await SharedPreferences.getInstance();
    String resturentId = restruentPrefs.getString('resturent_id').toString();

    Map<String, dynamic> offerMap = {'imageUrl': imageurl};
    try {
      FirebaseFirestore.instance
          .collection('offers')
          .doc(resturentId)
          .set(offerMap);
          

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
      imageUrl = pickedFile.path;
    update();
    } catch (e) {
      log('$e');
    }
  }

Future<void> addImageToFirebase() async {
  if (imageUrl.isEmpty) {
    return;
  }

  final bool response = await uploadImage(imageUrl);
  if (response) {
    Get.snackbar('Success', 'Image uploaded successfully',);
    Get.back();
  } else {
    Get.snackbar('Error', 'Failed to upload image');
  }
}

}
