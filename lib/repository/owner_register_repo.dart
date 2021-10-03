import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_dukan_minor_project/bloc/register_bloc/register_bloc.dart';
import 'package:digital_dukan_minor_project/main.dart';
import 'package:digital_dukan_minor_project/models/register_model.dart';
import 'package:digital_dukan_minor_project/models/user_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterRepo {
  void validateData(RegisterModel registerModel) {
    if (registerModel.phoneNumber!.length != 10) {
      throw Exception("Enter valid phone number");
    }
    if (registerModel.password!.isEmpty) {
      throw Exception("Enter password");
    }
    if (registerModel.name!.isEmpty) {
      throw Exception("Enter name");
    }

    if (registerModel.type == UserType.owner &&
        registerModel.shopName!.isEmpty) {
      throw Exception("Enter shop name");
    }

    if (registerModel.address!.city!.isEmpty) {
      throw Exception("Enter city");
    }
    if (registerModel.address!.state!.isEmpty) {
      throw Exception("Enter state");
    }
    if (registerModel.address!.zip!.isEmpty) {
      throw Exception("Enter valid zip");
    }
    if (registerModel.type == UserType.owner && registerModel.upi!.isEmpty) {
      throw Exception("Enter upi");
    }
  }

  Future registerOwner(
      RegisterModel registerModel) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference reference = registerModel.type == UserType.owner
        ? firestore.collection('owners')
        : firestore.collection('customers');
    final snapShot = await reference.doc(registerModel.phoneNumber).get();
    if (snapShot == null || !snapShot.exists) {
      reference
          .doc(registerModel.phoneNumber)
          .set(registerModel.toJson())
          .then((value) =>
              BlocProvider.of<RegisterBloc>(navigatorKey.currentState!.context).add(UserCreated()))
          .catchError((onError) => throw Exception(onError));
    } else {
      BlocProvider.of<RegisterBloc>(navigatorKey.currentState!.context).add(
          UserRegisterErrorMessage("User already exists with this number"));
    }
  }

  Future<void> sendOTP(
      RegisterModel ownerRegisterModel ) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 ${ownerRegisterModel.phoneNumber}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        BlocProvider.of<RegisterBloc>(navigatorKey.currentState!.context).add(UserRegisterErrorMessage(
            "Phone number verification failed, please try again later"));
      },
      codeSent: (String verificationId, int? resendToken) {
        BlocProvider.of<RegisterBloc>(navigatorKey.currentState!.context)
            .add(VerificationCodeSent(verificationId, ownerRegisterModel));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
