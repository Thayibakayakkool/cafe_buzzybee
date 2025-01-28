import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressWidget extends StatelessWidget {
  const CustomCircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: ColorsManager.primaryColor,
      ),
    );
  }
}
