import 'dart:io';
import 'package:dinnytable/controller/controllers/offer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddOfferBottomSheet extends StatelessWidget {
 const  AddOfferBottomSheet({super.key});


  @override
  Widget build(BuildContext context) {
   final OfferController offerController = Get.find<OfferController>();   

    return SizedBox(
      height: 400,
      child: Center(
        child: Column(
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
             child: offerController.imageUrl.isEmpty
                  ? const Center(
                      child: Text(
                        'Add Image',
                        style: TextStyle(
                          color: Color.fromARGB(255, 11, 11, 11),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 37, 72, 38),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.file(
                          File(offerController.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Save'),
                    onPressed: () async {
                      await offerController.addImageToFirebase();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Image'),
                    onPressed: () {
                      offerController.pickImage();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
