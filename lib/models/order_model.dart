import 'package:digital_dukan_minor_project/models/product.dart';
import 'package:digital_dukan_minor_project/models/shop_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

enum Status { pending, ready, completed, accepted, rejected }
enum Payment { cash, paid }
enum Delivery { pickup, delivery }

@JsonSerializable(explicitToJson: true)
class OrderModel {
  String? id;
  String shopId;
  String userId;
  List<Product> products;
  Status orderStatus;
  Payment payment;
  ShopModel? shopModel;
  Delivery delivery;
  int otp;
  String? ref;

  OrderModel(this.userId, this.shopId, this.products, this.orderStatus,
      this.payment, this.delivery, this.otp);
  OrderModel.withId(this.id, this.userId, this.shopId, this.products,
      this.orderStatus, this.payment, this.delivery, this.otp);
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
