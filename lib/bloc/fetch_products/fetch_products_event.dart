part of 'fetch_products_bloc.dart';

@immutable
abstract class FetchProductsEvent {}

class FetchListOfProducts extends FetchProductsEvent {
  final String shop;

  FetchListOfProducts(this.shop);
}
