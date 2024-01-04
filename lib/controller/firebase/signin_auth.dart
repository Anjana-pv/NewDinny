import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/view/registratio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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


  
   