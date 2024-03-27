import 'package:flutter/material.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';

class ResultCircleAvatar extends StatelessWidget {
  const ResultCircleAvatar({
    super.key,
    required this.height,
    required this.imgPath,
  });

  final double height;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: height * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: white,
        ),
        child: Image.asset(
          imgPath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
