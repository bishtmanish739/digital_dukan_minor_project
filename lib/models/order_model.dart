import 'package:digital_dukan_minor_project/models/product.dart';
import 'package:digital_dukan_minor_project/models/shop_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

enum Status { pending, accepted, rejected }
enum Payment { cash, upi }

@JsonSerializable(explicitToJson: true)
class OrderModel {
  String shopId;
  String userId;
  List<Product> products;
  Status orderStatus;
  Payment payment;
  ShopModel? shopModel;

  OrderModel(
      this.userId, this.shopId, this.products, this.orderStatus, this.payment);
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
