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
  Future<void> addToCart(CartItemModel cartItem, {bool isIncrement = true}) async {
    try {
      final item = cartBox
          .query(CartItemModel_.name.equals(cartItem.name))
          .build()
          .findFirst();

      if (item != null) {
        if (isIncrement) {
          item.quantity += 1;
        } else {
          if (item.quantity > 1) {
            item.quantity -= 1;
          }
        }
        cartBox.put(item);
      } else {
        cartBox.put(CartItemModel(
          name: cartItem.name,
          image: cartItem.image,
          description: cartItem.description,
          price: cartItem.price,
          quantity: 1,
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

  Stream<List<CartItemModel>> watchCartItems() {
    return cartBox.query().watch(triggerImmediately: true).map((query) => query.find());
  }
}
