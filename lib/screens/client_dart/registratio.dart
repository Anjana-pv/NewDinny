import 'package:dinnytable/controllers/contollers.dart';
import 'package:dinnytable/screens/client_dart/home_client.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 244),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Registration",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(206, 4, 52, 29),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assest/restaurant.png")),
                      borderRadius: BorderRadius.circular(20.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          color: const Color.fromARGB(255, 37, 72, 38))),
                ),
              ),
              const SizedBox(
                height: 50.5,
              ),
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.restaurant,
                    color: Colors.white,
                  ),
                  labeltext: "Resturent Name",
                  controller: resturentName,
                  keyboardType: TextInputType.name,
                 
                  obscureText: false),
              sized10,
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  labeltext: "Owner Name",
                  controller: ownername,
                  keyboardType: TextInputType.name,
                 
                  obscureText: false),
              sized10,
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.location_city,
                    color: Colors.white,
                  ),
                  labeltext: "Address",
                  controller: address,
                  keyboardType: TextInputType.name,
                  
                  obscureText: false),
              sized10,
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.numbers,
                    color: Colors.white,
                  ),
                  labeltext: "pincode",
                  controller: pincode,
                  keyboardType: TextInputType.name,
               
                  obscureText: false),
              sized10,
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.airline_seat_legroom_normal_outlined,
                    color: Colors.white,
                  ),
                  labeltext: "Total Seat ",
                  controller: totalseats,
                  keyboardType: TextInputType.number,
             
                  obscureText: false),
              sized10,
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.fastfood,
                    color: Colors.white,
                  ),
                  labeltext: "Type of Resturent",
                  controller: type_resturent,
                  keyboardType: TextInputType.name,
             
                  obscureText: false),
              
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {
                      Get.to( const ClientHomescreen());
                    },
                   style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                           const Color.fromARGB(206, 4, 52, 29)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size(100, 50.5)),
                    ),
                    
                         child: const Text("Submit"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
