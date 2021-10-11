import 'dart:io';

import 'package:digital_dukan_minor_project/bloc/product_details/product_details_bloc.dart';
import 'package:digital_dukan_minor_project/models/product.dart';
import 'package:digital_dukan_minor_project/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AddProduct extends StatefulWidget {
  final Product product;
  AddProduct(this.product) {
    nameController.text = product.name;
    priceController.text = product.price.toString();
    quantityController.text = product.quantity.toString();
  }
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController priceController = new TextEditingController();
  final TextEditingController quantityController = new TextEditingController();

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  // Capture a photo
  _imgFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = photo;
    });
  }

  _imgFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products"),
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
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  widget.product.image == "" || _image !=null
                      ? Center(
                          child: InkWell(
                            onTap: () {
                              _showPicker(context);
                            },
                            child: _image != null
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 300,
                                    height: 200,
                                    child: Image.file(
                                      File(_image!.path),
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 300,
                                    height: 200,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: CachedNetworkImage(
                            width: 300,
                            height: 200,
                            imageUrl: API.getImageURL(widget.product.image),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: widget.nameController,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey[300]!),
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
                      keyboardType: TextInputType.number,
                      controller: widget.priceController,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.price_change),
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey[300]!),
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
                      controller: widget.quantityController,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.production_quantity_limits),
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey[300]!),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(305.0),
                          ),
                        ),
                        hintText: "product quantity",
                        labelText: "product quantity",
                      ),
                    ),
                  ),
                  state is ProductDetailsLoading
                      ? CircularProgressIndicator()
                      : Container(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: new RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green),
                            borderRadius: new BorderRadius.circular(30.0))),
                    onPressed: () {
                      Product product = new Product(
                          widget.product.image,
                          widget.nameController.text,
                          (widget.priceController.text),
                          (widget.quantityController.text));
                      BlocProvider.of<ProductDetailsBloc>(context)
                          .add(UpdateProductDetails(product, _image));
                    },
                    child: new Text(
                      "Submit Details",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
