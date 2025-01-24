import 'package:cafe_buzzybee/src/core/usecases/usecases.dart';
import 'package:cafe_buzzybee/src/core/utils/typedefs.dart';
import 'package:cafe_buzzybee/src/features/home/domain/entities/cart_item_entity.dart';
import 'package:cafe_buzzybee/src/features/home/domain/repositories/cart_repository.dart';

class GetCartItemUsecase extends UsecaseWithoutParams<List<CartItemEntity>> {
  GetCartItemUsecase(this._repository);

  final CartRepository _repository;

  @override
  ResultFuture<List<CartItemEntity>> call() async =>  _repository.getCartItems();
}
