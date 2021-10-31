import 'package:bloc/bloc.dart';
import 'package:digital_dukan_minor_project/models/product.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  String shopId = "";
  List<Product> cartProducts = [];
  CartBloc() : super(CartLoaded([])) {
    on<CartEvent>((event, emit) {
      if (event is CartEventAdd) {
        if (shopId.length == 0) shopId = event.shopId;
        if (shopId != event.shopId)
          emit(CartMessage("Can't add product from different shop"));
        else {
          cartProducts.add(event.product);
          emit(CartMessage("Item added successfully to cart"));
          emit(CartLoaded(cartProducts));
        }
      } else if (event is CartEventRemove) {
        emit(CartMessage("Product removed from cart"));
        cartProducts.removeAt(event.index);
        emit(CartLoaded(cartProducts));
      }
    });
  }
}
