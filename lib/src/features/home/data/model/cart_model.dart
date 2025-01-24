import 'package:cafe_buzzybee/src/features/home/domain/entities/cart_item_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CartItemModel {
  @Id()
  int id = 0;

  String name;
  String description;
  String image;
  double price;
  int unit;
  int quantity;

  CartItemModel(
      {required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.unit,
      required this.quantity});

  CartItemModel.fromEntity(CartItemEntity entity)
      : id = entity.id,
        name = entity.name,
        description = entity.description,
        image = entity.image,
        price = entity.price,
        unit = entity.unit,
        quantity = entity.quantity;

  CartItemEntity toEntity() {
    return CartItemEntity(
      id: id,
      name: name,
      description: description,
      image: image,
      price: price,
      unit: unit,
      quantity: quantity,
    );
  }
}
