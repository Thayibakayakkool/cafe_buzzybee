import 'package:cafe_buzzybee/src/features/home/data/model/cart_model.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final int unit;
  int quantity;

  CartItemEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.unit,
    this.quantity = 1,
  });

  CartItemModel toModel() {
    return CartItemModel(
      name: name,
      image: image,
      description: description,
      price: price,
      quantity: quantity,
      unit: unit,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        price,
        unit,
        quantity,
      ];
}
