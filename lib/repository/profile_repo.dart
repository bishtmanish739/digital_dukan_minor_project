import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_dukan_minor_project/main.dart';
import 'package:digital_dukan_minor_project/models/register_model.dart';
import 'package:digital_dukan_minor_project/models/user_type.dart';

class ProfileRepo {
  Future<RegisterModel?> fetchProfile(UserType type) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference ref = firestore.collection('owners');
    RegisterModel? model;
    if (type == UserType.customer) ref = firestore.collection('customer');
    await ref
        .doc(box.get("phone"))
        .get()
        .then((value) => {
          model=RegisterModel.fromJson(value.data() as Map<String,dynamic>)
        })
        .catchError((onError) => throw Exception(onError));
    return model;
  }
  Future saveProfile(UserType type, RegisterModel model) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference ref = firestore.collection('owners');
    if (type == UserType.customer) ref = firestore.collection('customer');
    await ref
        .doc(box.get("phone")).set(model.toJson())
        .then((value) => {
        
        })
        .catchError((onError) => throw Exception(onError));

  }
}
