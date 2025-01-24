import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/core/config/values.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double fontSize;
  void Function()? onPressed;

  CustomButtonWidget({
    super.key,
    required this.fontSize,
    this.width,
    this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(ColorsManager.primaryColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s5),
            ),
          ),
        ),
        onPressed: onPressed,
        child: FittedBox(
          child: Text(
            'Continue to Payment',
            style: getRegularStyle(
              color: ColorsManager.whiteColor,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
