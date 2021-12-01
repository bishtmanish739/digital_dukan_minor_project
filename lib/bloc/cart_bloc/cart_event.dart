part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartEventAdd extends CartEvent {
  final Product product;
  final ShopModel shopId;

  CartEventAdd(this.product, this.shopId);
}

class CartEventRemove extends CartEvent {
  final int index;

  CartEventRemove(this.index);
}

class CartEventCreateOrder extends CartEvent {
  final Payment payment;
  final Delivery delivery;
  final String? ref;
  CartEventCreateOrder(this.payment, this.delivery,{this.ref});
}
