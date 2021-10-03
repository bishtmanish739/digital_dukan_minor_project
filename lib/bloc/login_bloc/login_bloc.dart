// ignore_for_file: await_only_futures

import 'package:bloc/bloc.dart';
import 'package:digital_dukan_minor_project/models/login_model.dart';
import 'package:digital_dukan_minor_project/repository/login_repo.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo loginRepo;
  LoginBloc(this.loginRepo) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      if (event is LoginUser) {
        try {
          loginRepo.validateLoginData(event.loginModel);
          await loginRepo.loginUser(event.loginModel);
          emit(LoginLoaded());
        } catch (e) {
          emit(LoginError(e.toString()));
        }
      }
    });
  }
}
