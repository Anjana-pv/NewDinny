import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddOfferBottomSheet extends StatelessWidget {
 const AddOfferBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
      // final OfferController offer = Get.find<OfferController>();

    return SizedBox(
      height: 400,
      child: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 37, 72, 38),
                  ),
                ),
            
              ),
             ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    }

  try {
  //  offer.imageurl.value = pickedFile.path;
  // offer.image= pickedFile;
    } catch (e) {
      log('$e');
    }
  print("");
  
  }
}