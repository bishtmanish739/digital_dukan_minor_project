import 'package:digital_dukan_minor_project/bloc/cart_bloc/cart_bloc.dart';
import 'package:digital_dukan_minor_project/bloc/product_details/product_details_bloc.dart';
import 'package:digital_dukan_minor_project/models/product.dart';
import 'package:digital_dukan_minor_project/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ViewProduct extends StatefulWidget {
  final shopId;
  final Product product;
  ViewProduct(this.product, this.shopId) {
    nameController.text = product.name;
    priceController.text = product.price.toString();
    quantityController.text = product.quantity.toString();
  }
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController priceController = new TextEditingController();
  final TextEditingController quantityController = new TextEditingController();

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  String dropdownValue = "1";
  List<String> quantityList = [];
  @override
  void initState() {
    for (int i = 1; i <= int.parse(widget.quantityController.text); i++) {
      quantityList.add(i.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Products"),
      ),
      body: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
        listener: (context, state) {
          if (state is ProductDetailsError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is ProductDetailsLoaded) {
            widget.product.image = state.image;
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Product saved successfully")));
          }
        },
        builder: (context, state) {
          return BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              if (state is CartMessage) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    CachedNetworkImage(
                      width: 300,
                      height: 200,
                      imageUrl: API.getImageURL(widget.product.image),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: widget.nameController,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.grey[300]!),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(305.0),
                            ),
                          ),
                          hintText: "product name",
                          labelText: "product name",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        keyboardType: TextInputType.number,
                        controller: widget.priceController,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.price_change),
                          border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.grey[300]!),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(305.0),
                            ),
                          ),
                          hintText: "product price",
                          labelText: "product price",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: false,
                        controller: widget.quantityController,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.production_quantity_limits),
                          border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.grey[300]!),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(305.0),
                            ),
                          ),
                          hintText: "product quantity",
                          labelText: "product quantity",
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Select quantity"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: quantityList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    state is ProductDetailsLoading
                        ? CircularProgressIndicator()
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Product cart = new Product(
                                widget.product.image,
                                widget.product.name,
                                widget.product.price,
                                dropdownValue);

                            BlocProvider.of<CartBloc>(context)
                                .add(CartEventAdd(cart, widget.shopId));
                          },
                          child: Text("Add to Cart")),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
