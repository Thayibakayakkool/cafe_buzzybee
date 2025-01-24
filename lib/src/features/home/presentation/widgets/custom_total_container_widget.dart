import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTotalContainerWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final double width;
  final double height;
  final double fontSize;

  const CustomTotalContainerWidget({
    super.key,
    required this.padding,
    required this.width,
    required this.height,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          final double subTotal = state.subTotal;
          final double tax = subTotal * 0.2;
          final double discount = subTotal * 0.1;
          final double total = subTotal + tax + discount;

          return Container(
            padding: padding,
            height: height,
            width: width,
            color: ColorsManager.lightGreyColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: getMediumStyle(
                          fontSize: fontSize, color: ColorsManager.greyColor),
                    ),
                    Text(
                      '\$${subTotal.toStringAsFixed(2)}',
                      style: getSemiBoldStyle(
                        fontSize: fontSize,
                        color: ColorsManager.blackColor,
                      ),
                    ),
                  ],
                ),
                kSizedBox2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount sales',
                      style: getMediumStyle(
                          fontSize: fontSize, color: ColorsManager.greyColor),
                    ),
                    Text(
                      '\$${discount.toStringAsFixed(2)}',
                      style: getSemiBoldStyle(
                        fontSize: fontSize,
                        color: ColorsManager.blackColor,
                      ),
                    ),
                  ],
                ),
                kSizedBox2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total sales tax',
                      style: getMediumStyle(
                          fontSize: fontSize, color: ColorsManager.greyColor),
                    ),
                    Text(
                      '\$${tax.toStringAsFixed(2)}',
                      style: getSemiBoldStyle(
                        fontSize: fontSize,
                        color: ColorsManager.blackColor,
                      ),
                    ),
                  ],
                ),
                kSizedBox2,
                Divider(
                  color: ColorsManager.greyColor,
                ),
                kSizedBox2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: getSemiBoldStyle(
                          fontSize: fontSize, color: ColorsManager.blackColor),
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: getSemiBoldStyle(
                        fontSize: fontSize,
                        color: ColorsManager.blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return const Center(child: Text('Error'));
      },
    );
  }
}
