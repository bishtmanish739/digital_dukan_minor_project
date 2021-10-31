part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartLoaded extends CartState {
  final List<Product> productsList;

  CartLoaded(this.productsList);
}

class CartMessage extends CartState {
  final String message;

  CartMessage(this.message);
}
