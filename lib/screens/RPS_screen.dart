import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pili_variety_classification/screens/preview_image.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';
import 'package:pili_variety_classification/widgets/app_appBar.dart';
import 'package:pili_variety_classification/widgets/app_banner.dart';
import 'package:pili_variety_classification/widgets/app_icon_button.dart';
import 'package:pili_variety_classification/widgets/circle_avatar.dart';
import 'dart:developer' as devtools;
import 'package:image/image.dart' as img;

class RPSScreen extends StatefulWidget {
  static const String id = "rps_screen";
  const RPSScreen({Key? key});

  @override
  State<RPSScreen> createState() => _RPSScreenState();
}

class _RPSScreenState extends State<RPSScreen> {
  File? filePath;
  String label = '';
  double confidence = 0.0;
  String input = 'RPS';

  Future<void> _tfLteInit() async {
    String? res = await Tflite.loadModel(
      model: "assets/models/RPS-EfficientNetB1.tflite",
      labels: "assets/label/label.txt",
      numThreads: 1, // defaults to 1
      isAsset:
          true, // defaults to true, set to false to load resources outside assets
      useGpuDelegate:
          false, // defaults to false, set to true to use GPU delegate
    );
  }

  // Function to resize the image to 224x224 pixels
  Future<File> resizeImage(
      File imageFile, int targetWidth, int targetHeight) async {
    // Read the image as bytes
    List<int> imageBytes = await imageFile.readAsBytes();

    // Decode the image
    img.Image? image = img.decodeImage(imageBytes);

    // Resize the image
    img.Image resizedImage =
        img.copyResize(image!, width: targetWidth, height: targetHeight);

    // Save the resized image to a new file
    File resizedFile = File(imageFile.path.replaceAll(
        '.jpg', '_resized.jpg')); // Change the file extension as needed
    await resizedFile.writeAsBytes(img.encodeJpg(resizedImage));

    return resizedFile;
  }

  // Function to upload picture from the local file
  pickImageGallery() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    var imageMap = File(image.path);

    // Resize the image to 224x224 pixels
    File resizedImageFile = await resizeImage(imageMap, 224, 224);

    setState(() {
      filePath = resizedImageFile;
    });

    // Run prediction using the Model
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,
      threshold: 0.8,
      asynch: true,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      setState(() {
        confidence = (recognitions[0]['confidence'] * 100);
        label = recognitions[0]['label'].toString();
      });
      devtools.log(recognitions.toString());
    } else {
      setState(() {
        label = "No Pili Detected";
        confidence = 0;
      });
    }

    setState(() {
      Navigator.pushNamed(
        context,
        DisplayImageScreen.id,
        arguments: {
          'filePath': filePath,
          'label': label,
          'confidence': confidence,
          'input': input,
        },
      );
    });

    devtools.log("Navigated to DisplayImageScreen");
  }

  // Function to capture picture  through device camera
  pickImageCamera() async {
    final ImagePicker picker = ImagePicker();
    // Open Camera.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    var imageMap = File(image.path);

    // Resize the image to 224x224 pixels
    File resizedImageFile = await resizeImage(imageMap, 224, 224);

    setState(() {
      filePath = resizedImageFile;
    });

    // Run prediction using the Model
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,
      threshold: 0.8,
      asynch: true,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      setState(() {
        confidence = (recognitions[0]['confidence'] * 100);
        label = recognitions[0]['label'].toString();
      });
      devtools.log(recognitions.toString());
    } else {
      setState(() {
        label = "No Pili Detected";
        confidence = 0;
      });
    }

    setState(() {
      Navigator.pushNamed(
        context,
        DisplayImageScreen.id,
        arguments: {
          'filePath': filePath,
          'label': label,
          'confidence': confidence,
          'input': input,
        },
      );
    });

    devtools.log("Navigated to DisplayImageScreen");
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();
    _tfLteInit();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false, // Disable back button
      child: SafeArea(
        child: Scaffold(
          appBar: appBar(
            label: '',
            bgColor: primaryColor,
            fontColor: white,
            context: context,
            origPressFunction: true,
          ),
          backgroundColor: primarybgColor,
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBanner(height: height),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.12),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppIconButton(
                                  onPress: () => pickImageCamera(),
                                  horizontalPadding: 25,
                                  verticalPadding: 25,
                                  iconData: Icons.camera_alt_rounded,
                                  title: "Capture",
                                  bgColor: primaryColor,
                                  textColor: white,
                                ),
                                const SizedBox(height: 20),
                                AppIconButton(
                                  onPress: () => pickImageGallery(),
                                  horizontalPadding: 28,
                                  verticalPadding: 25,
                                  iconData: Icons.upload_rounded,
                                  title: "Upload",
                                  bgColor: primaryColor,
                                  textColor: white,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              AppCircleAvatar(
                height: height,
                width: width,
                assetImage: 'assets/imgs/shell.png',
                title: 'Raw Pili in the Shell',
                leftPositionMultiplier: 0.25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
