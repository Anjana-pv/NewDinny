
import 'package:dinnytable/screens/client_dart/login.dart';
import 'package:dinnytable/widget.dart/container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientHomescreen extends StatelessWidget {
  const ClientHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
        color: Colors.white, 
      ),
        title: const Text(
          "Home",style: TextStyle(color: Colors.white),
          ),
        
        centerTitle: true,
      backgroundColor: const Color.fromARGB(206, 4, 52, 29),
      actions: [
       IconButton(
          icon: const Icon(Icons.logout,color: Colors.white,),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.to(const LoginScreen());
          },
        ),
      ],
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Center(
                child: Container(
                  width: 300,
                  height: 300,

                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assest/image 8.png"))),
                ),
              ),
            ),
          
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(81, 150, 112, 0.411),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                 child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 50,
                    
                      child: smallContainer("Bookings",),
                  ),
                  Positioned(
                    top: 50,
                    right: 50,
                    child: smallContainer("Notification",),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 50,
                    child: smallContainer("Add Offers"),
                  ),
                  Positioned(
                    bottom: 50,
                    right: 50,
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
