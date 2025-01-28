import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/item/item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextFieldWidget extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;

  const CustomSearchTextFieldWidget({
    super.key,
    required this.width,
    required this.height,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        onChanged: (value) {
          context.read<ItemBloc>().add(SearchItemEvent(value));
        },
        cursorHeight: 18,
        cursorColor: ColorsManager.primaryColor,
        style:
            getMediumStyle(color: ColorsManager.blackColor, fontSize: fontSize),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          hintText: "Search product...",
          hintStyle: getMediumStyle(
              color: ColorsManager.blackColor.withOpacity(0.4),
              fontSize: fontSize),
          prefixIcon: Icon(
            Icons.search,
            color: ColorsManager.blackColor,
            size: 18,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.primaryColor),
              borderRadius: BorderRadius.circular(4)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.primaryColor),
              borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }
}
