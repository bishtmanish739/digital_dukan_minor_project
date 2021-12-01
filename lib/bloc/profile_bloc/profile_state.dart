part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
   final RegisterModel model;

  ProfileLoaded(this.model);
}

class ProfileMessage extends ProfileState {
  final String message;

  ProfileMessage(this.message);

}
