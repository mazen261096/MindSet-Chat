import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constant_widgets.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/routes_manager.dart';
import '../../domain/usecases/login_by_email_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_by_email_usecase.dart';
import 'auth_events.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final RegisterByEmailUseCase registerByEmailUseCase;
  final LoginByEmailUseCase loginByEmailUseCase;
  final LogoutUseCase logoutUseCase;


  AuthBloc(this.registerByEmailUseCase,this.loginByEmailUseCase,this.logoutUseCase) : super(const AuthStates()) {
    on<RegisterByEmailEvent>(_registerByEmail);
    on<LoginByEmailEvent>(_loginByEmail);
    on<LogOutEvent>(_logOut);




  }

  @override


  Future<FutureOr<void>> _registerByEmail(RegisterByEmailEvent event, Emitter<AuthStates> emit) async {

    emit(state.copyWith(appUserRequestState: RequestState.loading));

    final result = await registerByEmailUseCase.execute(email: event.email, password: event.password, name: event.name);

    result.fold((l) {

      showDialog(context: event.context, builder: (BuildContext context) {return  AlertDialog(content: Text(l.message));});
      emit(state.copyWith(appUserRequestState: RequestState.error, appUserErrorMessage: l.message));

    }, (r) {

      emit(state.copyWith(appUser: r, appUserRequestState: RequestState.loaded));
      Navigator.pushReplacementNamed(event.context, Routes.homeRoute);


    });
  }


  Future<FutureOr<void>> _loginByEmail(LoginByEmailEvent event, Emitter<AuthStates> emit) async {
    emit(state.copyWith(appUserRequestState: RequestState.loading));

    final result = await loginByEmailUseCase.execute(email: event.email, password: event.password);

    result.fold((l) {


      ConstantWidgets.errorDialog(context: event.context,message: l.message);
      emit(state.copyWith(
          appUserRequestState: RequestState.error,
          appUserErrorMessage: l.message));
    }, (r) {

      emit(state.copyWith(appUser: r, appUserRequestState: RequestState.loaded));
      Navigator.pushReplacementNamed(event.context, Routes.homeRoute);

    });
  }



  FutureOr<void> _logOut(LogOutEvent event, Emitter<AuthStates> emit) async{
    emit(state.copyWith(appUserRequestState: RequestState.loading));
    final result = await logoutUseCase.execute();

    result.fold((l){
      ConstantWidgets.errorDialog(context: event.context,message: l.message);
      emit(state.copyWith(
          appUserRequestState: RequestState.error,
          appUserErrorMessage: l.message));
    }, (r){
      emit(const AuthStates(appUser: null,appUserRequestState:RequestState.loaded));
      Navigator.pushReplacementNamed(event.context, Routes.login);


    });
  }


}
