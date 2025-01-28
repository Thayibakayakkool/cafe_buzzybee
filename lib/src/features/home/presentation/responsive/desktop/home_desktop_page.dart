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

class HomeDesktopPage extends StatelessWidget {
  const HomeDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.03,
                vertical: screenSize.height * 0.03,
              ),
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
                              fontSize: screenSize.width * 0.018),
                          kSizedBox5,
                          Text(
                            ' Discover whatever you need easily',
                            style: getRegularStyle(
                              fontSize: screenSize.width * 0.01,
                              color: ColorsManager.greyColor,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CustomSearchTextFieldWidget(
                            width: screenSize.width * 0.2,
                            height: screenSize.height * 0.05,
                            fontSize: screenSize.width * 0.01,
                          ),
                          kSizedBoxW20,
                          Container(
                            width: screenSize.width * 0.03,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                                color: ColorsManager.whiteColor,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s8)),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.filter_alt_outlined,
                                color: ColorsManager.blackColor,
                                size: screenSize.width * 0.015,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  kSizedBox45,
                  BlocBuilder<ItemBloc, ItemState>(
                    builder: (context, state) {
                      return Row(
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
                              imageWidth: screenSize.width * 0.014,
                              textFontSize: screenSize.width * 0.012,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  kSizedBox30,
                  Expanded(
                    child: BlocBuilder<ItemBloc, ItemState>(
                      builder: (context, state) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: screenSize.height * 0.02,
                            crossAxisSpacing: screenSize.width * 0.012,
                          ),
                          itemCount: state.filteredMenuItems.length,
                          itemBuilder: (context, index) {
                            final item = state.filteredMenuItems[index];
                            return CustomGridItemWidget(
                              imageHeight: screenSize.height * 0.22,
                              imageWidth: screenSize.width * 0.5,
                              nameSize: screenSize.width * 0.012,
                              descriptionSize: screenSize.width * 0.009,
                              priceSize: screenSize.width * 0.012,
                              unitSize: screenSize.width * 0.01,
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
                              iconSize: 23,
                              padding: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.005,
                                vertical: screenSize.height * 0.005,
                              ),
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
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.012,
                vertical: screenSize.height * 0.03,
              ),
              color: ColorsManager.whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomRowWithIconWidget(
                    textSize: screenSize.width * 0.015,
                    padding: 0.008,
                  ),
                  kSizedBox20,
                  CustomCartListWidget(
                    imageHeight: screenSize.height * 0.11,
                    imageWidth: screenSize.width * 0.07,
                    nameSize: screenSize.width * 0.013,
                    priceSize: screenSize.width * 0.011,
                    unitSize: screenSize.width * 0.009,
                    quantitySize: screenSize.width * 0.01,
                    addPadding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.002,
                      vertical: screenSize.height * 0.0032,
                    ),
                    removePadding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.002,
                      vertical: screenSize.height * 0.003,
                    ),
                  ),
                  kSizedBox20,
                  CustomTotalContainerWidget(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.01,
                        vertical: screenSize.height * 0.02),
                    width: screenSize.width * 0.2,
                    height: screenSize.height * 0.185,
                    fontSize: screenSize.width * 0.01,
                  ),
                  kSizedBox20,
                  CustomButtonWidget(
                    fontSize: screenSize.width * 0.01,
                    width: screenSize.width * 0.2,
                    height: screenSize.height * 0.045,
                    onPressed: () {
                      context.read<CartBloc>().add(ClearCartEvent());
                      Utils().showSnackBar(
                        content: 'Order successfully!',
                        color: ColorsManager.primaryColor,
                        fontSize: screenSize.width * 0.01,
                        context: context,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
