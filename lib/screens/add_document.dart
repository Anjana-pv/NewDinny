// ignore_for_file: invalid_use_of_protected_member

import 'package:dinnytable/controllers/registration_controller.dart';
import 'package:dinnytable/models/client_reg_model.dart';
import 'package:dinnytable/widget.dart/card.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxList cardUrls = [].obs;
RxString pdfUrls = ''.obs;

class AddDocuments extends StatelessWidget {
  const AddDocuments({
    super.key,
    required this.resturentName,
    required this.ownerName,
    required this.address,
    required this.pincode,
    required this.totalSeats,
    required this.typeResturent,
    required this.workHours,
    required this.imageUrls,
  });

  final String? resturentName;
  final String? ownerName;
  final String? address;
  final String? pincode;
  final String? workHours;
  final String? totalSeats;
  final String? typeResturent;
  final String? imageUrls;

  @override
  Widget build(BuildContext context) {
    RegController regcontroller = Get.put(RegController());
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Add Documents",
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assest/vector-folder-icon-removebg-preview.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              sized20,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => pickImagesAndUpload(cardUrls),
                      child: Container(
                        width: 400,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(117, 149, 171, 157),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Add Cards",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sized10,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => pickAndUploadPdf(pdfUrls),
                      child: Container(
                        width: 400,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(117, 149, 171, 157),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Add documents",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sized30,
              ElevatedButton(
                onPressed: () async {
                  onSubmit(regcontroller);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(206, 4, 52, 29)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 50.5)),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onSubmit(RegController controller) async {
   final clientData= ClientRegModel(
        restaurantName: resturentName ?? '',
        owner: ownerName ?? '',
        address: address ?? '',
        pinCode: pincode ?? '',
        type: typeResturent ?? '',
        seatCount: int.parse(totalSeats ?? '0'),
        workingHours: int.parse(workHours ?? '0'),
        profileImage: imageUrls ?? '',
        pdf: pdfUrls.value,
        menuCards: cardUrls.value);
       final bool responce= await controller.creatregistration(clientData);
  }

}
