import 'dart:ui';
import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';


final GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController twoSeat = TextEditingController();
TextEditingController fourseat = TextEditingController();
TextEditingController sixseats = TextEditingController();
TextEditingController twelveSeats = TextEditingController();

class FrostedGlassScreen extends StatelessWidget {
  const FrostedGlassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Clientcontroller client = Clientcontroller();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assest/bgrud.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
        
            // Centered Card
            Form(
              key: formKey,
              child: Center(
                child: Card(
                  color: const Color.fromARGB(206, 4, 52, 29),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    width: 350,
                    height: 560,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "🍽️ To enhancing  dining experience! Could you share the number of tables at your place? ",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                        sized10,
                        const Text(
                          "Your Total Seats are ",
                          style: TextStyle(color: Colors.white),
                        ),
                        sized20,
                        Tabletextfeild(
                          text: "Two-Top  :     \n (2 Seats) ",
                          controller: twoSeat,
                        ),
                        sized30,
                        Tabletextfeild(
                            text: "Four-Top  :     \n (4 Seats) ",
                            controller: fourseat),
                        sized30,
                        Tabletextfeild(
                            text: "Six-Top    :      \n (6 Seats)",
                            controller: sixseats),
                        sized30,
                        Tabletextfeild(
                            text: "Twelve-Top :  \n (12 Seats)",
                            controller: twelveSeats),
                        sized30,
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              
                              
        
                            //   final bool response =
                            //       await client.addContact(clientData);
                            //   if (response) {
                            //     // Clear the text controllers
                            //     twoSeat.clear();
                            //     fourseat.clear();
                            //     sixseats.clear();
                            //     twelveSeats.clear();
                            //     Get.to(ClientHomescreen());
                            //   } else {
                            //     print("Error adding data to Firebase");
                            //   }
                             }
                           },
                          child: const Text('Click me'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FrostedGlassScreen(),
  ));
}
