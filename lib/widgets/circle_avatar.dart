import 'package:flutter/material.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    required this.height,
    required this.width,
    required this.assetImage,
    required this.title,
    required this.leftPositionMultiplier,
  });

  final double height;
  final double width;
  final double leftPositionMultiplier;
  final String assetImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * 0.20,
      left: width * leftPositionMultiplier,
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(150),
            ),
            child: Image(
              image: AssetImage(assetImage),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              color: white,
              fontFamily: 'ProximaNova',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
