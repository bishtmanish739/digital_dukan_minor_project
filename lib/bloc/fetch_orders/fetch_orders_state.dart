part of 'fetch_orders_bloc.dart';

@immutable
abstract class FetchOrdersState {}

class FetchOrdersInitial extends FetchOrdersState {}

class FetchOrdersLoading extends FetchOrdersState {}

class FetchOrdersLoaded extends FetchOrdersState {
  final List<OrderModel> list;
  FetchOrdersLoaded(this.list);
}

class FetchOrdersError extends FetchOrdersState {
  final String message;
  FetchOrdersError(this.message);
}
