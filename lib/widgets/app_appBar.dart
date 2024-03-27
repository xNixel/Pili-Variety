import 'package:flutter/material.dart';
import 'package:pili_variety_classification/screens/home_screen.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';

AppBar appBar({
  required BuildContext context,
  required String label,
  required Color bgColor,
  required Color fontColor,
  required bool origPressFunction,
}) {
  return AppBar(
    iconTheme:
        IconThemeData(color: Colors.white), // Set the color of the back arrow
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor.withOpacity(0.8),
            primaryColor.withOpacity(0.6),
            primaryColor.withOpacity(0.3),
            primaryColor.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
    title: Text(label),
    titleTextStyle: TextStyle(
      color: fontColor,
      fontFamily: 'ProximaNova',
      fontSize: 20,
    ),
    backgroundColor:
        Colors.transparent, // Set AppBar's background color to transparent
    foregroundColor: fontColor,
    leading: !origPressFunction
        ? IconButton(
            onPressed: () {
              // Navigate to HomeScreen when IconButton is pressed
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded))
        : IconButton(
            onPressed: () {
              // Navigate to HomeScreen when IconButton is pressed
              Navigator.pushNamed(context, HomeScreen.id);
            },
            icon: const Icon(Icons.arrow_back_rounded),
          ),
  );
}
