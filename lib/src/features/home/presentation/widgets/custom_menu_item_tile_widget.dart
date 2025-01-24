import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/core/config/values.dart';
import 'package:cafe_buzzybee/src/core/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomMenuItemTileWidget extends StatelessWidget {
  final String image;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double imageWidth;
  final double textFontSize;

  const CustomMenuItemTileWidget({
    super.key,
    required this.image,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.imageWidth,
    required this.textFontSize,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.012,
                vertical: screenSize.height * 0.01),
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorsManager.primaryColor
                  : ColorsManager.whiteColor,
              boxShadow: [
                BoxShadow(
                    color: ColorsManager.greyColor.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 7))
              ],
              borderRadius: BorderRadius.circular(AppSize.s5),
            ),
            child: Row(
              children: [
                Image.asset(
                  image,
                  width: imageWidth,
                  color: isSelected
                      ? ColorsManager.whiteColor
                      : ColorsManager.blackColor,
                ),
                kSizedBoxW10,
                Text(
                  text,
                  style: getSemiBoldStyle(
                    fontSize: textFontSize,
                    color: isSelected
                        ? ColorsManager.whiteColor
                        : ColorsManager.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        kSizedBoxW15,
      ],
    );
  }
}
