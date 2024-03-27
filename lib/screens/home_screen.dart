import 'package:flutter/material.dart';
import 'package:pili_variety_classification/screens/MPF_screen.dart';
import 'package:pili_variety_classification/screens/RPS_screen.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';
import 'package:pili_variety_classification/widgets/app_appBar.dart';
import 'package:pili_variety_classification/widgets/app_banner.dart';
import 'package:pili_variety_classification/widgets/circle_avatar.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        // Disable back button functionality
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: appBar(
            label: "",
            bgColor: primaryColor,
            fontColor: primaryColor,
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
                        const Text(
                          "Choose what you want to identify:",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ProximaNova',
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: width * 0.8, // Adjust width as needed
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(context, MPFScreen.id);
                                },
                                icon: Image.asset(
                                  'assets/imgs/mature.png',
                                  width: 50,
                                  height: 50,
                                ),
                                label: Text(
                                  'Mature Pili Fruit',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 10.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(context, RPSScreen.id);
                                },
                                icon: Image.asset(
                                  'assets/imgs/shell.png',
                                  width: 50,
                                  height: 50,
                                ),
                                label: Text(
                                  'Raw Pili in the Shell',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 10.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppCircleAvatar(
                height: height,
                width: width,
                assetImage: 'assets/imgs/logo.png',
                title: 'Pili Variety Classification',
                leftPositionMultiplier: 0.18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
