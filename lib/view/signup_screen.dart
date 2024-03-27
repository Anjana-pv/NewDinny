import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/controller/firebase/signin_auth.dart';
import 'package:dinnytable/view/registratio.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Clientcontroller clientcontroller = Get.put(Clientcontroller());
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
        appBar: AppBar(),
        body: Form(
            key: formKey,
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
                  child: Column(children: [
                    Customtextfeild(
                        hintText: 'Username',
                        controller: clientcontroller.user,
                        icon: const Icon(
                          Icons.person,
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username cannot be empty';
                          } else if (value.contains(RegExp(r'[0-9]'))) {
                            return 'Username cannot contain numbers';
                          }
                          return null; 
                        }),
                    sized10,
                    Customtextfeild(
                  controller: clientcontroller.email,
                  hintText: 'Email',
                  icon: const Icon(Icons.person),
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!GetUtils.isEmail(value)) {
                      return 'Enter a valid email address';
                    }
                    return null; 
                  },
                ),
                    sized10,
                   Customtextfeild(
                  controller: clientcontroller.password,
                  hintText: ' Password',
                  icon: const Icon(Icons.lock),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters long.';
                    }
                    return null;
                  },),
                    sized20,
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          // SizedBox(
                          //     width: 24,
                          //     height: 24,
                          //     child: Checkbox(
                          //       value: false,
                          //       onChanged: (value) {},
                          //     )),
                          SizedBox(
                            width: 10,
                          ),
                          // const Text.rich(TextSpan(
                          //   text: 'I Agree to policy and privacy',
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontSize: 16.0,
                          //   ),
                          // ))
                        ],
                      ),
                    ),
                    sized20,
                    ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            if (!isValidEmail(clientcontroller.email.text)) {
                              Get.snackbar(
                                ' Error',
                                'Enter Proper Email id',
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 3),
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                forwardAnimationCurve: Curves.easeOut,
                                snackStyle: SnackStyle.FLOATING,
                              );
                              return;
                            }
                            if (clientcontroller.password.text.length < 6) {
                              Get.snackbar(
                                ' Error',
                                'Enter minimum 6 charecters in password',
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 3),
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                forwardAnimationCurve: Curves.easeOut,
                                snackStyle: SnackStyle.FLOATING,
                              );
                              return;
                            }

                            QuerySnapshot emailSnapshot = await firestore
                                .collection('clientdetail')
                                .where('email',
                                    isEqualTo: clientcontroller.email.text)
                                .get();
                            QuerySnapshot usernameSnapshot = await firestore
                                .collection('clientdetail')
                                .where('user',
                                    isEqualTo: clientcontroller.user.text)
                                .get();

                            if (emailSnapshot.docs.isNotEmpty &&
                                usernameSnapshot.docs.isNotEmpty) {
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
                            } else {
                              Get.to(
                                RegistrationScreen(
                                  username: clientcontroller.user.text,
                                  password: clientcontroller.password.text,
                                  email: clientcontroller.email.text,
                                ),
                              );
                              clientcontroller.user.clear();
                              clientcontroller.password.clear();
                              clientcontroller.email.clear();
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
                        child: const Text("Sign up")),
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
