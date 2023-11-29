import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:dinnytable/screens/user_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Optional_screen extends StatelessWidget {
  const Optional_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 60),
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assest/hotel.gif"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
         sized30,
          Padding(
            padding: const EdgeInsets.only(top:50),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to( LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, 
                    backgroundColor: const Color.fromARGB(255, 34, 65, 35), 
                    fixedSize: const Size(100, 40), 
                  ),
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
