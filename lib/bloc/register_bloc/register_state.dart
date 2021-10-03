part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {}

class RegisterCodeSent extends RegisterState {
  final RegisterModel registerModel;
  final String verificationID;
  RegisterCodeSent(this.registerModel, this.verificationID);
}

class RegisterMessage extends RegisterState {
  final String message;

  RegisterMessage(this.message);
}
