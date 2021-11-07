part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartEventAdd extends CartEvent {
  final Product product;
  final String shopId;

  CartEventAdd(this.product, this.shopId);
}

class CartEventRemove extends CartEvent {
  final int index;

  CartEventRemove(this.index);
}

class CartEventCreateOrder extends CartEvent {}
