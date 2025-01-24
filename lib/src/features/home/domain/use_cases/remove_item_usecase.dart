import 'package:cafe_buzzybee/src/core/usecases/usecases.dart';
import 'package:cafe_buzzybee/src/core/utils/typedefs.dart';
import 'package:cafe_buzzybee/src/features/home/domain/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';

class RemoveItemUsecase extends UsecaseWithParams<void, RemoveItemParams> {
  RemoveItemUsecase(this._repository);

  final CartRepository _repository;

  @override
  ResultVoid call(RemoveItemParams params) async =>
      _repository.removeItem(id: params.id);
}

class RemoveItemParams extends Equatable{
  final int id;

  const RemoveItemParams({required this.id});

  @override
  List<Object?> get props => [id];
}
