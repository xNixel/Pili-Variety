import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pili_variety_classification/screens/MPF_screen.dart';
import 'package:pili_variety_classification/screens/RPS_screen.dart';
import 'package:pili_variety_classification/screens/result.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';
import 'package:pili_variety_classification/widgets/display_image.dart';
import 'package:pili_variety_classification/widgets/app_button.dart';
import 'package:scanning_effect/scanning_effect.dart';

class ScanningImageScreen extends StatefulWidget {
  static const String id = "scanning_image_screen";

  const ScanningImageScreen({
    super.key,
    required this.filePath,
    required this.label,
    required this.confidence,
    required this.input,
  });

  final File? filePath;
  final String? label;
  final double? confidence;
  final String? input;

  @override
  State<ScanningImageScreen> createState() => _ScanningImageScreenState();
}

class _ScanningImageScreenState extends State<ScanningImageScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.of(context).pushNamed(
      ResultScreen.id,
      arguments: {
        'filePath': widget.filePath,
        'label': widget.label,
        'confidence': widget.confidence,
        'input': widget.input,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primarybgColor,
      body: Column(
        children: [
          SizedBox(height: height * 0.15),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: height * 0.45,
              maxWidth: width * 0.80,
            ),
            child: ScanningEffect(
              borderLineColor: white,
              duration: const Duration(seconds: 2),
              scanningHeightOffset: 0.2,
              scanningLinePadding: const EdgeInsets.all(15),
              scanningColor: white,
              child: DisplayImg(
                width: width,
                height: height,
                filePath: widget.filePath,
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: height * 0.28,
            width: width * 1,
            decoration: const BoxDecoration(
                color: primarybgColor,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    topEnd: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search_rounded,
                    color: white,
                    size: 50,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Currently Scanning",
                    style: TextStyle(
                      color: white,
                      fontFamily: 'ProximaNova',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Please give us few seconds while we analyze your sample, you'll get the results after!",
                    style: TextStyle(
                      color: white,
                      fontFamily: 'ProximaNova',
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  CancelButton(
                    title: "Cancel",
                    onPress: (widget.input == 'MPF')
                        ? () => Navigator.pushNamed(context, MPFScreen.id)
                        : () => Navigator.pushNamed(context, RPSScreen.id),
                    fontSize: 16,
                    horizontalPadding: 126,
                    verticalPadding: 15,
                    bgColor: primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
