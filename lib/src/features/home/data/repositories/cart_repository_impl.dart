import 'package:cafe_buzzybee/src/core/error/exception.dart';
import 'package:cafe_buzzybee/src/core/error/failure.dart';
import 'package:cafe_buzzybee/src/core/utils/typedefs.dart';
import 'package:cafe_buzzybee/src/features/home/data/data_sources/cart_local_data_source.dart';
import 'package:cafe_buzzybee/src/features/home/data/model/cart_model.dart';
import 'package:cafe_buzzybee/src/features/home/domain/entities/cart_item_entity.dart';
import 'package:cafe_buzzybee/src/features/home/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource _localDataSource;

  CartRepositoryImpl(this._localDataSource);

  @override
  ResultVoid addToCart(CartItemEntity cartItem) async {
    try {
      await _localDataSource.addToCart(CartItemModel.fromEntity(cartItem));
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<CartItemEntity>> getCartItems() async {
    try {
      final result = await _localDataSource.getCartItems();
      final list = result.map((model) {
        return CartItemEntity(
            id: model.id,
            name: model.name,
            description: model.description,
            image: model.image,
            price: model.price,
            unit: model.unit);
      }).toList();
      return Right(list);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultVoid removeItem({required int id}) async {
    try {
      await _localDataSource.removeItem(id: id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
