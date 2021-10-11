import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_dukan_minor_project/main.dart';
import 'package:digital_dukan_minor_project/models/login_model.dart';
import 'package:digital_dukan_minor_project/models/user_type.dart';

class LoginRepo {
  void validateLoginData(LoginModel loginModel) {
    if (loginModel.phoneNumber.length != 10)
      throw Exception("Invalid phone number");
    if (loginModel.password.isEmpty) throw Exception("Enter password");
  }

  Future<void> loginUser(LoginModel loginModel) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference reference = loginModel.type == UserType.owner
        ? firestore.collection('owners')
        : firestore.collection('customers');
    final snapShot = await reference.doc(loginModel.phoneNumber).get();
    if (snapShot == null || !snapShot.exists) {
      throw Exception("User not found, please register");
    } else {
      Map<String, dynamic> data = snapShot.data() as Map<String, dynamic>;
      if (data['password'] != loginModel.password)
        throw Exception("Wrong password");
    }
    box.put('phone', loginModel.phoneNumber);
    box.put('type', loginModel.type);
  }
}
