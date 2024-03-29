import 'dart:developer';
import 'dart:ui';
import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/models/client_reg_model.dart';
import 'package:dinnytable/view/add_document.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FrostedGlassScreen extends StatelessWidget {
  FrostedGlassScreen(
      {super.key,
      required this.resturentName,
      required this.ownerName,
      required this.address,
      required this.city,
      required this.totalSeats,
      required this.typeResturent,
      required this.imageUrls,
      required this.username,
      required this.password,
      required this.email,
      required this.endingTime,
      required this.startingtime});
  final String? resturentName;
  final String? ownerName;
  final String? address;
  final String? city;
  final String? totalSeats;
  final String? typeResturent;
  final String? imageUrls;
  final String? username;
  final String? password;
  final String? email;
  final String? startingtime;
  final String? endingTime;

  final Clientcontroller regcontroller = Get.put(Clientcontroller());

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> tableformKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assest/bgrud.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
            ),

            // Centered Card
            Form(
              key: tableformKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Card(
                    color: const Color.fromARGB(206, 4, 52, 29),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: 350,
                      height: 560,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "🍽️ To enhancing  dining experience! Could you share the number of tables at your place? ",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          sized10,
                          const Text(
                            "Your Total Seats are ",
                            style: TextStyle(color: Colors.white),
                          ),
                          sized20,
                          Tabletextfeild(
                            text: "Two-Top  :     \n (2 Seats) ",
                            controller: regcontroller.t1,
                          ),
                          sized30,
                          Tabletextfeild(
                              text: "Four-Top  :     \n (4 Seats) ",
                              controller: regcontroller.t2),
                          sized30,
                          Tabletextfeild(
                              text: "Six-Top    :      \n (6 Seats)",
                              controller: regcontroller.t3),
                          sized30,
                          Tabletextfeild(
                              text: "Twelve-Top :  \n (12 Seats)",
                              controller: regcontroller.t4),
                          sized30,
                          ElevatedButton(
                            onPressed: () async {
                              if (tableformKey.currentState?.validate() ??
                                  false) {
                                onSubmit();
                              }
                            },
                            child: const Text('Click me'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onSubmit() async {
    if (resturentName == null ||
        ownerName == null ||
        address == null ||
        city == null ||
        totalSeats == null ||
        typeResturent == null ||
        startingtime == null ||
        endingTime == null ||
        imageUrls == null ||
        cardUrls.isEmpty ||
        pdfUrls.value.isEmpty) {
      Get.snackbar(
        'Error',
        'All fields must be filled and documents must be added.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final clientData = ClientRegModel(
      restaurantName: resturentName!,
      owner: ownerName!,
      address: address!,
      city: city!,
      type: typeResturent!,
      seatCount: totalSeats!,
      profileImage: imageUrls!,
      pdf: pdfUrls.value,
      menuCards: cardUrls,
      username: username!,
      password: password!,
      email: email!,
      t1: regcontroller.t1.text,
      t2: regcontroller.t2.text,
      t3: regcontroller.t3.text,
      t4: regcontroller.t4.text,
      staringtime: startingtime!,
      endingTime: endingTime!,
    );
    log('$email');
    final bool response = await regcontroller.addContact(clientData);

    if (response) {
      Get.snackbar(
        'Success',
        'Registration successful!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      regcontroller.email.clear();
      regcontroller.password.clear();
      regcontroller.address.clear();
      regcontroller.city.clear();
      regcontroller.resturentName.clear();
      regcontroller.ownerName.clear();
      regcontroller.typeResturent.clear();
      regcontroller.totalSeats.clear();
      regcontroller.user.clear();

    
 Get.until((route) => Get.currentRoute == '/login');


       } else {
      Get.snackbar(
        'Error',
        'Registration failed. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
