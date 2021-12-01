part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class FetchProfile extends ProfileEvent {
  final UserType type;

  FetchProfile(this.type);
  
}

class SaveProfile extends ProfileEvent {final UserType type;

  final RegisterModel registerModel;
  SaveProfile(this.registerModel,this.type);
}
