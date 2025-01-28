import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/core/config/values.dart';
import 'package:cafe_buzzybee/src/core/utils/utils.dart';
import 'package:cafe_buzzybee/src/features/home/domain/entities/cart_item_entity.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/cart/cart_bloc.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/item/item_bloc.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/responsive/tablet/cart_tablet_page.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_grid_item_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_menu_item_tile_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_pop_up_menu_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_rich_text_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_search_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabletPage extends StatelessWidget {
  const HomeTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return Scaffold(
      body: Container(
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
                        fontSize: screenSize.width * 0.04),
                    kSizedBox5,
                    Text(
                      ' Discover whatever you need easily',
                      style: getRegularStyle(
                        fontSize: screenSize.width * 0.02,
                        color: ColorsManager.greyColor,
                      ),
                    )
                  ],
                ),
                kSizedBoxW20,
                Container(
                  width: screenSize.width * 0.08,
                  height: screenSize.height * 0.05,
                  decoration: BoxDecoration(
                      color: ColorsManager.whiteColor,
                      borderRadius: BorderRadius.circular(AppSize.s8)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartTabletPage(),
                          ));
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: ColorsManager.primaryColor,
                      size: screenSize.width * 0.025,
                    ),
                  ),
                ),
              ],
            ),
            kSizedBox30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSearchTextFieldWidget(
                  width: screenSize.width * 0.82,
                  height: screenSize.height * 0.045,
                  fontSize: screenSize.width * 0.012,
                ),
                Container(
                    width: screenSize.width * 0.06,
                    height: screenSize.height * 0.048,
                    decoration: BoxDecoration(
                        color: ColorsManager.whiteColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: ColorsManager.primaryColor)
                    ),
                    child:  CustomPopUpMenuWidget(iconSize: screenSize.width * 0.025,fontSize: 20,width: 90,)),
              ],
            ),
            kSizedBox30,
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
                          imageWidth: screenSize.width * 0.03,
                          textFontSize: screenSize.width * 0.024,
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
                      crossAxisCount: state.crossAxisCount,
                      mainAxisSpacing: screenSize.height * 0.02,
                      crossAxisSpacing: screenSize.width * 0.02,
                          childAspectRatio: state.crossAxisCount == 2
                              ? 1 / 1.3
                              : state.crossAxisCount == 3
                              ? 1 / 2
                              : 1 / 2.5,
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
    );
  }
}
