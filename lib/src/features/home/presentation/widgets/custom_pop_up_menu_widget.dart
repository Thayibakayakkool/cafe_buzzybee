import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/item/item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPopUpMenuWidget extends StatelessWidget {
  final double fontSize;
  final double? iconSize;
  final double? width;

  const CustomPopUpMenuWidget({
    super.key,
    this.iconSize,
    required this.fontSize,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final List<int> options = [2, 3, 4];

    return PopupMenuButton<int>(
      color: ColorsManager.whiteColor,
      icon: Icon(
        Icons.grid_view_outlined,
        color: ColorsManager.primaryColor,
        size: iconSize,
      ),
      onSelected: (value) {
        context.read<ItemBloc>().add(ChangeGridColumnEvent(value));
      },
      itemBuilder: (context) => options
          .map(
            (option) => PopupMenuItem(
              value: option,
              child: SizedBox(
                  width: width,
                  child: Center(
                      child: Text(
                    option.toString(),
                    style: getBoldStyle(
                        fontSize: fontSize, color: ColorsManager.primaryColor),
                  ))),
            ),
          )
          .toList(),
    );
  }
}
