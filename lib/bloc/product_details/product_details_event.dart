part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsEvent {}

class UpdateProductDetails extends ProductDetailsEvent {
  final Product product;
  final XFile? image;
  UpdateProductDetails(this.product, this.image);
}
