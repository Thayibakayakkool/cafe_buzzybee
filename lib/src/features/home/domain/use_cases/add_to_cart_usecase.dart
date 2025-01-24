import 'package:cafe_buzzybee/src/core/usecases/usecases.dart';
import 'package:cafe_buzzybee/src/core/utils/typedefs.dart';
import 'package:cafe_buzzybee/src/features/home/domain/entities/cart_item_entity.dart';
import 'package:cafe_buzzybee/src/features/home/domain/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';

class AddToCartUseCase extends UsecaseWithParams<void, AddToCartParams> {
  AddToCartUseCase(this._repository);

  final CartRepository _repository;

  @override
  ResultVoid call(AddToCartParams params) async =>
       _repository.addToCart(params.cartItem);
}

class AddToCartParams extends Equatable{
  final CartItemEntity cartItem;

  const AddToCartParams(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}
