import 'dart:developer';

import 'package:dinnytable/controller/controllers/splash_controler.dart';
import 'package:dinnytable/view/home_client.dart';
import 'package:dinnytable/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 59, 21),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1000),
              builder: (BuildContext context, double opacity, Widget? child) {
                return Opacity(
                  opacity: opacity,
                  child: Image.asset('assest/text.png'),
                );
              },
              onEnd: () async {
                final isLoggedIn = await splashController.checkLoginStatus();
                if (isLoggedIn) {
                  Get.to(const ClientHomescreen());
                } else {
                  Get.to(const LoginScreen());
                }
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

  // Future navigationhome() async {
  //   await Future.delayed(const Duration(milliseconds: 1500), () {});
  //   Get.toNamed('ClientHomescreen');
  // }

