import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/widget.dart/card.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BookingScreen extends StatelessWidget {
   const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Clientcontroller client = Get.put( Clientcontroller());
    return Scaffold(
      appBar:  const CustomAppBar(
        title: "Booking List",
        automaticallyImplyLeading: true,
      
      ),
      backgroundColor: Color.fromARGB(255, 226, 226, 226),
      body:Obx(() =>  StreamBuilder<QuerySnapshot>(
        stream:  client.bookingStream.value ,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            List<DocumentSnapshot> bookingDetail = snapshot.data!.docs;
            return ListView.builder(
             
              itemBuilder: (context, index) {
                var bookingData =
                    bookingDetail[index].data() as Map<String, dynamic>;
            
                String user = bookingData[' user_name']?? ''; 
                var bookingDate = bookingData[' date']??'';
                var userInfo = bookingData['phone_number']??'';
                var guestCount = bookingData['guest_count']??'';
                var bookingTime = bookingData[' time']??'';
                
            
            
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 8.2,
                  
                   
                    child: SizedBox(
                     
                       height: MediaQuery.of(context).size.height * 0.17,
                  
                  
                     
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                  
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              ' Table Bookings',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sized10,
                            Text(
                              "Username : $user",
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              'Geust Count : $guestCount',
                              style: const TextStyle(fontSize: 14.0),
                            ),
                            Text(
                              'Contact Number : $userInfo',
                              style: const TextStyle(fontSize: 14.0),
                            ),
                             Text(
                                    'Selected Time : $bookingTime',
                                    style: const TextStyle(fontSize: 14.0),
                                  ),
                          
                        
                          Padding(
                            padding: const EdgeInsets.only(right:40 ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date: $bookingDate',
                                    style: const TextStyle(fontSize: 14.0),
                                  ),
                                
                                  
                                  
                                ],
                              ),
                          ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: bookingDetail.length,
            );
          } else {
            return const SizedBox(
              child: Center(child: Text('error')),
            );
          }
        },
      ),)
    );
  }
}
