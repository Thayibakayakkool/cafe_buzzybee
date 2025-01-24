import 'package:cafe_buzzybee/src/core/config/colors.dart';
import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:cafe_buzzybee/src/core/config/styles.dart';
import 'package:cafe_buzzybee/src/core/config/values.dart';
import 'package:cafe_buzzybee/src/core/utils/utils.dart';
import 'package:cafe_buzzybee/src/features/home/domain/entities/cart_item_entity.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/cart_bloc.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/responsive/mobile/cart_mobile_page.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_grid_item_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_menu_item_tile_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_rich_text_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/widgets/custom_search_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class HomeMobilePage extends HookWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedMenu = useState('Croissant');
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
                        borderRadius: BorderRadius.circular(AppSize.s8)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartMobilePage(),
                            ));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: ColorsManager.primaryColor,
                        size: screenSize.width * 0.05,
                      ),
                    ),
                  ),
                ],
              ),
              kSizedBox15,
              CustomSearchTextFieldWidget(
                width: screenSize.width * 0.6,
                height: screenSize.height * 0.042,
                fontSize: screenSize.width * 0.026,
              ),
              kSizedBox20,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    menuItem.length,
                    (index) {
                      return CustomMenuItemTileWidget(
                        image: menuItem[index]['image']!,
                        text: menuItem[index]['text']!,
                        isSelected:
                            selectedMenu.value == menuItem[index]['text']!,
                        onTap: () {
                          selectedMenu.value = menuItem[index]['text']!;
                        },
                        imageWidth: screenSize.width * 0.05,
                        textFontSize: screenSize.width * 0.03,
                      );
                    },
                  ),
                ),
              ),
              kSizedBox30,
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: screenSize.height * 0.01,
                    crossAxisSpacing: screenSize.width * 0.012,
                  ),
                  itemCount: menuItems.containsKey(selectedMenu.value)
                      ? menuItems[selectedMenu.value]!.length
                      : 0,
                  itemBuilder: (context, index) {
                    if (!menuItems.containsKey(selectedMenu.value)) {
                      return const SizedBox();
                    }

                    final item = menuItems[selectedMenu.value]![index];
                    return CustomGridItemWidget(
                      imageHeight: screenSize.height * 0.21,
                      imageWidth: screenSize.width * 0.5,
                      nameSize: screenSize.width * 0.04,
                      descriptionSize:  screenSize.width * 0.025,
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
                        );

                        BlocProvider.of<CartBloc>(context)
                            .add(AddToCartEvent(cartItem));
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
