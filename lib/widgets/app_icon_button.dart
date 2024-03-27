import 'package:flutter/material.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.onPress,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.iconData,
    required this.title,
    required this.bgColor,
    required this.textColor,
  });

  final Function() onPress;
  final double horizontalPadding;
  final double verticalPadding;
  final IconData iconData;
  final String title;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        backgroundColor: bgColor,
      ),
      child: Column(
        children: [
          Icon(
            iconData,
            color: white,
            size: 40,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontFamily: 'ProximaNova',
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
