import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_dukan_minor_project/main.dart';
import 'package:digital_dukan_minor_project/models/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProductDetailsRepo {
  Future uploadPic(XFile? image, String location) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    await storage.ref('uploads/$location.png').putFile(File(image!.path));
  }

  void validate(Product product) {
    if (product.name == "") throw Exception("Name is required");
    if (product.price == "") throw Exception("Price is required");
    if (product.quantity == "") throw Exception("Quantity is required");
  }

  Future uploadProduct(Product product) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference shop = firestore.collection('shops');
    if (product.image != "") {
      await shop
          .doc(box.get('phone'))
          .collection('products')
          .doc(product.image)
          .set(product.toJson())
          .then((value) {})
          .catchError((onError) => throw Exception(onError));
      return product.image;
    } else {
      String? location;
      await shop
          .doc(box.get('phone'))
          .collection('products')
          .add(product.toJson())
          .then((value) {
        location = value.id;
      }).catchError((onError) => throw Exception(onError));
      return location!;
    }
  }
}
