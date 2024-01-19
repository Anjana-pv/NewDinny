import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.name,
    required this.controller,
  }) : super(key: key);

  final String name;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          initialEntryMode: TimePickerEntryMode.dial,
        );

        if (pickedTime != null) {
          // Format the picked time with AM/PM
          String formattedTime = formatTimeOfDay(context, pickedTime);

          // Set the formatted time to the controller's text
          controller.text = formattedTime;
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: const BorderSide(
          color: Color.fromARGB(255, 10, 4, 4),
          width: 1.0,
        ),
      ),
      child: Text(
        name,
        style: const TextStyle(
          color: Color.fromARGB(255, 66, 64, 64),
          fontSize: 15,
        ),
      ),
    );
  }

  String formatTimeOfDay(BuildContext context, TimeOfDay timeOfDay) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(timeOfDay);
  }
}
