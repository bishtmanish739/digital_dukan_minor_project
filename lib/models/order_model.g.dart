// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      json['userId'] as String,
      json['shopId'] as String,
      (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      _$enumDecode(_$StatusEnumMap, json['orderStatus']),
      _$enumDecode(_$PaymentEnumMap, json['payment']),
      _$enumDecode(_$DeliveryEnumMap, json['delivery']),
      json['otp'] as int,
    )
      ..id = json['id'] as String?
      ..shopModel = json['shopModel'] == null
          ? null
          : ShopModel.fromJson(json['shopModel'] as Map<String, dynamic>)
      ..ref = json['ref'] as String?;

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shopId': instance.shopId,
      'userId': instance.userId,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'orderStatus': _$StatusEnumMap[instance.orderStatus],
      'payment': _$PaymentEnumMap[instance.payment],
      'shopModel': instance.shopModel?.toJson(),
      'delivery': _$DeliveryEnumMap[instance.delivery],
      'otp': instance.otp,
      'ref': instance.ref,
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
  Status.ready: 'ready',
  Status.completed: 'completed',
  Status.accepted: 'accepted',
  Status.rejected: 'rejected',
};

const _$PaymentEnumMap = {
  Payment.cash: 'cash',
  Payment.paid: 'paid',
};

const _$DeliveryEnumMap = {
  Delivery.pickup: 'pickup',
  Delivery.delivery: 'delivery',
};
