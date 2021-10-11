import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_dukan_minor_project/models/product.dart';

class FetchProductRepo {
  Future<List<Product>> getListOfProducts(String shopNumber) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference shop = firestore.collection('shops');
    List<Product> productsList = [];
    await shop
        .doc(shopNumber)
        .collection('products')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Product p = new Product.fromJson(doc.data() as Map<String, dynamic>);
        p.image = doc.id;
        productsList.add(p);
      });
    }).catchError((onError) => throw Exception(onError));
    return productsList;
  }
}
