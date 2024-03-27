import 'package:flutter/material.dart';
import 'package:pili_variety_classification/screens/home_screen.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';
import 'package:pili_variety_classification/widgets/app_button.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splash_screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primarybgColor,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image(
                        image: AssetImage('assets/imgs/logo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      "Pili Variety Classification",
                      style: TextStyle(
                        color: white,
                        fontFamily: 'ProximaNova',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.10),
              child: AppButton(
                title: 'Get Started',
                onPress: () => Navigator.pushNamed(context, HomeScreen.id),
                fontSize: 20,
                horizontalPadding: 100,
                verticalPadding: 15,
                bgColor: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
