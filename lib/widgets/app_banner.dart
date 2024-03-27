import 'package:flutter/material.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
    required this.height,
    this.imagePath, // New parameter for the image path
  }) : super(key: key);

  final double height;
  final String? imagePath; // New parameter for the image path

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          colors: [
            primaryColor.withOpacity(0.8),
            primaryColor.withOpacity(0.5),
            primaryColor.withOpacity(0.2),
            primaryColor.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          if (imagePath != null) // Check if imagePath is provided
            Positioned.fill(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  imagePath!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Positioned(
            left: 16, // Adjust left position as needed
            bottom: 100, // Adjust top position as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Discover the Pili Variety',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 200, // Adjust left position as needed
            top: 20, // Adjust top position as needed
            child: Image.asset(
              'assets/imgs/start.png', // Path to your fixed image
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
