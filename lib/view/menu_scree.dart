import 'package:dinnytable/view/login.dart';
import 'package:dinnytable/view/profileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assest/Apple_Watch_41mm_-_2-transformed.png'),
                fit: BoxFit.contain,
              ),
            ),
            accountName: null,
            accountEmail: null,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),

            child: Text(
              'Menu',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.to(ProfileScreen());
            },
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
              
              },
            ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share App'),
              onTap: () {
                
              },
            ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
               
              },
            ),
          ),
          
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Policy and Privacy'),
            onTap: () {
         
            },
          ),
          ListTile(
            leading: const Icon(Icons.policy),
            title: const Text('Terms and Conditions'),
            onTap: () {
              // Handle terms and conditions tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
  Future<void> logoutUser() async {
  try {
    await FirebaseAuth.instance.signOut();
    
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('resturent_id');  
    Get.offAll(LoginScreen());
  } catch (e) {
    print("Error signing out: $e");
  }
}
}
