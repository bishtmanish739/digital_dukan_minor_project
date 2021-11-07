// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json, String id) =>
    OrderModel.withId(
      id,
      json['userId'] as String,
      json['shopId'] as String,
      (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      _$enumDecode(_$StatusEnumMap, json['orderStatus']),
      _$enumDecode(_$PaymentEnumMap, json['payment']),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'shopId': instance.shopId,
      'userId': instance.userId,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'orderStatus': _$StatusEnumMap[instance.orderStatus],
      'payment': _$PaymentEnumMap[instance.payment],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$StatusEnumMap = {
  Status.pending: 'pending',
  Status.accepted: 'accepted',
  Status.rejected: 'rejected',
};

const _$PaymentEnumMap = {
  Payment.cash: 'cash',
  Payment.upi: 'upi',
};
