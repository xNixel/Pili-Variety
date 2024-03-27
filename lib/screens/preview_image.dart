import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pili_variety_classification/screens/MPF_screen.dart';
import 'package:pili_variety_classification/screens/RPS_screen.dart';
import 'package:pili_variety_classification/screens/scanning.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';
import 'package:pili_variety_classification/widgets/app_appBar.dart';
import 'package:pili_variety_classification/widgets/app_icon_button.dart';
import 'package:pili_variety_classification/widgets/display_image.dart';

class DisplayImageScreen extends StatefulWidget {
  static const String id = "mpf_display_image_screen";
  const DisplayImageScreen({
    Key? key,
    required this.filePath,
    required this.label,
    required this.confidence,
    required this.input,
  }) : super(key: key);

  final File? filePath;
  final String? label;
  final double? confidence;
  final String? input;

  @override
  State<DisplayImageScreen> createState() => _DisplayImageScreenState();
}

class _DisplayImageScreenState extends State<DisplayImageScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false, // Disable system back button
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primarybgColor,
          appBar: appBar(
            label: 'Preview',
            bgColor: primarybgColor,
            fontColor: white,
            context: context,
            origPressFunction: false,
          ),
          body: Column(
            children: [
              SizedBox(height: height * 0.10),
              Center(
                child: DisplayImg(
                  width: width,
                  height: height,
                  filePath: widget.filePath,
                ),
              ),
              SizedBox(height: height * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIconButton(
                    onPress: () => Navigator.pushNamed(
                      context,
                      ScanningImageScreen.id,
                      arguments: {
                        'filePath': widget.filePath,
                        'label': widget.label,
                        'confidence': widget.confidence,
                        'input': widget.input,
                      },
                    ),
                    horizontalPadding: 50,
                    verticalPadding: 10,
                    iconData: Icons.search_rounded,
                    title: "Scan",
                    bgColor: primaryColor,
                    textColor: white,
                  ),
                  const SizedBox(width: 20),
                  AppIconButton(
                    onPress: (widget.input == 'MPF')
                        ? () => Navigator.pushNamed(context, MPFScreen.id)
                        : () => Navigator.pushNamed(context, RPSScreen.id),
                    horizontalPadding: 50,
                    verticalPadding: 10,
                    iconData: Icons.restart_alt_rounded,
                    title: "Retry",
                    bgColor: cancelColor,
                    textColor: white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
