import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_dukan_minor_project/bloc/fetch_products/fetch_products_bloc.dart';
import 'package:digital_dukan_minor_project/main.dart';
import 'package:digital_dukan_minor_project/models/product.dart';
import 'package:digital_dukan_minor_project/screens/add_product/add_product.dart';
import 'package:digital_dukan_minor_project/utils/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OwnerProducts extends StatefulWidget {
  const OwnerProducts({Key? key}) : super(key: key);

  @override
  _OwnerProductsState createState() => _OwnerProductsState();
}

class _OwnerProductsState extends State<OwnerProducts> {
  @override
  void initState() {
    BlocProvider.of<FetchProductsBloc>(context)
        .add(FetchListOfProducts(box.get('phone')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Your Products"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size: 28,
              ),
              onPressed: () {
                ownerDrawerKey.currentState!.openDrawer();
              },
            ),
          )),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddProduct(Product("", "", "", ""))),
          );
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<FetchProductsBloc>(context)
              .add(FetchListOfProducts(box.get('phone')));
        },
        child: BlocConsumer<FetchProductsBloc, FetchProductsState>(
          listener: (context, state) {
            if (state is FetchProductsError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is FetchProductsLoaded)
              return Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: state.productsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddProduct(state.productsList[index])),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.all(5),
                        elevation: 10,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.all(5),
                          child: Column(
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
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      state.productsList[index].name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Price: " +
                                              state.productsList[index].price +
                                              " ₹ ",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "Qty: " +
                                              state
                                                  .productsList[index].quantity,
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
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
            else if (state is FetchProductsLoading)
              return Center(child: CircularProgressIndicator());
            else if (state is FetchProductsError)
              return Center(
                child: Text(state.message),
              );
            return Container();
          },
        ),
      ),
    );
  }
}
