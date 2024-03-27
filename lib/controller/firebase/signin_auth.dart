import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/view/registratio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

Clientcontroller regcontroller = Get.put(Clientcontroller());

googlesignin() async {
  try {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
  await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
  final SharedPreferences pref =await SharedPreferences.getInstance();
   pref.setBool("islogin", true);
    Get.to(const RegistrationScreen(
      username: "",
      password: "",
      email: "",
    ));
    regcontroller.email.clear();
  } catch (e) {
    // print("Error signing in with Google: $e");
  }
}
   googlesignout() async {
    
  try {
    await GoogleSignIn().signOut();
    print("Google Sign-Out successful");
    final SharedPreferences pref =await SharedPreferences.getInstance();
   pref.setBool("islogin",false );
  } catch (e) {
    print("Error signing out with Google: $e");
  
  }
}


  
   