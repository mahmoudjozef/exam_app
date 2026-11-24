import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/data/models/dto/login_request_model.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:exam_app/features/auth/presentation/cubit/login/login_events.dart';
import 'package:exam_app/features/auth/presentation/cubit/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class LoginViewmodel extends Cubit<LoginState> {
  LoginUsecase _loginUsecase;
  LoginViewmodel(this._loginUsecase) : super(LoginState());
  Future<void> _login(LoginRequestModel request) async {
    final BaseResponse<UserEntity> result = await _loginUsecase.call(request);
    switch (result) {
      case SuccessBaseResponse<UserEntity>():
        emit(state.copyWith(userStete: BaseState(data: result.data)));

        break;
      case ErrorBaseResponse<UserEntity>():
        emit(
          state.copyWith(
            userStete: BaseState(errorMessage: result.errorMessage),
          ),
        );
    }
  }

  Future<void> _getDate(LoginRequestModel request) async {
    await Future.wait([_login(request)]);
  }

  void loginOnEvent(LoginEvents event) {
    switch (event) {
      case LoginOnPressedEvent():
        _login(
          LoginRequestModel(
            email: event.email.trim(),
            password: event.password.trim(),
          ),
        );
      case LoginAllData():
        _getDate(event.loginRequestModel);
    }
  }
}
