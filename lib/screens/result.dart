import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pili_variety_classification/screens/MPF_screen.dart';
import 'package:pili_variety_classification/screens/RPS_screen.dart';
import 'package:pili_variety_classification/screens/result_description.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';
import 'package:pili_variety_classification/widgets/display_image.dart';
import 'package:pili_variety_classification/widgets/app_button.dart';

class ResultScreen extends StatefulWidget {
  static const String id = "result_screen";
  const ResultScreen({
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
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return PopScope(
      onPopInvoked: (didPop) => (widget.input == 'MPF')
          ? Navigator.pushNamed(context, MPFScreen.id)
          : Navigator.pushNamed(context, RPSScreen.id),
      canPop: false,
      child: Scaffold(
        backgroundColor: primarybgColor,
        body: Column(
          children: [
            SizedBox(height: height * 0.15),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: height * 0.45,
                maxWidth: width * 0.80,
              ),
              child: DisplayImg(
                width: width,
                height: height,
                filePath: widget.filePath,
              ),
            ),
            const Spacer(),
            Container(
              height: height * 0.32,
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
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Image(
                        image: (widget.input == 'MPF')
                            ? const AssetImage("assets/imgs/mature.png")
                            : const AssetImage("assets/imgs/shell.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.label!,
                      style: const TextStyle(
                        color: white,
                        fontFamily: 'ProximaNova',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Confidence: ${widget.confidence!.toStringAsFixed(2)}%",
                      style: const TextStyle(
                        color: white,
                        fontFamily: 'ProximaNova',
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (widget.label!.toLowerCase() != 'no pili detected' ||
                                widget.confidence != 0.0)
                            ? CancelButton(
                                title: "Cancel",
                                onPress: (widget.input == 'MPF')
                                    ? () => Navigator.pushNamed(
                                        context, MPFScreen.id)
                                    : () => Navigator.pushNamed(
                                        context, RPSScreen.id),
                                fontSize: 16,
                                horizontalPadding: 35,
                                verticalPadding: 15,
                                bgColor: cancelColor,
                              )
                            : AppButton(
                                title: "Retry",
                                onPress: (widget.input == 'MPF')
                                    ? () => Navigator.pushNamed(
                                        context, MPFScreen.id)
                                    : () => Navigator.pushNamed(
                                        context, RPSScreen.id),
                                fontSize: 16,
                                horizontalPadding: 128,
                                verticalPadding: 15,
                                bgColor: primaryColor,
                              ),
                        (widget.label!.toLowerCase() != 'no pili detected' ||
                                widget.confidence != 0.0)
                            ? const SizedBox(width: 10)
                            : Container(),
                        (widget.label!.toLowerCase() != 'no pili detected' ||
                                widget.confidence != 0.0)
                            ? AppButton(
                                title: "Description",
                                onPress: () => Navigator.pushNamed(
                                  context,
                                  ResultDescriptionScreen.id,
                                  arguments: {
                                    'filePath': widget.filePath,
                                    'label': widget.label,
                                    'confidence': widget.confidence,
                                    'input': widget.input,
                                  },
                                ),
                                fontSize: 16,
                                horizontalPadding: 50,
                                verticalPadding: 15,
                                bgColor: primaryColor,
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
