import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:flutter/material.dart';

class CustomRichTextWidget extends StatelessWidget {
  final double fontSize;
  const CustomRichTextWidget({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Welcome, ',
            style: getSemiBoldStyle(
              fontSize: fontSize,
              color: ColorsManager.blackColor,
            ),
          ),
          TextSpan(
            text: 'Cafe BuzzyBee',
            style: getBoldStyle(
              fontSize: fontSize,
              color: ColorsManager.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
