part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class Register extends RegisterEvent {
  final RegisterModel registerModel;
  final BuildContext context;

  Register(this.registerModel, this.context);
}

class UserCreated extends RegisterEvent {}

class UserRegisterErrorMessage extends RegisterEvent {
  final String message;

  UserRegisterErrorMessage(this.message);
}

class VerificationCodeSent extends RegisterEvent {
  final String verificationID;
  final RegisterModel registerModel;
  VerificationCodeSent(this.verificationID, this.registerModel);
}

class VerificationCompleted extends RegisterEvent {
  final RegisterModel registerModel;
  final BuildContext context;
  VerificationCompleted(this.registerModel, this.context);
}
