import 'package:flutter/material.dart';

const sized10 = SizedBox( height: 10);
const sized20 = SizedBox( height: 20);
const sized30 = SizedBox(height: 30);
  const sized50 =  SizedBox(height: 50);

Color myColor = const Color.fromRGBO(94, 137, 113, 1);

buttonclik(BuildContext context, String namebutton, Widget destinationScreen) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationScreen),
          );
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color.fromARGB(206, 4, 52, 29)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          fixedSize: MaterialStateProperty.all<Size>(const Size(250, 50.5)),
        ),
        child: Text(namebutton),
      )
    ],
  );
}
Container customTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller) {
  return Container(
     width: 370, 
    child: TextFormField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        labelText: text,
        labelStyle: TextStyle(color: const Color.fromARGB(255, 9, 9, 9).withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color.fromARGB(255, 218, 212, 212).withOpacity(0.3),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
  );
}
Container reusableTextfeild(String text, IconData icon, bool isPasswordType, TextEditingController controller) {
  return Container(
    width: 370,

    
    decoration: BoxDecoration(
   borderRadius: BorderRadius.circular(15.0), 
     color: myColor),
    child: TextFormField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      cursorColor: const Color.fromARGB(255, 249, 246, 246),
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        
        border: InputBorder.none,
        prefixIcon: Icon(
          icon,
          color: const Color.fromARGB(255, 248, 244, 244),
        ),
        labelText: text,
        labelStyle: TextStyle(color: const Color.fromARGB(255, 241, 235, 235).withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color.fromARGB(255, 218, 212, 212).withOpacity(0.3),
        
      ),
    ),
  );
}




