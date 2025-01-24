import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/core/config/values.dart';
import 'package:cafe_buzzybee/src/core/utils/utils.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomCartListWidget extends StatelessWidget {
  final double imageWidth;
  final double imageHeight;
  final double nameSize;
  final double priceSize;
  final double iconSize;
  final double unitSize;
  final double quantitySize;
  final EdgeInsetsGeometry addPadding;
  final double addSize;
  final EdgeInsetsGeometry removePadding;
  final double removeSize;

  const CustomCartListWidget({
    super.key,
    required this.imageWidth,
    required this.imageHeight,
    required this.nameSize,
    required this.priceSize,
    required this.unitSize,
    required this.quantitySize,
    required this.addPadding,
    required this.removePadding,
    this.iconSize = 20,
    this.addSize = 14,
    this.removeSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartError) {
          return Center(child: Text(state.message));
        } else if (state is CartLoaded) {
          return Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: state.cartItems.length,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey.shade300,
                );
              },
              itemBuilder: (context, index) {
                final cartItem = state.cartItems[index];

                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        cartItem.image,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill,
                      ),
                    ),
                    kSizedBoxW8,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cartItem.name,
                                style: getSemiBoldStyle(
                                  fontSize: nameSize,
                                  color: ColorsManager.primaryColor,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<CartBloc>(context)
                                      .add(RemoveItemEvent(cartItem.id));
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: iconSize,
                                  color: ColorsManager.redColor,
                                ),
                              )
                            ],
                          ),
                          kSizedBox8,
                          Text(
                            '(${(cartItem.unit * cartItem.quantity)}) pcs',
                            style: getBoldStyle(
                              fontSize: unitSize,
                              color: ColorsManager.blackColor,
                            ),
                          ),
                          kSizedBox8,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  '\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
                                  style: getBoldStyle(
                                    fontSize: priceSize,
                                    color: ColorsManager.primaryColor,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<CartBloc>()
                                          .add(IncrementItemEvent(cartItem.id));
                                    },
                                    child: Container(
                                      padding: addPadding,
                                      decoration: BoxDecoration(
                                        color: ColorsManager.primaryColor
                                            .withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s5),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: ColorsManager.whiteColor,
                                        size: addSize,
                                      ),
                                    ),
                                  ),
                                  kSizedBoxW8,
                                  Text(
                                    '${cartItem.quantity}',
                                    style: getMediumStyle(
                                      fontSize: quantitySize,
                                      color: ColorsManager.blackColor,
                                    ),
                                  ),
                                  kSizedBoxW8,
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<CartBloc>()
                                          .add(DecrementItemEvent(cartItem.id));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenSize.width * 0.002,
                                        vertical: screenSize.height * 0.003,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorsManager.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s5),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: ColorsManager.whiteColor,
                                        size: removeSize,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
        return const Center(child: Text('Error'));
      },
    );
  }
}
