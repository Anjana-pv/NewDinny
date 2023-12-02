import 'package:dinnytable/screens/client_dart/booking_scree.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget smallContainer(String text,) {
 return  Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: const Color.fromARGB(206, 4, 52, 29),
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
 );
  
}
