import 'package:digital_dukan_minor_project/bloc/fetch_orders/fetch_orders_bloc.dart';
import 'package:digital_dukan_minor_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    BlocProvider.of<FetchOrdersBloc>(context).add(FetchOrders());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your orders"),
      ),
      body: BlocConsumer<FetchOrdersBloc, FetchOrdersState>(
        listener: (context, state) {
          if (state is FetchOrdersError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is FetchOrdersLoaded)
            return ListView.builder(
                scrollDirection: Axis.vertical,
    shrinkWrap: true,
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                    state.list[index].shopModel!.shopName),
                                subtitle: Text("Order status: " +
                                    state.list[index].orderStatus
                                        .toString()
                                        .split('.')[1]),
                                trailing: Text("Products: " +
                                    state.list[index].products.length
                                        .toString()),
                              ),
                              ExpansionTile(
                                  title: Text('Click to view products'),
                                  trailing: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  children: <Widget>[
                                    ListView.builder(    shrinkWrap: true,

                                        itemCount: state
                                            .list[index].products.length,
                                        itemBuilder: (context, prodIndex) {
                                          return ListTile(
                                              title: Text(state
                                                  .list[index]
                                                  .products[prodIndex]
                                                  .name),
                                              subtitle: Text(state
                                                  .list[index]
                                                  .products[prodIndex]
                                                  .price + " Rs"),
                                              trailing: Text("Qty: " +state
                                                  .list[index]
                                                  .products[prodIndex]
                                                  .quantity));
                                        })
                                  ])
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          if (state is FetchOrdersError) {
            return Container(
              child: Text(state.message),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
