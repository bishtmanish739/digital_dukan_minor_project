import 'package:bloc/bloc.dart';
import 'package:digital_dukan_minor_project/models/product.dart';
import 'package:digital_dukan_minor_project/repository/fetch_products_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_products_event.dart';
part 'fetch_products_state.dart';

class FetchProductsBloc extends Bloc<FetchProductsEvent, FetchProductsState> {
  FetchProductRepo fetchProductRepo;
  FetchProductsBloc(this.fetchProductRepo) : super(FetchProductsInitial()) {
    on<FetchProductsEvent>((event, emit) async {
      if (event is FetchListOfProducts) {
        try {          
          emit(FetchProductsLoading());
          List<Product> productsList =
              await fetchProductRepo.getListOfProducts(event.shop);
          emit(FetchProductsLoaded(productsList));
        } catch (e) {
          emit(FetchProductsError(e.toString()));
        }
      }
    });
  }
}
