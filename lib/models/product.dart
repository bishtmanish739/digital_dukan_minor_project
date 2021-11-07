import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  String image;
  final String name;
  final String price;
  final String quantity;

  Product(this.image, this.name, this.price, this.quantity);
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
