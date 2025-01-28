import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/core/config/values.dart';
import 'package:cafe_buzzybee/src/core/utils/utils.dart';
import 'package:cafe_buzzybee/src/features/home/domain/entities/cart_item_entity.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/cart/cart_bloc.dart';
import 'package:cafe_buzzybee/src/core/common/widgets/custom_button_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/item/item_bloc.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_cart_list_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_grid_item_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_menu_item_tile_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_rich_text_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_row_with_icon_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_search_text_field_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_total_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabletPage extends StatelessWidget {
  const HomeTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.03,
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
                          CustomRichTextWidget(
                              fontSize: screenSize.width * 0.03),
                          kSizedBox5,
                          Text(
                            ' Discover whatever you need easily',
                            style: getRegularStyle(
                              fontSize: screenSize.width * 0.015,
                              color: ColorsManager.greyColor,
                            ),
                          )
                        ],
                      ),
                      kSizedBoxW20,
                      Container(
                        width: screenSize.width * 0.065,
                        height: screenSize.height * 0.05,
                        decoration: BoxDecoration(
                            color: ColorsManager.whiteColor,
                            borderRadius: BorderRadius.circular(AppSize.s8)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.filter_alt_outlined,
                            color: ColorsManager.blackColor,
                            size: screenSize.width * 0.03,
                          ),
                        ),
                      ),
                    ],
                  ),
                  kSizedBox15,
                  CustomSearchTextFieldWidget(
                    width: screenSize.width * 0.35,
                    height: screenSize.height * 0.04,
                    fontSize: screenSize.width * 0.015,
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
                                        SelectMenuCategoryEvent(state
                                            .menuCategories[index]['text']!),
                                      );
                                },
                                imageWidth: screenSize.width * 0.025,
                                textFontSize: screenSize.width * 0.02,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  kSizedBox20,
                  Expanded(
                    child: BlocBuilder<ItemBloc, ItemState>(
                      builder: (context, state) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: screenSize.height * 0.02,
                            crossAxisSpacing: screenSize.width * 0.02,
                          ),
                          itemCount: state.filteredMenuItems.length,
                          itemBuilder: (context, index) {
                            final item = state.filteredMenuItems[index];

                            return CustomGridItemWidget(
                              imageHeight: screenSize.height * 0.25,
                              imageWidth: screenSize.width * 0.6,
                              nameSize: screenSize.width * 0.035,
                              descriptionSize: screenSize.width * 0.023,
                              priceSize: screenSize.width * 0.03,
                              unitSize: screenSize.width * 0.025,
                              iconSize: 32,
                              padding: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.009,
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
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.018,
                  vertical: screenSize.height * 0.03),
              color: ColorsManager.whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomRowWithIconWidget(
                    textSize: screenSize.width * 0.025,
                    padding: 0.009,
                    iconSize: 28,
                  ),
                  kSizedBox8,
                  CustomCartListWidget(
                    imageHeight: screenSize.height * 0.1,
                    imageWidth: screenSize.width * 0.15,
                    nameSize: screenSize.width * 0.02,
                    priceSize: screenSize.width * 0.023,
                    unitSize: screenSize.width * 0.02,
                    quantitySize: screenSize.width * 0.025,
                    addPadding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.003,
                      vertical: screenSize.height * 0.0032,
                    ),
                    removePadding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.003,
                      vertical: screenSize.height * 0.003,
                    ),
                    removeSize: 20,
                    addSize: 20,
                  ),
                  kSizedBox20,
                  CustomTotalContainerWidget(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.01,
                        vertical: screenSize.height * 0.02),
                    width: screenSize.width * 0.4,
                    height: screenSize.height * 0.24,
                    fontSize: screenSize.width * 0.02,
                  ),
                  kSizedBox20,
                  CustomButtonWidget(
                      fontSize: screenSize.width * 0.02,
                      width: screenSize.width * 0.3,
                      height: screenSize.height * 0.045,
                      onPressed: () {
                        context.read<CartBloc>().add(ClearCartEvent());
                        Utils().showSnackBar(
                          content: 'Order successfully!',
                          color: ColorsManager.primaryColor,
                          fontSize: screenSize.width * 0.02,
                          context: context,
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
