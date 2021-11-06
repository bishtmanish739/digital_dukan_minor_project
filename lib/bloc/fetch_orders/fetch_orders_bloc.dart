import 'package:bloc/bloc.dart';
import 'package:digital_dukan_minor_project/models/order_model.dart';
import 'package:digital_dukan_minor_project/repository/order_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_orders_event.dart';
part 'fetch_orders_state.dart';

class FetchOrdersBloc extends Bloc<FetchOrdersEvent, FetchOrdersState> {
  OrderRepo orderRepo;
  FetchOrdersBloc(this.orderRepo) : super(FetchOrdersInitial()) {
    on<FetchOrdersEvent>((event, emit) async {
      if (event is FetchOrders) {
        try {
          List<OrderModel> list = await orderRepo.fetchOrders(event.isShopOwner);
          emit(FetchOrdersLoaded(list));
        } catch (e) {
          emit(FetchOrdersError(e.toString()));
        }
      }
    });
  }
}
