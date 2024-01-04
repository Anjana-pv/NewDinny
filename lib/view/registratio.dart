import 'dart:developer';
import 'dart:io';
import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/controller/firebase/add_images.dart';
import 'package:dinnytable/view/add_document.dart';
import 'package:dinnytable/widget.dart/card.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

RxString imageurl = ''.obs;
XFile image = XFile('');
String downloadUrlImage = '';
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({
    required this.username,
     required this.password,
     required this.email,
    super.key,
   
  });
   final String?username;
    final String?password;
    final String?email;

  @override
  Widget build(BuildContext context) {
   Clientcontroller regcontroller = Get.put(Clientcontroller());
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 245, 244),
        appBar: const CustomAppBar(
          title: "Registration",
          automaticallyImplyLeading: false,
        ),
        body:
         Obx(() {
          return SingleChildScrollView(
            child: Form(
            key: _formKey,
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
                          borderRadius: BorderRadius.circular(0.0),
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
                  Customtextfeild(
                    controller: regcontroller.resturentName, 
                    hintText: 'Resturent name',
                     icon:const Icon (Icons.restaurant_menu_outlined),
                      obscureText: false, 
                      keyboardType: TextInputType.name),     
                  sized10,
                  Customtextfeild(
                    controller: regcontroller.ownerName, 
                    hintText: 'Owner name',
                     icon:const Icon (Icons.person),
                      obscureText: false,
                       keyboardType:TextInputType.text),
                  sized10,
                   Customtextfeild(
                    controller: regcontroller.address, 
                    hintText: 'Address',
                     icon:const Icon (Icons.location_city_outlined),
                      obscureText: false,
                       keyboardType: TextInputType.multiline),
                  sized10,
                   Customtextfeild(
                    controller: regcontroller.city, 
                    hintText: 'City',
                     icon:const Icon (Icons.location_on),
                      obscureText: false,
                       keyboardType: TextInputType.text),
                    
                  sized10,
                   Customtextfeild(
                    controller: regcontroller.totalSeats, 
                    hintText: 'Total Seats',
                     icon:const Icon (Icons.airline_seat_legroom_reduced_sharp),
                      obscureText: false,
                       keyboardType: TextInputType.number),
                      
                  sized10,
                  Customtextfeild(
                    controller: regcontroller.typeResturent, 
                    hintText: 'Type of Resturent',
                     icon:const Icon (Icons.fastfood_rounded),
                      obscureText: false,
                       keyboardType: TextInputType.text),
                  sized10,
                  Customtextfeild(
                    controller: regcontroller.workHours, 
                    hintText: 'Working Hours',
                     icon:const Icon (Icons.av_timer),
                      obscureText: false,
                       keyboardType: TextInputType.phone),
                  sized10,
                
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                               if (_formKey.currentState?.validate() ?? false){
                              if (!validateFields(regcontroller)) {
                                return; 
                              }
                              await uploadImage(image, context);
                              Get.to(AddDocuments(
                                username: regcontroller.user.text,
                                password: regcontroller.password.text,
                                email: regcontroller.email.text,
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
                               }
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
            )
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
bool validateFields(Clientcontroller regcontroller) {
  if (regcontroller.resturentName.text.isEmpty ||
      regcontroller.ownerName.text.isEmpty ||
      regcontroller.address.text.isEmpty ||
      regcontroller.city.text.isEmpty ||
      regcontroller.totalSeats.text.isEmpty ||
      regcontroller.typeResturent.text.isEmpty ||
      regcontroller.workHours.text.isEmpty) {
  
    Get.snackbar(
      'Error',
      'Please fill in all fields.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return false;
  }
  return true;
}

