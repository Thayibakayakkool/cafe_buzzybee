import 'dart:async';
import 'package:cafe_buzzybee/src/features/home/data/data_sources/cart_local_data_source.dart';
import 'package:cafe_buzzybee/src/features/home/data/model/cart_model.dart';
import 'package:cafe_buzzybee/src/features/home/domain/entities/cart_item_entity.dart';
import 'package:cafe_buzzybee/src/features/home/domain/use_cases/add_to_cart_usecase.dart';
import 'package:cafe_buzzybee/src/features/home/domain/use_cases/get_cart_item_usecase.dart';
import 'package:cafe_buzzybee/src/features/home/domain/use_cases/remove_item_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({
    required AddToCartUseCase addToCart,
    required GetCartItemUsecase getCartItem,
    required RemoveItemUsecase removeItem,
    required CartLocalDataSourceImpl localDataSourceImpl,
  })  : _addToCart = addToCart,
        _getCartItem = getCartItem,
        _removeItem = removeItem,
        _localDataSourceImpl = localDataSourceImpl,
        super(CartInitial()) {
    on<AddToCartEvent>(_addToCartEvent);
    on<GetCartItemsEvent>(_getCartItemsEvent);
    on<RemoveItemEvent>(_removeItemEvent);
    on<UpdateSubtotalEvent>(_updateSubtotalEvent);
    on<ClearCartEvent>(_clearCartEvent);
    on<IncrementItemEvent>(_incrementItemEvent);
    on<DecrementItemEvent>(_decrementItemEvent);

    _cartSubscription =
        localDataSourceImpl.watchCartItems().listen((cartItems) {
      final cartEntities = cartItems.map((model) => model.toEntity()).toList();
      final subtotal = _calculateSubtotal(cartEntities);
      add(UpdateSubtotalEvent(subtotal));
      emit(CartLoaded(cartEntities, subTotal: subtotal));
    });
  }

  final AddToCartUseCase _addToCart;
  final GetCartItemUsecase _getCartItem;
  final RemoveItemUsecase _removeItem;
  final CartLocalDataSourceImpl _localDataSourceImpl;
  StreamSubscription<List<CartItemModel>>? _cartSubscription;

  Future<void> _addToCartEvent(
      AddToCartEvent event, Emitter<CartState> emit) async {
    emit(AddedToCart());
    final result = await _addToCart(AddToCartParams(event.cartItem));
    result.fold((failure) => emit(CartError(failure.errorMessage)),
            (_) => emit(CartCreated()));
  }

  Future<void> _getCartItemsEvent(
      GetCartItemsEvent event, Emitter<CartState> emit) async {
    emit(GettingItem());
    final result = await _getCartItem();
    result.fold(
      (failure) => emit(CartInitial()),
      (items) => emit(CartLoaded(items, subTotal: _calculateSubtotal(items))),
    );
  }

  Future<void> _removeItemEvent(
      RemoveItemEvent event, Emitter<CartState> emit) async {
    emit(RemovingItem());
    final result = await _removeItem(RemoveItemParams(id: event.id));
    result.fold((failure) => emit(CartError(failure.errorMessage)),
            (_) => emit(CartCreated()));
  }

  double _calculateSubtotal(List<CartItemEntity> items) {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  Future<void> _updateSubtotalEvent(
      UpdateSubtotalEvent event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      emit(CartLoaded(currentState.cartItems, subTotal: event.subTotal));
    }
  }

  Future<void> _clearCartEvent(
      ClearCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    _localDataSourceImpl.cartBox.removeAll();
  }

  Future<void> _incrementItemEvent(
      IncrementItemEvent event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedItems = List<CartItemEntity>.from(currentState.cartItems);
      final itemIndex = updatedItems.indexWhere((item) => item.id == event.id);
      if (itemIndex != -1) {
        final currentQuantity = updatedItems[itemIndex].quantity;
        updatedItems[itemIndex].quantity = currentQuantity + 1;
        await _localDataSourceImpl.addToCart(updatedItems[itemIndex].toModel());
        final subtotal = _calculateSubtotal(updatedItems);
        emit(CartLoaded(updatedItems, subTotal: subtotal));
      }
    }
  }

  Future<void> _decrementItemEvent(
      DecrementItemEvent event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedItems = List<CartItemEntity>.from(currentState.cartItems);

      final itemIndex = updatedItems.indexWhere((item) => item.id == event.id);

      if (itemIndex != -1) {
        final currentQuantity = updatedItems[itemIndex].quantity;

        if (currentQuantity > 1) {
          updatedItems[itemIndex].quantity--;
          await _localDataSourceImpl.addToCart(updatedItems[itemIndex].toModel(),
              isIncrement: false);
          final subtotal = _calculateSubtotal(updatedItems);
          emit(CartLoaded(updatedItems, subTotal: subtotal));
        }
      }
    }
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
