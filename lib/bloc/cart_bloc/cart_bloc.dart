import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:digital_dukan_minor_project/main.dart';
import 'package:digital_dukan_minor_project/models/order_model.dart';
import 'package:digital_dukan_minor_project/models/product.dart';
import 'package:digital_dukan_minor_project/models/shop_model.dart';
import 'package:digital_dukan_minor_project/repository/order_repo.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  ShopModel? shopId;
  List<Product> cartProducts = [];
  CartBloc() : super(CartLoaded([])) {
    on<CartEvent>((event, emit) async {
      if (event is CartEventAdd) {
        if (shopId == null) shopId = event.shopId;
        if (shopId!.shopId != event.shopId.shopId)
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
          //generate 4 digit otp
          Random random = new Random();
          int otp = random.nextInt(9000) + 1000;
          OrderModel orderModel = new OrderModel(
              box.get("phone"),
              shopId!.shopId,
              cartProducts,
              Status.pending,
              event.payment,
              event.delivery,
              otp);
          if (event.ref != null) orderModel.ref = event.ref;
          OrderRepo repo = new OrderRepo();
          try {
            await repo.createOrder(orderModel);
            cartProducts = [];
            shopId = null;
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
