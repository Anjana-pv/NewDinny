import 'package:dinnytable/view/home_client.dart';
import 'package:dinnytable/view/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 4), () {
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLogined') ?? false;
    if (isLoggedIn) {
      Get.to(const ClientHomescreen());
    } else {
      Get.to(const LoginScreen());
    }
  }
}
  

