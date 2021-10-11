part of 'fetch_products_bloc.dart';

@immutable
abstract class FetchProductsState {}

class FetchProductsInitial extends FetchProductsState {}

class FetchProductsLoading extends FetchProductsState {}

class FetchProductsLoaded extends FetchProductsState {
  final List<Product> productsList;

  FetchProductsLoaded(this.productsList);

}

class FetchProductsError extends FetchProductsState {
  final String message;

  FetchProductsError(this.message);
}
