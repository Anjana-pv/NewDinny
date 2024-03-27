import 'package:dinnytable/view/home_client.dart';
import 'package:dinnytable/view/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashController extends GetxController {
 
  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLogined') ?? false;
    return isLoggedIn;
  }
}
  

