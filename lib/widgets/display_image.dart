import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';

class DisplayImg extends StatelessWidget {
  const DisplayImg({
    super.key,
    required this.width,
    required this.height,
    required this.filePath,
  });

  final double width;
  final double height;
  final File? filePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.75,
      height: height * 0.45,
      decoration: BoxDecoration(
        border: Border.all(width: 15, color: primarybgColor),
        borderRadius: BorderRadius.circular(8),
        color: primarybgColor,
      ),
      child: Image.file(
        filePath!,
        fit: BoxFit.contain,
      ),
    );
  }
}
