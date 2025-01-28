import 'package:cafe_buzzybee/src/core/services/service.dart';
import 'package:cafe_buzzybee/src/features/home/data/data_sources/cart_local_data_source.dart';
import 'package:cafe_buzzybee/src/features/home/data/repositories/cart_repository_impl.dart';
import 'package:cafe_buzzybee/src/features/home/domain/repositories/cart_repository.dart';
import 'package:cafe_buzzybee/src/features/home/domain/use_cases/add_to_cart_usecase.dart';
import 'package:cafe_buzzybee/src/features/home/domain/use_cases/get_cart_item_usecase.dart';
import 'package:cafe_buzzybee/src/features/home/domain/use_cases/remove_item_usecase.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/cart/cart_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../features/home/data/model/cart_model.dart';

final sl = GetIt.instance;

Future<void> injectionContainer() async {
  final store = await objectBoxService();

  sl
    ..registerLazySingleton(() => store.box<CartItemModel>())
    ..registerLazySingleton<CartLocalDataSourceImpl>(
      () => CartLocalDataSourceImpl(cartBox: sl()),
    )
    ..registerLazySingleton<CartLocalDataSource>(
      () => sl<CartLocalDataSourceImpl>(),
    )
    ..registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => AddToCartUseCase(sl()))
    ..registerLazySingleton(() => GetCartItemUsecase(sl()))
    ..registerLazySingleton(() => RemoveItemUsecase(sl()))
    ..registerFactory(() => CartBloc(
          addToCart: sl(),
          getCartItem: sl(),
          removeItem: sl(),
          localDataSourceImpl: sl<CartLocalDataSourceImpl>(),
        ));
}
