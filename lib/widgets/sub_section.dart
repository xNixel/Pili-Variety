import 'package:flutter/material.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';
import 'package:pili_variety_classification/utils/app_text_styles.dart';

class SubSection extends StatelessWidget {
  const SubSection({
    super.key,
    required this.iconData,
    required this.sectionTitle,
  });

  final IconData iconData;
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: white,
        ),
        const SizedBox(width: 5),
        Text(
          sectionTitle,
          style: h1(),
        ),
      ],
    );
  }
}
