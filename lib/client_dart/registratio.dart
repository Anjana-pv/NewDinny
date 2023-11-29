import 'package:dinnytable/client_dart/home_client.dart';
import 'package:dinnytable/resuable_widget.dart/resuable.dart';
import 'package:flutter/material.dart';

class ResgistrationScreen extends StatelessWidget {
  ResgistrationScreen({super.key});

  TextEditingController resturentName = TextEditingController();

  TextEditingController ownername = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController pincode = TextEditingController();

  TextEditingController workhours = TextEditingController();

  TextEditingController totalseats = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 244),
      appBar: AppBar(
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
              reusableTextfeild(
                  "Resturent Name", Icons.restaurant, false, resturentName),
              sized10,
              reusableTextfeild("Owner Name", Icons.person, false, ownername),
              sized10,
              reusableTextfeild("Address", Icons.location_city, false, address),
              sized10,
              reusableTextfeild("pincode", Icons.lock_clock, false, pincode),
              sized10,
              reusableTextfeild("Total Seats",
                  Icons.airline_seat_legroom_reduced_sharp, false, totalseats),
              sized10,
              reusableTextfeild(
                  "Type of Rsturent", Icons.ac_unit_sharp, false, totalseats),
              sized10,
              reusableTextfeild("Add manu", Icons.image, false, totalseats),
              sized10,
              reusableTextfeild(
                "Submit Document",
                Icons.book,
                false,
                totalseats,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonclik(context, "submit", const ClientHomescreen())
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
