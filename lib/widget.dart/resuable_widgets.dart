import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidgetD extends StatelessWidget {
  const TextFieldWidgetD({
    super.key,
    required this.icon,
    required this.labeltext,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
  });
  final Widget icon;
  final String labeltext;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color.fromARGB(170, 51, 104, 70)),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: const Color.fromARGB(255, 249, 246, 246),
        style: TextStyle(color: Colors.white.withOpacity(0.9)),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          prefixIcon: icon,
          labelText: labeltext,
          labelStyle: TextStyle(
              color: const Color.fromARGB(255, 241, 235, 235).withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: const Color.fromARGB(255, 218, 212, 212).withOpacity(0.3),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}

const sized10 = SizedBox(height: 10);
const sized20 = SizedBox(height: 20);
const sized30 = SizedBox(height: 30);
const sized50 = SizedBox(height: 50);

class Customtextfeild extends StatelessWidget {
   Customtextfeild({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Widget icon;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType:keyboardType ,
        decoration: InputDecoration(
          prefixIcon: icon,
          
          iconColor: Colors.black,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 231, 234, 231),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        validator: (value) =>
            controller.text.isEmpty ? 'Please enter $hintText' : null,
      ),
    );
  }
}
