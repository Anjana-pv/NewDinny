import 'package:dinnytable/controller/controllers/profile_controller.dart';
import 'package:dinnytable/widget.dart/menucard.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController profileInstance = Get.put(ProfileController());

    return Obx(() => StreamBuilder(
          stream: profileInstance.profileStream.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                child: Center(
                  child: CircularProgressIndicator(color: Colors.green),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final restaurantData =
                  snapshot.data!.data() as Map<String, dynamic>;
              String imageUrl = restaurantData['profileImage'] ?? '';
              String name = restaurantData['resturent_name'] ?? '';
              String place = restaurantData['city']??'';

              return Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'Profile',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
                  ),
                  body: ListView(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            imageUrl == ''
                                ? const Text('no preview')
                                : Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                            Positioned(
                              top: 30,
                              left: 10,
                              child: Text(
                                name,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 154, 26, 26),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sized10,
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Resturent Details ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Restaurant Name ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal)),
                                    sized10,
                                    Text('Owner Name ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal)),
                                    sized10,
                                    Text('Resturnt Type ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal)),
                                    sized10,
                                    Text('Starting Time ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal)),
                                    sized10,
                                    Text('Ending Time ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal)),
                                    sized10,
                                    Text('Total Seat Count ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      restaurantData['restaurantName'] ?? '',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    sized10,
                                    Text(restaurantData['type'] ?? '',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    sized10,
                                    Text(restaurantData['owner'] ?? '',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    sized10,
                                    Text(restaurantData['startingtime'] ?? '',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    sized10,
                                    Text(restaurantData['endingtime'] ?? '',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    sized10,
                                    Text(
                                        "${restaurantData['seatCount']} Seats ",
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              '  Menucard',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),

                            ),
                          ),
                          sized10,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              color: const Color.fromARGB(255, 238, 235, 235),
                              child: MenuImageview(
                                  menuCards: restaurantData['menuCards'] ?? []),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
            } else {
              return const SizedBox(
                  child: Center(
                child: Text('Please Check your Internet Connection'),
              ));
            }
          },
        ));
  }
}
