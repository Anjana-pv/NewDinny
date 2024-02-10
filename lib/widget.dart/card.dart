import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, 
  required this.title, 
  required bool automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
     title: Text(
        title,
        style: const TextStyle(
          color: Colors.white),
      ),
       automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(206, 4, 52, 29),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}




