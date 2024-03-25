import 'dart:developer';
import 'dart:io';
import 'package:dinnytable/controller/controllers/offer_controller.dart';
import 'package:dinnytable/view/cancel_screen.dart';
import 'package:dinnytable/view/menu_scree.dart';
import 'package:dinnytable/view/booking_screen.dart';
import 'package:dinnytable/view/profile.dart';
import 'package:dinnytable/widget.dart/container.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

RxString imageurl = ''.obs;
XFile image = XFile('');
String downloadUrlImage = '';

class ClientHomescreen extends StatelessWidget {
  const ClientHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    OfferController offerInstance = Get.put(OfferController());
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(206, 4, 52, 29),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Center(
                child: Container(
                  width: 270,
                  height: 270,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assest/image 8.png"))),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            sized50,
            Stack(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(81, 150, 112, 0.411),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 30,
                        left: 30,
                        child: InkWell(
                            onTap: () {
                              Get.to(() => const BookingScreen());
                            },
                            child: smallContainer(
                              "Bookings",
                            )),
                      ),
                      Positioned(
                        top: 30,
                        right: 30,
                        child: InkWell(
                        onTap: (){
                          Get.to(()=>const ProfileScreen());
                          },
                          child: smallContainer(
                            "Profile",
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 30,
                        child: InkWell(
                            child: smallContainer("Add Offers"),
                            onTap: () => showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 400,
                                      child: Center(
                                          child: Obx(
                                        () => Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              width: 250,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 37, 72, 38),
                                                ),
                                              ),
                                              child: imageurl .isEmpty
                                                  ? const Center(
                                                      child: Text(
                                                        'Add Image',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 11, 11, 11),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      width: double.infinity,
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 37, 72, 38),
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        child: Image.file(
                                                          File(imageurl.value),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 18.0),
                                                  child: ElevatedButton.icon(
                                                      icon: const Icon(
                                                          Icons.save),
                                                      label: const Text('Save'),
                                                      onPressed: () async {
                                                        final bool response =
                                                            await offerInstance
                                                                .uploadImage(
                                                                    imageurl
                                                                        .value)
                                                                .then((value) {
                                                          Get.back();
                                                          return value;
                                                        });
                                                        if (response) {
                                                          Get.snackbar(
                                                              'Success',
                                                              'Success');
                                                        } else {
                                                          Get.snackbar('Error',
                                                              'Please Check your internet connection');
                                                        }
                                                      }),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 18.0),
                                                  child: ElevatedButton.icon(
                                                    icon: const Icon(Icons.add),
                                                    label: Text(imageurl == ''
                                                        ? 'Add Offer Card'
                                                        : 'update card'),
                                                    onPressed: () =>
                                                        pickImage(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                    );
                                  },
                                )),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 30,
                        child: InkWell(
                          onTap: (){
                            Get.to(CancelScreen());
                          },
                          child: smallContainer("Cancelled \n     Data")),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
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
      Get.find<ClientHomescreen>();
    } catch (e) {
      log('$e');
    }
  }
}
