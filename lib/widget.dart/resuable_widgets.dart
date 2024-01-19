



import 'package:flutter/material.dart';

const sized10 = SizedBox(height: 10);
const sized20 = SizedBox(height: 20);
const sized30 = SizedBox(height: 30);
const sized50 = SizedBox(height: 50);

class Customtextfeild extends StatelessWidget {
   const Customtextfeild({
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
        keyboardType:keyboardType ,
        decoration: InputDecoration(
          prefixIcon: icon,
          
          iconColor: const Color.fromARGB(255, 66, 64, 64),
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: const Color.fromRGBO(253, 253, 253, 1),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        validator: (value) =>
            controller.text.isEmpty ? 'Please enter $hintText' : null,
      ),
    );
  }
}
class Tabletextfeild extends StatelessWidget {
  const Tabletextfeild({
    super.key,
    required this.text,
    required this.controller
    
  });
  final String text;
  final TextEditingController controller ;    
    @override
  Widget build(BuildContext context) {
   return
      Row(
        children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
                       ),
           ),
          const SizedBox(
            width: 70), 
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextFormField(
                controller:controller ,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "0",
                  filled: true,
                  fillColor: Colors.white,
                ),
                 validator: (value) =>
            controller.text.isEmpty ? 
            'Please enter the value' : null,
               ),
              ),
            ),
          
          
        ],
     
        
      
    );
  }
}