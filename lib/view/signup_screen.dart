import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/controller/firebase/signin_auth.dart';
import 'package:dinnytable/view/registratio.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Clientcontroller clientcontroller = Get.put(Clientcontroller());
     FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
        appBar: AppBar(),
        body: Form(
            key: _formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                const Center(
                  child: Text(
                    "Create an Account",
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assest/Apple_Watch_41mm_-_2-transformed.png'))),
                ),
                sized20,
                Center(
                  child: Column(
                    children: [
                      Customtextfeild(
                         hintText:'Username', 
                          controller: clientcontroller.user,
                           icon:const Icon( Icons.person,), 
                            obscureText: false,
                             keyboardType: TextInputType.name,
                           ),
                            sized10,
                             Customtextfeild(
                         hintText:'Email', 
                          controller: clientcontroller.email,
                           icon:const Icon( Icons.mail,),
                             obscureText:false, 
                             keyboardType: TextInputType.emailAddress,
                           ),
                           sized10,
                           Customtextfeild(
                         hintText:'Password', 
                          controller: clientcontroller.password,
                           icon:const Icon( Icons.lock,),
                            obscureText: true, 
                            keyboardType: TextInputType.visiblePassword,
                           ),
                    sized20,
                    ElevatedButton(
                        onPressed:() async {
                        if (_formKey.currentState?.validate() ?? false){
                          if (!isValidEmail(clientcontroller.email.text)) {
                              Get.snackbar(
                             ' Error',
                               'Enter Proper Email id',
                                snackPosition: SnackPosition.BOTTOM, 
                                  duration: const Duration(seconds: 3), 
                                   backgroundColor:  Colors.red,
                                    colorText: Colors.white,
                                     forwardAnimationCurve: Curves.easeOut,
                                    snackStyle: SnackStyle.FLOATING, 
                                 ); 
                              return;
                            }
                           
                            if (clientcontroller. password.text.length < 8) {
                             Get.snackbar(
                             ' Error',
                               'Enter minimum 8 charecters in password',
                                snackPosition: SnackPosition.BOTTOM, 
                                  duration: const Duration(seconds: 3), 
                                   backgroundColor:  Colors.red,
                                    colorText: Colors.white,
                                     forwardAnimationCurve: Curves.easeOut,
                                    snackStyle: SnackStyle.FLOATING, 
                                 );
                              return;
                            }
                            
                            QuerySnapshot emailSnapshot = await firestore
                            .collection('clientdetail')
                            .where('emailController',
                             isEqualTo: clientcontroller.email.text)
                            .get();
                        QuerySnapshot usernameSnapshot = await firestore
                            .collection('clientdetail')
                            .where('userController',
                             isEqualTo: clientcontroller.user.text)
                            .get();
                        
                          

                        if (emailSnapshot.docs.isNotEmpty&&usernameSnapshot.docs.isNotEmpty) {
                          
                          Get.snackbar(
                            'Error',
                            'User already in Exist ',
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 3),
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            forwardAnimationCurve: Curves.easeOut,
                            snackStyle: SnackStyle.FLOATING,
                          );
                        }
                           
                            else {
                            Get.to(RegistrationScreen(
                            username: clientcontroller.user.text,
                            password: clientcontroller.password.text,
                            email: clientcontroller.email.text,
                          ));
                        }
                        }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(76, 4, 52, 29)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(250, 50.5)),
                        ),
                        child: const Text("Sign up")
                        ),
                    sized30,
                    const Text("Or"),
                    sized20,
                    GestureDetector(
                      onTap: () {
                        googlesignin();
                      },
                      child: Container(
                          width: 300,
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 244, 79, 79),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "SignUp with Google",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ))),
                    )
                  ]),
                ),
              ],
            )));
  }
}
bool isValidEmail(String email) {
  RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegExp.hasMatch(email);
}


