part of 'fetch_orders_bloc.dart';

@immutable
abstract class FetchOrdersEvent {}

class FetchOrders extends FetchOrdersEvent {
  final bool isShopOwner;

  FetchOrders(this.isShopOwner);
}

class FetchOrdersRejected extends FetchOrdersEvent {
  final bool isShopOwner;

  FetchOrdersRejected(this.isShopOwner);
}
class FetchOrdersCompleted extends FetchOrdersEvent {
  final bool isShopOwner;

  FetchOrdersCompleted(this.isShopOwner);
}
class ChangeOrderStatus extends FetchOrdersEvent {
  final Status status;
  final int index;

  ChangeOrderStatus(this.status, this.index);
}
