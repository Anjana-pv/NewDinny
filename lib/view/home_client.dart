import 'package:dinnytable/view/booking_screen.dart';
import 'package:dinnytable/view/demo.dart';
import 'package:dinnytable/widget.dart/container.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientHomescreen extends StatelessWidget {
  const ClientHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
        color: Colors.white, 
         ),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
          ),
        leading: IconButton(
          icon: const Icon(Icons.menu,color: Colors.white,),
            onPressed: () async {
              // await FirebaseAuth.instance.signOut();
              // Get.to(LoginScreen());
          },
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
                        onTap: (){
                          Get.to( FrostedGlassScreen());
                        },
                  child: smallContainer("Bookings",)),
                  ),
                  Positioned(
                    top: 30,
                    right: 30,
                    child: smallContainer("Notification",),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 30,
                    child: smallContainer("Add Offers"),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 30,
                    child: smallContainer("Cancel"),
 
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
}
