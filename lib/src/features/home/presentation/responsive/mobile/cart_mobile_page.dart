import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:cafe_buzzybee/src/core/utils/utils.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/cart/cart_bloc.dart';
import 'package:cafe_buzzybee/src/core/common/widgets/custom_button_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_cart_list_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_row_with_icon_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_total_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartMobilePage extends StatelessWidget {
  const CartMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.018,
              vertical: screenSize.height * 0.03),
          color: ColorsManager.whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomRowWithIconWidget(
                textSize: screenSize.width * 0.055,
                padding: 0.01,
                iconSize: 25,
              ),
              kSizedBox20,
              CustomCartListWidget(
                imageHeight: screenSize.height * 0.11,
                imageWidth: screenSize.width * 0.3,
                nameSize: screenSize.width * 0.05,
                priceSize: screenSize.width * 0.05,
                unitSize: screenSize.width * 0.038,
                quantitySize: screenSize.width * 0.048,
                addPadding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.004,
                  vertical: screenSize.height * 0.0032,
                ),
                removePadding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.004,
                  vertical: screenSize.height * 0.003,
                ),
                removeSize: 18,
                addSize: 18,
              ),
              kSizedBox20,
              CustomTotalContainerWidget(
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.01,
                    vertical: screenSize.height * 0.02),
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.262,
                fontSize: screenSize.width * 0.04,
              ),
              kSizedBox20,
              CustomButtonWidget(
                  fontSize: screenSize.width * 0.035,
                  width: screenSize.width * 0.6,
                  height: screenSize.height * 0.045,
                  onPressed: () {
                    context.read<CartBloc>().add(ClearCartEvent());
                    Utils().showSnackBar(
                      content: 'Order successfully!',
                      color: ColorsManager.primaryColor,
                      fontSize: screenSize.width * 0.04,
                      context: context,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
