// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) => ShopModel(
      json['shopName'] as String,
      Address.fromJson(json['address'] as Map<String, dynamic>),
      json['shopId'] as String,
    );

Map<String, dynamic> _$ShopModelToJson(ShopModel instance) => <String, dynamic>{
      'shopId': instance.shopId,
      'shopName': instance.shopName,
      'address': instance.address.toJson(),
    };
