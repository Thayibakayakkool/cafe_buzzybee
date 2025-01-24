part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends CartEvent {
  final CartItemEntity cartItem;

  AddToCartEvent(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}

class GetCartItemsEvent extends CartEvent {}

class RemoveItemEvent extends CartEvent {
  final int id;

  RemoveItemEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class UpdateSubtotalEvent extends CartEvent {
  final double subTotal;

  UpdateSubtotalEvent(this.subTotal);

  @override
  List<Object?> get props => [subTotal];
}

class ClearCartEvent extends CartEvent {}

class IncrementItemEvent extends CartEvent {
  final int id;

  IncrementItemEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class DecrementItemEvent extends CartEvent {
  final int id;

  DecrementItemEvent(this.id);

  @override
  List<Object?> get props => [id];
}
