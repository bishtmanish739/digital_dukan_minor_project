import 'package:bloc/bloc.dart';
import 'package:digital_dukan_minor_project/models/shop_model.dart';
import 'package:digital_dukan_minor_project/repository/fetch_shops.dart';
import 'package:meta/meta.dart';

part 'list_of_shops_event.dart';
part 'list_of_shops_state.dart';

class ListOfShopsBloc extends Bloc<ListOfShopsEvent, ListOfShopsState> {
  FetchShopsRepo fetchShopsRepo;
  ListOfShopsBloc(this.fetchShopsRepo) : super(ListOfShopsInitial()) {
    on<ListOfShopsEvent>((event, emit) async {
      emit(ListOfShopsLoading());
      if (event is FetchListOfShops) {
        try {
          List<ShopModel> shops = await fetchShopsRepo.fetchShops();
          emit(ListOfShopsLoaded(shops));
        } catch (e) {
          emit(ListOfShopsError(e.toString()));
        }
      }
    });
  }
}
