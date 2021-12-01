import 'package:bloc/bloc.dart';
import 'package:digital_dukan_minor_project/models/order_model.dart';
import 'package:digital_dukan_minor_project/repository/order_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_orders_event.dart';
part 'fetch_orders_state.dart';

class FetchOrdersBloc extends Bloc<FetchOrdersEvent, FetchOrdersState> {
  OrderRepo orderRepo;
  List<OrderModel> list = [];
  FetchOrdersBloc(this.orderRepo) : super(FetchOrdersInitial()) {
    on<FetchOrdersEvent>((event, emit) async {
      if(event is FetchOrdersRejected){
     try {
          list = await orderRepo.fetchOrdersRejected(event.isShopOwner);
          emit(FetchOrdersLoaded(list));
        } catch (e) {
          emit(FetchOrdersError(e.toString()));
        }
      }
     else if(event is FetchOrdersCompleted){
     try {
          list = await orderRepo.fetchOrdersCompleted(event.isShopOwner);
          emit(FetchOrdersLoaded(list));
        } catch (e) {
          emit(FetchOrdersError(e.toString()));
        }
      }
      else if (event is FetchOrders) {
        try {
          list = await orderRepo.fetchOrders(event.isShopOwner);
          emit(FetchOrdersLoaded(list));
        } catch (e) {
          emit(FetchOrdersError(e.toString()));
        }
      } else if (event is ChangeOrderStatus) {
        Status initial = list[event.index].orderStatus;
        try {
          list[event.index].orderStatus = event.status;
          await orderRepo.updateOrderStatus(list[event.index]);
          emit(FetchOrdersError("Status updated for the order successfully"));
          emit(FetchOrdersLoaded(list));
        } catch (e) {
          list[event.index].orderStatus = initial;
          emit(FetchOrdersError(e.toString()));
        }
      }
    });
  }
}
