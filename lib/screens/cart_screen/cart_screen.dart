import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_dukan_minor_project/bloc/cart_bloc/cart_bloc.dart';
import 'package:digital_dukan_minor_project/screens/order_mode_settings/order_mode_settings.dart';
import 'package:digital_dukan_minor_project/screens/payment_screen/payment_screen.dart';
import 'package:digital_dukan_minor_project/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //  BlocProvider.of<CartBloc>(context).add(CartEventCreateOrder());
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OrderModeSettings()));
        },
        label: Text('Order'),
        icon: Icon(Icons.shop),
        backgroundColor: Colors.pink,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartMessage) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is CartLoaded) {
            return state.productsList.length == 0
                ? Center(
                    child: Text("No products found"),
                  )
                : Container(
                    child: ListView.builder(
                      itemCount: state.productsList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Card(
                            margin: EdgeInsets.all(5),
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                    padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                    width: 100,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      height: 100,
                                      child: CachedNetworkImage(
                                        width: 300,
                                        height: 200,
                                        imageUrl: API.getImageURL(
                                            state.productsList[index].image),
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                state.productsList[index].name,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  BlocProvider.of<CartBloc>(
                                                          context)
                                                      .add(CartEventRemove(
                                                          index));
                                                },
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Price: " +
                                                    state.productsList[index]
                                                        .price +
                                                    " ₹ ",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 14),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "Qty: " +
                                                    state.productsList[index]
                                                        .quantity,
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Total: " +
                                                (int.parse(state
                                                            .productsList[index]
                                                            .quantity) *
                                                        int.parse(state
                                                            .productsList[index]
                                                            .price))
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
          }
          return Container();
        },
      ),
    );
  }
}
