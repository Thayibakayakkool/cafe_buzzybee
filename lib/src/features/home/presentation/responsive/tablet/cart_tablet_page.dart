import 'package:cafe_buzzybee/src/core/common/widgets/custom_button_widget.dart';
import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:cafe_buzzybee/src/core/utils/utils.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/cart/cart_bloc.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_cart_list_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_row_with_icon_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_total_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartTabletPage extends StatelessWidget {
  const CartTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return Scaffold(
      body:  Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.018,
            vertical: screenSize.height * 0.03),
        color: ColorsManager.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomRowWithIconWidget(
              textSize: screenSize.width * 0.035,
              padding: 0.01,
              iconSize: 35,
            ),
            kSizedBox8,
            CustomCartListWidget(
              imageHeight: screenSize.height * 0.12,
              imageWidth: screenSize.width * 0.25,
              nameSize: screenSize.width * 0.04,
              priceSize: screenSize.width * 0.03,
              unitSize: screenSize.width * 0.023,
              quantitySize: screenSize.width * 0.03,
              addPadding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.003,
                vertical: screenSize.height * 0.0032,
              ),
              removePadding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.003,
                vertical: screenSize.height * 0.003,
              ),
              removeSize: 30,
              addSize: 30,
              iconSize: 35,
            ),
            kSizedBox20,
            CustomTotalContainerWidget(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.01,
                  vertical: screenSize.height * 0.02),
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.28,
              fontSize: screenSize.width * 0.03,
            ),
            kSizedBox20,
            CustomButtonWidget(
                fontSize: screenSize.width * 0.03,
                width: screenSize.width * 0.7,
                height: screenSize.height * 0.048,
                onPressed: () {
                  context.read<CartBloc>().add(ClearCartEvent());
                  Utils().showSnackBar(
                    content: 'Order successfully!',
                    color: ColorsManager.primaryColor,
                    fontSize: screenSize.width * 0.03,
                    context: context,
                  );
                })
          ],
        ),
      ),
    );
  }
}
