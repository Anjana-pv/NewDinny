import 'dart:developer';
import 'package:dinnytable/controller/controllers/booking_controller.dart';
import 'package:dinnytable/controller/controllers/offer_controller.dart';
import 'package:dinnytable/controller/controllers/profile_controller.dart';
import 'package:dinnytable/view/booking_widget.dart';
import 'package:dinnytable/view/home_widget.dart';
import 'package:dinnytable/view/menu_scree.dart';
import 'package:dinnytable/view/profile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

RxString imageurl = ''.obs;
XFile image = XFile('');
String downloadUrlImage = '';
List<String> headings = ['Home', 'Bookings', 'Profile'];

class ClientHomescreen extends StatelessWidget {
  const ClientHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OfferController offer = Get.put(OfferController());

    BookingController bookings = Get.put(BookingController());
    ProfileController profileInstance = Get.put(ProfileController());

    return Obx(() => Scaffold(
          drawer:offer.currectIndex.value==0? const NavBar():null, 
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              offer.currectIndex.value == 0
                  ? headings.first
                  : offer.currectIndex.value == 1
                      ? headings[1]
                      : headings.last,
              style: const TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(206, 4, 52, 29),
          ),
          body: StreamBuilder(
              stream: bookings.bookingStream.value,
              builder: (context, bookingSnap) {
                if (bookingSnap.hasData) {
                  return StreamBuilder(
                      stream: profileInstance.profileStream.value,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Widget> widgetOptions = [
                            const HomeWidget(),
                            BookingsWidget(snapshot: bookingSnap),
                            ProfileWidget(snapshot: snapshot),
                          ];
                          return widgetOptions
                              .elementAt(offer.currectIndex.value);
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox(
                            child: Center(
                              child: CircularProgressIndicator(
                                  color: Colors.green),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const SizedBox(
                            child:
                                Text('Please Check your internet connection'),
                          );
                        }
                      });
                }
                if (bookingSnap.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    ),
                  );
                } else if (bookingSnap.hasError) {
                  return Text('Error: ${bookingSnap.error}');
                } else {
                  return const SizedBox(
                    child: Text('Please Check your internet connection'),
                  );
                }
              }),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            currentIndex: offer.currectIndex.value,
            selectedItemColor: Colors.amber[800],
            onTap: offer.onItemTapped,
          ),
        ));
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
