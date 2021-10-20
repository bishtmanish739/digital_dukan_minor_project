import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_dukan_minor_project/models/address.dart';
import 'package:digital_dukan_minor_project/models/shop_model.dart';

class FetchShopsRepo {
  Future<List<ShopModel>> fetchShops() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference owner = firestore.collection('owners');
    List<ShopModel> shopList = [];
    await owner.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
        ShopModel p = new ShopModel(
            map["shopName"], Address.fromJson(map['address']), doc.id);
        shopList.add(p);
      });
    }).catchError((onError) => throw Exception(onError));
    return shopList;
  }
}
