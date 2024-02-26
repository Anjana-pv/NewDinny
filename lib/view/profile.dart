import 'package:dinnytable/controller/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
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
                  child: CircularProgressIndicator(color: Colors.amber),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final resturentData =
                  snapshot.data!.data() as Map<String, dynamic>;
              String imageUrl = resturentData['profileImage'] ?? '';
              return Scaffold(
                  body: ListView(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: imageUrl == ''
                        ? const Text('no preview')
                        : Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }
                            },
                          ),
                  ),
                  Text("${resturentData['restaurantName'] ?? ''}"),
                  Text("${resturentData['restaurantName'] ?? ''}"),
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

  // Future<void> _logoutUser() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     await preferences.remove('getuser_id');

  //     Get.offAll(const LoginScreen());
  //   } catch (e) {
  //     print("Error signing out: $e");
  //   }
  // }
}
