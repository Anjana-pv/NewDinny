import 'dart:io';
import 'package:dinnytable/controllers/registration_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
    required bool automaticallyImplyLeading,
  });

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

final RegController regController = RegController();
Row button() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 32),
        child: ElevatedButton(
          onPressed: () async {
            // File? image = await getImage();
            // if (image != null) {
            //   regController.menuImages.add(image);
            // }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(128, 51, 104, 70)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            fixedSize: MaterialStateProperty.all<Size>(const Size(170, 50.5)),
          ),
          child: const Text("Add Menu Images"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 32.0),
        child: ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['pdf'],
            );
            if (result != null && result.files.isNotEmpty) {
              // regController.documentPDF = File(result.files.first.path!);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(133, 54, 110, 75)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            fixedSize: MaterialStateProperty.all<Size>(const Size(170, 50.5)),
          ),
          child: const Text("Add Documents"),
        ),
      ),
    ],
  );
}

Future<File?> getImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    return File(image.path);
  } else {
    return null;
  }
}
