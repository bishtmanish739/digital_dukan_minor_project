part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsInitial {}

class ProductDetailsLoaded extends ProductDetailsInitial {
  final String image;

  ProductDetailsLoaded(this.image);
}

class ProductDetailsError extends ProductDetailsInitial {
  final String message;

  ProductDetailsError(this.message);
}
