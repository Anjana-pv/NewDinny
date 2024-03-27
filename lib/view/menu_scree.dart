import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/controller/controllers/cient_controller.dart';
import 'package:dinnytable/view/login.dart';
import 'package:dinnytable/view/polices_dart';
import 'package:dinnytable/view/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Clientcontroller client=Get.put(Clientcontroller());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assest/Apple_Watch_41mm_-_2-transformed.png'),
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
            onTap: () {
              Get.to(const Settings());
            },
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                 Get.to(const Settings());

              },
            ),
          ),

          GestureDetector(
            onTap: () {
              Share.share("share it");
            },
            child: ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share App'),
              onTap: () {
                Share.share("share it");
              },
            ),
          ),
         

          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Policy and Privacy'),
            onTap: () {
            Get.to(  PrivacyPolicyScreen());
            }
          ),
         
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
             client.logout();
            },
          ),
        ],
      ),
    );
  }

  
  // }
}
