import 'package:bloc/bloc.dart';
import 'package:digital_dukan_minor_project/main.dart';
import 'package:digital_dukan_minor_project/models/order_model.dart';
import 'package:digital_dukan_minor_project/models/product.dart';
import 'package:digital_dukan_minor_project/repository/order_repo.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  String shopId = "";
  List<Product> cartProducts = [];
  CartBloc() : super(CartLoaded([])) {
    on<CartEvent>((event, emit) async {
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
      } else if (event is CartEventCreateOrder) {
        if (cartProducts.length == 0) {
          emit(CartMessage("No item to order"));
          emit(CartLoaded(cartProducts));
        } else {
          OrderModel orderModel = new OrderModel(box.get("phone"), shopId,
              cartProducts, Status.pending, Payment.cash);
          OrderRepo repo = new OrderRepo();
          try {
            await repo.createOrder(orderModel);
            cartProducts = [];
            shopId = "";
            emit(CartMessage("Order created"));
          } catch (e) {
            emit(CartMessage(e.toString()));
          }

          emit(CartLoaded(cartProducts));
        }
      }
    });
  }
}
