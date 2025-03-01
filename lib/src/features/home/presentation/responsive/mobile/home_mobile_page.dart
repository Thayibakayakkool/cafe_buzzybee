import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/core/config/values.dart';
import 'package:cafe_buzzybee/src/core/utils/utils.dart';
import 'package:cafe_buzzybee/src/features/home/domain/entities/cart_item_entity.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/cart/cart_bloc.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/item/item_bloc.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/responsive/mobile/cart_mobile_page.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_grid_item_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_menu_item_tile_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_pop_up_menu_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_rich_text_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_search_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.02,
              vertical: screenSize.height * 0.03),
          color: ColorsManager.lightGreyColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRichTextWidget(fontSize: screenSize.width * 0.05),
                      kSizedBox5,
                      Text(
                        ' Discover whatever you need easily',
                        style: getRegularStyle(
                          fontSize: screenSize.width * 0.03,
                          color: ColorsManager.greyColor,
                        ),
                      )
                    ],
                  ),
                  kSizedBoxW20,
                  Container(
                    width: screenSize.width * 0.095,
                    height: screenSize.height * 0.05,
                    decoration: BoxDecoration(
                      color: ColorsManager.whiteColor,
                      borderRadius: BorderRadius.circular(AppSize.s8),
                    ),
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartMobilePage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color: ColorsManager.primaryColor,
                            size: screenSize.width * 0.05,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              if (state is CartLoaded && state.cartItems.isNotEmpty) {
                                final cartItemCount = state.cartItems.length;

                                return Container(
                                  padding: EdgeInsets.all(screenSize.width * 0.008),
                                  decoration: BoxDecoration(
                                    color: ColorsManager.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: BoxConstraints(
                                    minWidth: screenSize.width * 0.04,
                                    minHeight: screenSize.width * 0.04,
                                  ),
                                  child: Center(
                                    child: Text(
                                      cartItemCount.toString(),
                                      style: TextStyle(
                                        color: ColorsManager.whiteColor,
                                        fontSize: screenSize.width * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              kSizedBox15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSearchTextFieldWidget(
                    width: screenSize.width * 0.83,
                    height: screenSize.height * 0.042,
                    fontSize: screenSize.width * 0.027,
                  ),
                  Container(
                      width: screenSize.width * 0.08,
                      height: screenSize.height * 0.046,
                      decoration: BoxDecoration(
                          color: ColorsManager.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: ColorsManager.primaryColor)),
                      child: CustomPopUpMenuWidget(
                        iconSize: screenSize.width * 0.035,
                        fontSize: 15,
                      )),
                ],
              ),
              kSizedBox20,
              BlocBuilder<ItemBloc, ItemState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        state.menuCategories.length,
                        (index) {
                          return CustomMenuItemTileWidget(
                            image: state.menuCategories[index]['image']!,
                            text: state.menuCategories[index]['text']!,
                            isSelected: state.selectedMenu ==
                                state.menuCategories[index]['text']!,
                            onTap: () {
                              context.read<ItemBloc>().add(
                                    SelectMenuCategoryEvent(
                                        state.menuCategories[index]['text']!),
                                  );
                            },
                            imageWidth: screenSize.width * 0.05,
                            textFontSize: screenSize.width * 0.03,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              kSizedBox30,
              Expanded(
                child: BlocBuilder<ItemBloc, ItemState>(
                  builder: (context, state) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: state.crossAxisCount,
                        mainAxisSpacing: screenSize.height * 0.01,
                        crossAxisSpacing: screenSize.width * 0.012,
                        childAspectRatio: state.crossAxisCount == 2
                            ? 1 / 1
                            : state.crossAxisCount == 3
                                ? 1.1 / 2
                                : 0.3 / 1,
                      ),
                      itemCount: state.filteredMenuItems.length,
                      itemBuilder: (context, index) {
                        final item = state.filteredMenuItems[index];

                        return CustomGridItemWidget(
                          imageHeight: screenSize.height * 0.21,
                          imageWidth: screenSize.width * 0.5,
                          nameSize: screenSize.width * 0.04,
                          descriptionSize: screenSize.width * 0.025,
                          priceSize: screenSize.width * 0.029,
                          unitSize: screenSize.width * 0.022,
                          iconSize: screenSize.width * 0.05,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.005,
                            vertical: screenSize.height * 0.005,
                          ),
                          item: item,
                          onAddToCart: () async {
                            final cartItem = CartItemEntity(
                              name: item['name'],
                              description: item['description'],
                              price: item['price'],
                              id: item['id'].hashCode,
                              image: item['image'],
                              unit: item['unit'],
                              quantity: 1,
                            );

                            BlocProvider.of<CartBloc>(context)
                                .add(AddToCartEvent(cartItem));
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
