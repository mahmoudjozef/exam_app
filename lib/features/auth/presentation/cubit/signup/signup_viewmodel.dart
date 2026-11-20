import 'dart:developer';

import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app/features/auth/domain/usecase/signup_usecase.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_events.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupViewmodel extends Cubit<SignupState> {
  SignupUsecase _signupUsecase;
  SignupViewmodel(this._signupUsecase) : super(SignupState());

  void onEvent(SignupEvents events) {
    switch (events) {
      case GetUser():
        _signup(events.request);
      case GetAllDataEvent():
        _getData(events.request);
    }
  }

  Future<void> _getData(SignupRequest request) async {
    await Future.wait([_signup(request)]);
  }

  Future<void> _signup(SignupRequest request) async {
    emit(state.copyWith(isLoading: true, errorMsg: null));
    log('2- VIEWMODEL REQUEST: ${request.toJson()}');
    final BaseResponce<UserEntity> apiResult = await _signupUsecase(request);
   log('2- VIEWMODEL RESULT: $apiResult');
    switch (apiResult) {
      case SuccessBaseResponce<UserEntity>():
        emit(state.copyWith(isLoading: false, userStete: apiResult.data));
      case ErrorBaseResponce<UserEntity>():
        emit(state.copyWith(errorMsg: apiResult.errorMsg, isLoading: false));
    }
  }
}
