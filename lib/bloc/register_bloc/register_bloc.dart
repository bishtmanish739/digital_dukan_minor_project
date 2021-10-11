import 'package:bloc/bloc.dart';
import 'package:digital_dukan_minor_project/models/register_model.dart';
import 'package:digital_dukan_minor_project/repository/owner_register_repo.dart';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterRepo registerRepo;
  RegisterBloc(this.registerRepo) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      if (event is Register) {
        try {
          emit(RegisterLoading());
          registerRepo.validateData(event.registerModel);
          registerRepo.sendOTP(event.registerModel);
        } catch (e) {
          emit(RegisterMessage(e.toString()));
        }
      } else if (event is VerificationCompleted) {
        emit(RegisterMessage("Phone number verified"));
        emit(RegisterLoading());
        try {
          registerRepo.registerOwner(event.registerModel);
        } catch (e) {
          emit(RegisterMessage(e.toString()));
        }
      } else if (event is UserCreated) {
        emit(RegisterMessage("Successfully created"));
        emit(RegisterLoaded());
      } else if (event is UserRegisterErrorMessage) {
        emit(RegisterMessage(event.message));
      } else if (event is VerificationCodeSent) {
        emit(RegisterMessage("Verification code sent to your phone number"));
        emit(RegisterCodeSent(event.registerModel, event.verificationID));
        emit(RegisterLoading());
      }
    });
  }
}
