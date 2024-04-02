
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/view/offer_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';





 
class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key, required this.bookingSnap,
  });
  
final AsyncSnapshot<QuerySnapshot<Object?>> bookingSnap;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Center(
              child: Container(
                width: 270,
                height: 270,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assest/image 8.png"))),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
         
        Container(
              width: 350,
              height: 300,
              color: const Color.fromARGB(255, 216, 217, 212),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Grow your business ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 13, 13, 13),
                      fontSize: 24,
                    ),
                  ),
                  Image.asset(
                    'assest/restaurant-table-7954972-63199-unscreen.gif',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Add Offers click the button below",
                      style: TextStyle(
                        color: Color.fromARGB(255, 2, 2, 2),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  GestureDetector(
                    onTap: () =>showModalBottomSheet(context: context,builder: (context) {
                      return const AddOfferBottomSheet();
                    },) ,
                    child:const Icon(Icons.camera_alt_outlined,
                        color:  Color.fromARGB(206, 4, 52, 29),
                        size: 50,),
                  ),



                ],
              ),
            ),
          
        ],
      ),
    );
  }
}
