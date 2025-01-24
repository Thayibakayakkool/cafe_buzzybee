import 'dart:async';
import 'package:cafe_buzzybee/src/features/home/data/data_sources/cart_local_data_source.dart';
import 'package:cafe_buzzybee/src/features/home/domain/entities/cart_item_entity.dart';
import 'package:cafe_buzzybee/src/features/home/domain/use_cases/add_to_cart_usecase.dart';
import 'package:cafe_buzzybee/src/features/home/domain/use_cases/get_cart_item_usecase.dart';
import 'package:cafe_buzzybee/src/features/home/domain/use_cases/remove_item_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCartUseCase addToCart;
  final GetCartItemUsecase getCartItem;
  final RemoveItemUsecase removeItem;
  final CartLocalDataSourceImpl localDataSourceImpl;

  CartBloc({
    required this.addToCart,
    required this.getCartItem,
    required this.removeItem,
    required this.localDataSourceImpl,
  }) : super(CartInitial()) {
    on<AddToCartEvent>(_addToCartEvent);
    on<GetCartItemsEvent>(_getCartItemsEvent);
    on<RemoveItemEvent>(_removeItemEvent);
    on<UpdateSubtotalEvent>(_updateSubtotalEvent);
    on<ClearCartEvent>(_clearCartEvent);
    on<IncrementItemEvent>(_incrementItemEvent);
    on<DecrementItemEvent>(_decrementItemEvent);
  }

  Future<void> _addToCartEvent(
      AddToCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    await addToCart(AddToCartParams(event.cartItem));
    add(GetCartItemsEvent());
  }

  Future<void> _getCartItemsEvent(
      GetCartItemsEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final result = await getCartItem();

    result.fold(
      (failure) {
        emit(CartInitial());
      },
      (items) {
        final subtotal = _calculateSubtotal(items);
        emit(CartLoaded(items, subTotal: subtotal));
      },
    );
  }

  Future<void> _removeItemEvent(
      RemoveItemEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    await removeItem(RemoveItemParams(id: event.id));
    add(GetCartItemsEvent());
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
    localDataSourceImpl.cartBox.removeAll();
    add(GetCartItemsEvent());
  }

  Future<void> _incrementItemEvent(
      IncrementItemEvent event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedItems = List<CartItemEntity>.from(currentState.cartItems);
      final itemIndex = updatedItems.indexWhere((item) => item.id == event.id);
      if (itemIndex != -1) {
        updatedItems[itemIndex].quantity++;
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
      if (itemIndex != -1 && updatedItems[itemIndex].quantity > 1) {
        updatedItems[itemIndex].quantity--;
        final subtotal = _calculateSubtotal(updatedItems);
        emit(CartLoaded(updatedItems, subTotal: subtotal));
      }
    }
  }
}
