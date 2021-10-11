// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['image'] as String,
      json['name'] as String,
      json['price'] as String,
      json['quantity'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
    };
