import 'package:dinnytable/controllers/registration_controller.dart';
import 'package:dinnytable/firebase/add_image.dart';
import 'package:dinnytable/screens/client_dart/home_client.dart';
import 'package:dinnytable/widget.dart/card.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegController regcontroller = Get.put(RegController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 244),
      appBar: const CustomAppBar(
        title: "Registration",
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: GestureDetector(
                  onTap: () => pickImage(),
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      image: regcontroller.imageFile != null
                          ? DecorationImage(
                              image: FileImage(regcontroller.imageFile!),
                              fit: BoxFit.cover,
                            )
                          : const DecorationImage(
                              image: AssetImage("assets/restaurant.png"),
                              fit: BoxFit.cover,
                            ),
                      borderRadius: BorderRadius.circular(20.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 37, 72, 38),
                      ),
                    ),
                    child: regcontroller.imageFile == null
                        ? const Center(
                            child: Text(
                              'Add Image',
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 11, 11),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : null,
                  ),
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
                  controller: regcontroller.resturentName,
                  keyboardType: TextInputType.name,
                  obscureText: false),
              sized10,
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  labeltext: "Owner Name",
                  controller: regcontroller.ownerName,
                  keyboardType: TextInputType.name,
                  obscureText: false),
              sized10,
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.location_city,
                    color: Colors.white,
                  ),
                  labeltext: "Address",
                  controller: regcontroller.address,
                  keyboardType: TextInputType.name,
                  obscureText: false),
              sized10,
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.numbers,
                    color: Colors.white,
                  ),
                  labeltext: "pincode",
                  controller: regcontroller.pincode,
                  keyboardType: TextInputType.name,
                  obscureText: false),
              sized10,
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.airline_seat_legroom_normal_outlined,
                    color: Colors.white,
                  ),
                  labeltext: "Total Seat ",
                  controller: regcontroller.totalSeats,
                  keyboardType: TextInputType.number,
                  obscureText: false),
              sized10,
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.fastfood,
                    color: Colors.white,
                  ),
                  labeltext: "Type of Resturent",
                  controller: regcontroller.typeResturent,
                  keyboardType: TextInputType.name,
                  obscureText: false),
              sized10,
              TextFieldWidgetD(
                  icon: const Icon(
                    Icons.lock_clock,
                    color: Colors.white,
                  ),
                  labeltext: "Working hours",
                  controller: regcontroller.workHours,
                  keyboardType: TextInputType.number,
                  obscureText: false),
              sized10,
              button(),
              sized10,
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          regcontroller.addReg();
                          Get.to(const ClientHomescreen());
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
