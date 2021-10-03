import 'package:digital_dukan_minor_project/models/user_type.dart';

class LoginModel {
  final String phoneNumber;
  final String password;
  final UserType type;

  LoginModel(this.phoneNumber, this.password, this.type);
}
