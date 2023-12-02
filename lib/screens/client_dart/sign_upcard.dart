import 'package:dinnytable/firebase/firebase_auth.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SignUp extends StatefulWidget {
   SignUp({Key? key});
  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController userController = TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Text(
              "Create an Account",
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assest/Apple_Watch_41mm_-_2-transformed.png'))),
                          ),
            sized30,
            Center(
              child: Column(children: [
                TextFieldWidgetD(
                    icon: const Icon(Icons.person,color: Colors.white,),
                    labeltext: "Username",
                    controller: userController,
                    keyboardType: TextInputType.name,
                  
                    obscureText: false),
                sized20,
                TextFieldWidgetD(
                    icon: const Icon(Icons.email,color: Colors.white,),
                    labeltext: "Email",
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                   
                    obscureText: false),
                sized20,
                TextFieldWidgetD(
                    icon: const Icon(Icons.lock,color: Colors.white,),
                    labeltext: "Password",
                    controller: passwordController,
                    keyboardType: TextInputType.name,
                   
                    obscureText: true),
                sized30,
                ElevatedButton(
                    onPressed: () {
                      signup();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(206, 4, 52, 29)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size(250, 50.5)),
                    ),
                    child: const Text("Sign up")),
                sized30,
                const Text("Or"),
                sized30,
                GestureDetector(
                  onTap: () {
                    signinggogle();
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
        ));
  }
}
