import 'package:digital_dukan_minor_project/models/address.dart';
import 'package:json_annotation/json_annotation.dart';
part 'shop_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShopModel {
  String shopId;
  String shopName;
  Address address;
  String upi;

  ShopModel(this.shopName, this.address, this.shopId,this.upi);
  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShopModelToJson(this);
}
