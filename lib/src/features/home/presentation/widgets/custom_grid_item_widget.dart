import 'package:cafe_buzzybee/src/core/config/assets.dart';
import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/core/config/values.dart';
import 'package:cafe_buzzybee/src/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:view_more/view_more.dart';

class CustomGridItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onAddToCart;
  final double imageWidth;
  final double imageHeight;
  final double nameSize;
  final double descriptionSize;
  final double priceSize;
  final double unitSize;
  final double iconSize;
  final EdgeInsetsGeometry padding;

  const CustomGridItemWidget({
    super.key,
    required this.item,
    required this.onAddToCart,
    required this.imageWidth,
    required this.imageHeight,
    required this.nameSize,
    required this.descriptionSize,
    required this.priceSize,
    required this.unitSize,
    required this.iconSize,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.01,
        vertical: screenSize.height * 0.015,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.circular(AppSize.s5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s5),
              child: Image.asset(
                item['image'],
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.fill,
              ),
            ),
          ),
          kSizedBox5,
          Text(
            item['name'],
            style: getSemiBoldStyle(
              fontSize: nameSize,
              color: ColorsManager.blackColor,
            ),
          ),
          ViewMore(
            item['description'],
            style: getRegularStyle(
              fontSize: descriptionSize,
              color: ColorsManager.greyColor,
            ),
            trimLines: 2,
            trimCollapsedText: 'view more',
            trimExpandedText: 'view less',
            trimMode: Trimer.line,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${item['price']}',
                        style: getSemiBoldStyle(
                          fontSize: priceSize,
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: '/ ${item['unit']} pcs',
                        style: getMediumStyle(
                          fontSize: unitSize,
                          color: ColorsManager.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: onAddToCart,
                child: Container(
                  padding: padding,
                  decoration: BoxDecoration(
                    color: ColorsManager.lightGreyColor,
                    borderRadius: BorderRadius.circular(AppSize.s5),
                  ),
                  child: Image.asset(
                    Assets.cart,
                    width: iconSize,
                    color: ColorsManager.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
