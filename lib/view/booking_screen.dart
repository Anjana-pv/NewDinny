import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/widget.dart/card.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';


class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  Clientcontroller client = Clientcontroller();

  @override
  void initState() {
    super.initState();
    client.fetchDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Booking List",
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey,
      body: StreamBuilder<QuerySnapshot>(
        stream:  client.bookingstream ,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            List<DocumentSnapshot> bookingDetail = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  var bookingData =
                      bookingDetail[index].data() as Map<String, dynamic>;

                  String user = bookingData[' user_name']?? ''; 
                  var bookingDate = bookingData[' date']??'';
                  var userInfo = bookingData['phone_number']??'';
                  var guestCount = bookingData['guest_count']??'';
                  var bookingTime = bookingData[' time']??'';
                  


                  return Card(
                    elevation: 4.0,

                    margin: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.15,

                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 246, 246, 246),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
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
                              "Username: $user",
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              'Geust Count:  $guestCount',
                              style: const TextStyle(fontSize: 14.0),
                            ),
                            Text(
                              'User Info:  $userInfo',
                              style: const TextStyle(fontSize: 14.0),
                            ),
                             Text(
                                    'Time: $bookingTime',
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
                  );
                },
                itemCount: bookingDetail.length,
              ),
            );
          } else {
            return const SizedBox(
              child: Center(child: Text('error')),
            );
          }
        },
      ),
    );
  }
}
