part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {
  CartInitial();
}

class CartLoading extends CartState {
  CartLoading();
}

class CartCreated extends CartState {
  CartCreated();
}

class AddedToCart extends CartState {
  AddedToCart();
}

class GettingItem extends CartState {
  GettingItem();
}

class RemovingItem extends CartState {
  RemovingItem();
}

class CartLoaded extends CartState {
  final List<CartItemEntity> cartItems;
  final double subTotal;

  CartLoaded(this.cartItems, {this.subTotal = 0});

  @override
  List<Object?> get props => [cartItems, subTotal];
}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object?> get props => [message];
}
