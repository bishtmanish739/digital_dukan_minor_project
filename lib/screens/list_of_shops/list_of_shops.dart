import 'package:digital_dukan_minor_project/bloc/list_of_shops/list_of_shops_bloc.dart';
import 'package:digital_dukan_minor_project/screens/buy_products/buy_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfShops extends StatefulWidget {
  const ListOfShops({Key? key}) : super(key: key);

  @override
  State<ListOfShops> createState() => _ListOfShopsState();
}

class _ListOfShopsState extends State<ListOfShops> {
  @override
  void initState() {
    BlocProvider.of<ListOfShopsBloc>(context).add(FetchListOfShops());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nearby Shops"),
        ),
        body: Container(
          child: BlocBuilder<ListOfShopsBloc, ListOfShopsState>(
            builder: (context, state) {
              if (state is ListOfShopsLoaded) {
                return ListView.builder(
                  itemCount: state.shops.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BuyProducts(
                                        state.shops[index].shopId)));
                          },
                          child: Card(
                            elevation: 8,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19)),
                                margin: EdgeInsets.all(5),
                                child: ListTile(
                                  title: Text(state.shops[index].shopName),
                                  subtitle: Text(
                                      state.shops[index].address.toString()),
                                )),
                          ),
                        ));
                  },
                );
              } else if (state is ListOfShopsError) {
                return Center(
                  child: Text(state.message),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
