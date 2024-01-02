import 'package:flutter/material.dart';

class TextFieldWidgetD extends StatelessWidget {
  const TextFieldWidgetD({
    super.key,
    required this.icon,
    required this.labeltext,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
    //  required this.validator,
  });
  final Widget icon;
  final String labeltext;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  // final String? Function(String?) validator; 

  @override
  Widget build(BuildContext context) {
     return Container(
     width: 370,
    decoration: BoxDecoration(
   borderRadius: BorderRadius.circular(15.0), 
   color: const Color.fromARGB(170, 51, 104, 70)
    ),
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
        labelStyle: TextStyle(color: const Color.fromARGB(255, 241, 235, 235).withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color.fromARGB(255, 218, 212, 212).withOpacity(0.3),  
      ),
      
      keyboardType: keyboardType,
      // validator: validator, 
    ),
  );
    
  }
}

const sized10 = SizedBox(height: 10);
const sized20 = SizedBox(height: 20);
const sized30 = SizedBox(height: 30);
const sized50 = SizedBox(height: 50);
