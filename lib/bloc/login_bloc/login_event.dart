part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginUser extends LoginEvent {
  LoginModel loginModel;
  LoginUser(this.loginModel);
}
