import 'package:bloc/bloc.dart';
import 'package:digital_dukan_minor_project/bloc/register_bloc/register_bloc.dart';
import 'package:digital_dukan_minor_project/models/register_model.dart';
import 'package:digital_dukan_minor_project/models/user_type.dart';
import 'package:digital_dukan_minor_project/repository/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  RegisterModel? model;
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is FetchProfile) {
        emit(ProfileLoading());
        try {
          model = await ProfileRepo().fetchProfile(event.type);
          emit(ProfileLoaded(model!));
        } catch (e) {
          emit(ProfileMessage(e.toString()));
        }
      } else if (event is SaveProfile) {
        emit(ProfileLoading());
        try {
          await ProfileRepo().saveProfile(event.type, event.registerModel);
          emit(ProfileMessage("Profile updated"));
          model = event.registerModel;
          emit(ProfileLoaded(model!));
        } catch (e) {
          emit(ProfileMessage(e.toString()));
        }
        emit(ProfileLoaded(model!));
      }
    });
  }
}
