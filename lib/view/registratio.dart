import 'dart:developer';
import 'dart:io';
import 'package:dinnytable/controller/controllers/registration_controller.dart';
import 'package:dinnytable/controller/firebase/images.dart';
import 'package:dinnytable/view/add_document.dart';
import 'package:dinnytable/widget.dart/card.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

RxString imageurl = ''.obs;
XFile image = XFile('');
String downloadUrlImage = '';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegController regcontroller = Get.put(RegController());
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 245, 244),
        appBar: const CustomAppBar(
          title: "Registration",
          automaticallyImplyLeading: false,
        ),
        body: Obx(() {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: GestureDetector(
                      onTap: () => pickImage(),
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: const Color.fromARGB(255, 37, 72, 38),
                          ),
                        ),
                        child: imageurl == ''
                            ? const Center(
                                child: Text(
                                  'Add Image',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 11, 11, 11),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : Image.file(
                                File(imageurl.value),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.5,
                  ),
                  TextFieldWidgetD(
                      icon: const Icon(
                        Icons.restaurant,
                        color: Colors.white,
                      ),
                      labeltext: "Resturent Name",
                      controller: regcontroller.resturentName,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      
                      ),
                  sized10,
                  TextFieldWidgetD(
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labeltext: "Owner Name",
                      controller: regcontroller.ownerName,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      
                      ),
                  sized10,
                  TextFieldWidgetD(
                      icon: const Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      labeltext: "Address",
                      controller: regcontroller.address,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      
                       ),
                  sized10,
                  TextFieldWidgetD(
                      icon: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      labeltext: "City",
                      controller: regcontroller.city,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      
                      ),
                  sized10,
                  TextFieldWidgetD(
                      icon: const Icon(
                        Icons.airline_seat_legroom_normal_outlined,
                        color: Colors.white,
                      ),
                      labeltext: "Total Seat ",
                      controller: regcontroller.totalSeats,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      
                      ),
                  sized10,
                  TextFieldWidgetD(
                      icon: const Icon(
                        Icons.fastfood,
                        color: Colors.white,
                      ),
                      labeltext: "Type of Resturent",
                      controller: regcontroller.typeResturent,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      
                      ),
                  sized10,
                  TextFieldWidgetD(
                      icon: const Icon(
                        Icons.lock_clock,
                        color: Colors.white,
                      ),
                      labeltext: "Working hours",
                      controller: regcontroller.workHours,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                     
                      ),
                  sized10,
                
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              if (!validateFields(regcontroller)) {
                                return; 
                              }
                              await uploadImage(image, context);
                              Get.to(AddDocuments(
                                resturentName: regcontroller.resturentName.text,
                                ownerName: regcontroller.ownerName.text,
                                address: regcontroller.address.text,
                                city: regcontroller.city.text,
                                totalSeats: regcontroller.totalSeats.text,
                                typeResturent: regcontroller.typeResturent.text,
                                workHours: regcontroller.workHours.text,
                                imageUrls: downloadUrlImage,
                              ));
                              imageurl = ''.obs;
                              downloadUrlImage = '';
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(206, 4, 52, 29)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(200, 47)),
                            ),
                            child: const Text("Next >>"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    }

    try {
      imageurl.value = pickedFile.path;
      image = pickedFile;
      Get.find<RegistrationScreen>();
    } catch (e) {
      log('$e');
    }
  }
}
