import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pili_variety_classification/screens/MPF_screen.dart';
import 'package:pili_variety_classification/screens/RPS_screen.dart';
import 'package:pili_variety_classification/screens/preview_image.dart';
import 'package:pili_variety_classification/screens/home_screen.dart';
import 'package:pili_variety_classification/screens/result.dart';
import 'package:pili_variety_classification/screens/result_description.dart';
import 'package:pili_variety_classification/screens/scanning.dart';
import 'package:pili_variety_classification/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pili Variety Classification Using CNN',
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        MPFScreen.id: (context) => const MPFScreen(),
        RPSScreen.id: (context) => const RPSScreen(),
        DisplayImageScreen.id: (context) {
          // Extract arguments from settings.arguments as a Map<String, dynamic> first
          final Map<String, dynamic>? arguments = ModalRoute.of(context)!
              .settings
              .arguments as Map<String, dynamic>?;

          // Extract specific arguments from the map
          final File? mainFilePath = arguments?['filePath'] as File?;
          final String? label = arguments?['label'] as String?;
          final double? confidence = arguments?['confidence'] as double?;
          final String? input = arguments?['input'] as String?;
          return DisplayImageScreen(
            filePath: mainFilePath,
            label: label,
            confidence: confidence,
            input: input,
          );
        },
        ScanningImageScreen.id: (context) {
          // Extract arguments directly from settings.arguments as a Map<String, dynamic>
          final Map<String, dynamic>? arguments = ModalRoute.of(context)!
              .settings
              .arguments as Map<String, dynamic>?;
          // Extract specific arguments from the map
          final File? mainFilePath = arguments?['filePath'] as File?;
          final String? label = arguments?['label'] as String?;
          final double? confidence = arguments?['confidence'] as double?;
          final String? input = arguments?['input'] as String?;
          return ScanningImageScreen(
            filePath: mainFilePath,
            label: label,
            confidence: confidence,
            input: input,
          );
        },
        ResultScreen.id: (context) {
          // Extract arguments from settings.arguments as a Map<String, dynamic> first
          final Map<String, dynamic>? arguments = ModalRoute.of(context)!
              .settings
              .arguments as Map<String, dynamic>?;
          // Extract specific arguments from the map
          final File? mainFilePath = arguments?['filePath'] as File?;
          final String? label = arguments?['label'] as String?;
          final double? confidence = arguments?['confidence'] as double?;
          final String? input = arguments?['input'] as String?;
          return ResultScreen(
            filePath: mainFilePath,
            label: label,
            confidence: confidence,
            input: input,
          );
        },
        ResultDescriptionScreen.id: (context) {
          // Extract arguments from settings.arguments as a Map<String, dynamic> first
          final Map<String, dynamic>? arguments = ModalRoute.of(context)!
              .settings
              .arguments as Map<String, dynamic>?;
          // Extract specific arguments from the map
          final File? mainFilePath = arguments?['filePath'] as File?;
          final String? label = arguments?['label'] as String?;
          final double? confidence = arguments?['confidence'] as double?;
          final String? input = arguments?['input'] as String?;
          return ResultDescriptionScreen(
            filePath: mainFilePath,
            label: label,
            confidence: confidence,
            input: input,
          );
        }
      },
    );
  }
}
