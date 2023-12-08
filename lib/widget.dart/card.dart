import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;


  const CustomAppBar({super.key, required this.title, required bool automaticallyImplyLeading,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
     title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
       automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(206, 4, 52, 29),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

  Row button() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: ElevatedButton(
                    onPressed: () async {
                     
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                         Color.fromARGB(128, 51, 104, 70)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size(170, 50.5)),
                    ),
                    child: const Text("Add Menu Images"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: ElevatedButton(
                    onPressed: () async {
                     
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(133, 54, 110, 75)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size(170, 50.5)),
                    ),
                    child: const Text("Add Documents"),
                  ),
                ),
              ],
            );
  }



