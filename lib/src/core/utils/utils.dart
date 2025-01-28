import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:flutter/material.dart';

class Utils {
  Size getScreenSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  showSnackBar(
      {required String content,
      required Color color,
      required double fontSize,
      required BuildContext context}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Center(
            child: Text(
              content,
              style: getSemiBoldStyle(
                fontSize: fontSize,
                color: ColorsManager.whiteColor,
              ),
            ),
          ),
        ),
      );
  }
}
