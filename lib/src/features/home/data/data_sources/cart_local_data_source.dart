import 'package:cafe_buzzybee/objectbox.g.dart';
import 'package:cafe_buzzybee/src/core/error/exception.dart';
import 'package:cafe_buzzybee/src/features/home/data/model/cart_model.dart';

abstract class CartLocalDataSource {
  Future<void> addToCart(CartItemModel cartItem);

  Future<List<CartItemModel>> getCartItems();

  Future<void> removeItem({required int id});
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final Box<CartItemModel> cartBox;

  CartLocalDataSourceImpl({required this.cartBox});

  @override
  Future<void> addToCart(CartItemModel cartItem) async {
    try {
      final item = cartBox
          .query(CartItemModel_.name.equals(cartItem.name))
          .build()
          .findFirst();
      if (item != null) {
        item.quantity += cartItem.quantity;
        cartBox.put(item);
      } else {
        cartBox.put(CartItemModel(
          name: cartItem.name,
          image: cartItem.image,
          description: cartItem.description,
          price: cartItem.price,
          quantity: cartItem.quantity,
          unit: cartItem.unit,
        ));
      }
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<CartItemModel>> getCartItems() async {
    try {
      return cartBox.getAll();
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<void> removeItem({required int id}) async {
    try {
      cartBox.remove(id);
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
