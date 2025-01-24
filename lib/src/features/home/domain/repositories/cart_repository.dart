import 'package:cafe_buzzybee/src/core/utils/typedefs.dart';
import 'package:cafe_buzzybee/src/features/home/domain/entities/cart_item_entity.dart';

abstract class CartRepository {
  ResultVoid addToCart(CartItemEntity cartItem);

  ResultFuture<List<CartItemEntity>> getCartItems();

  ResultVoid removeItem({required int id});
}
