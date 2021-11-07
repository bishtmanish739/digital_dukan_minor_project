import 'package:digital_dukan_minor_project/bloc/fetch_orders/fetch_orders_bloc.dart';
import 'package:digital_dukan_minor_project/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrders extends StatefulWidget {
  final bool isShopOwner;

  const MyOrders(this.isShopOwner);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    BlocProvider.of<FetchOrdersBloc>(context)
        .add(FetchOrders(widget.isShopOwner));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your orders"),
      ),
      body: RefreshIndicator(
         onRefresh: () async {
          BlocProvider.of<FetchOrdersBloc>(context)
        .add(FetchOrders(widget.isShopOwner));
        },
        child: BlocConsumer<FetchOrdersBloc, FetchOrdersState>(
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
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 8,
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              ListTile(
                                title:
                                    Text(state.list[index].shopModel!.shopName),
                                subtitle: Text("Order status: " +
                                    state.list[index].orderStatus
                                        .toString()
                                        .split('.')[1]),
                                trailing: Text("Products: " +
                                    state.list[index].products.length.toString()),
                              ),
                              ExpansionTile(
                                  title: Text('Click to view products'),
                                  trailing: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  children: <Widget>[
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            state.list[index].products.length,
                                        itemBuilder: (context, prodIndex) {
                                          return ListTile(
                                              title: Text(state.list[index]
                                                  .products[prodIndex].name),
                                              subtitle: Text(state.list[index]
                                                      .products[prodIndex].price +
                                                  " Rs"),
                                              trailing: Text("Qty: " +
                                                  state
                                                      .list[index]
                                                      .products[prodIndex]
                                                      .quantity));
                                        }),
                                  ]),
                              widget.isShopOwner &&
                                      state.list[index].orderStatus ==
                                          Status.pending
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.green,
                                              shape: new RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.green),
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          8.0))),
                                          onPressed: () {
                                            BlocProvider.of<FetchOrdersBloc>(
                                                    context)
                                                .add(ChangeOrderStatus(
                                                    Status.accepted, index));
                                          },
                                          child: Row(
                                            children: [
                                              new Text(
                                                "Accept Order",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4.0),
                                                child: Icon(Icons.check),
                                              )
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.red,
                                                shape: new RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Colors.red),
                                                    borderRadius:
                                                        new BorderRadius.circular(
                                                            8.0))),
                                            onPressed: () {
                                              BlocProvider.of<FetchOrdersBloc>(
                                                      context)
                                                  .add(ChangeOrderStatus(
                                                      Status.rejected, index));
                                            },
                                            child: Row(
                                              children: [
                                                new Text(
                                                  "Reject Order",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 4.0),
                                                  child: Icon(Icons.close),
                                                )
                                              ],
                                            )),
                                      ],
                                    )
                                  : Container()
                            ],
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
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
