part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

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
