import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/core/config/values.dart';
import 'package:cafe_buzzybee/src/core/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomRowWithIconWidget extends StatelessWidget {
  final double textSize;
  final double iconSize;
  final double padding;
  final VoidCallback? onIconTap;

  const CustomRowWithIconWidget({
    super.key,
    required this.textSize,
    this.iconSize = 20,
    required this.padding,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Current Order',
          style:
              getBoldStyle(fontSize: textSize, color: ColorsManager.blackColor),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * padding,
            vertical: screenSize.height * padding,
          ),
          decoration: BoxDecoration(
              color: ColorsManager.lightGreyColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(AppSize.s5)),
          child: Icon(
            Icons.settings_outlined,
            size: iconSize,
          ),
        ),
      ],
    );
  }
}
