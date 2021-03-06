import 'package:digital_dukan_minor_project/main.dart';
import 'package:digital_dukan_minor_project/models/address.dart';
import 'package:digital_dukan_minor_project/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_dukan_minor_project/models/shop_model.dart';

class OrderRepo {
  Future createOrder(OrderModel orderModel) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference orders = firestore.collection('orders');
    await orders
        .add(orderModel.toJson())
        .then((value) {})
        .catchError((onError) => throw Exception(onError));
  }

  Future<List<OrderModel>> fetchOrders(bool isShopOwner) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference orders = firestore.collection('orders');
    CollectionReference owners = firestore.collection('owners');

    List<OrderModel> list = [];
    final querySnapshot = await orders
        .where(isShopOwner ? 'shopId' : 'userId', isEqualTo: box.get('phone'))
        .get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
      ShopModel? shop;
      await owners.doc(map['shopId']).get().then((value) {
        var map = value.data() as Map<String, dynamic>;
        shop = new ShopModel(
          map["shopName"],
          Address.fromJson(map['address']),
          doc.id,
          map["upi"],
        );
      }).catchError((onError) => throw Exception(onError));
      map["id"] = doc.id;
      OrderModel p = new OrderModel.fromJson(map);
      p.shopModel = shop!;
      if (p.orderStatus == Status.completed || p.orderStatus == Status.rejected)
        continue;
      list.add(p);
    }
    return list;
  }

  Future<List<OrderModel>> fetchOrdersRejected(bool isShopOwner) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference orders = firestore.collection('orders');
    CollectionReference owners = firestore.collection('owners');

    List<OrderModel> list = [];
    final querySnapshot = await orders
        .where(isShopOwner ? 'shopId' : 'userId', isEqualTo: box.get('phone'))
        .where('orderStatus', isEqualTo: 'rejected')
        .get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
      ShopModel? shop;
      await owners.doc(map['shopId']).get().then((value) {
        var map = value.data() as Map<String, dynamic>;
        shop = new ShopModel(
          map["shopName"],
          Address.fromJson(map['address']),
          doc.id,
          map["upi"],
        );
      }).catchError((onError) => throw Exception(onError));
      map["id"] = doc.id;
      OrderModel p = new OrderModel.fromJson(map);
      p.shopModel = shop!;
      list.add(p);
    }
    return list;
  }

  Future<List<OrderModel>> fetchOrdersCompleted(bool isShopOwner) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference orders = firestore.collection('orders');
    CollectionReference owners = firestore.collection('owners');

    List<OrderModel> list = [];
    final querySnapshot = await orders
        .where(isShopOwner ? 'shopId' : 'userId', isEqualTo: box.get('phone'))
        .where('orderStatus', isEqualTo: 'completed')
        .get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
      ShopModel? shop;
      await owners.doc(map['shopId']).get().then((value) {
        var map = value.data() as Map<String, dynamic>;
        shop = new ShopModel(
          map["shopName"],
          Address.fromJson(map['address']),
          doc.id,
          map["upi"],
        );
      }).catchError((onError) => throw Exception(onError));
      map["id"] = doc.id;
      OrderModel p = new OrderModel.fromJson(map);
      p.shopModel = shop!;
      list.add(p);
    }
    return list;
  }

  Future updateOrderStatus(OrderModel order) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference orders = firestore.collection('orders');
    await orders
        .doc(order.id!)
        .set(order.toJson())
        .then((value) => {})
        .catchError((onError) => throw Exception(onError.toString()));
    return;
  }
}
