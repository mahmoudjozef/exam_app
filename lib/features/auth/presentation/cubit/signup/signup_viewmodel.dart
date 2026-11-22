
import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app/features/auth/domain/usecase/signup_usecase.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_events.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupViewmodel extends Cubit<SignupState> {
  SignupUsecase _signupUsecase;
  SignupViewmodel(this._signupUsecase) : super(SignupState());

  void onEvent(SignupEvents events) {
    switch (events) {
      case GetUser():
        _signup(
          SignupRequest(
            username: events.username.trim(),
            firstName: events.firstName.trim(),
            lastName: events.lastName.trim(),
            email: events.email.trim(),
            password: events.password,
            rePassword: events.rePassword,
            phone: events.phone.trim(),
          ),
        );
      case GetAllDataEvent():
        _getData(events.request);
    }
  }

  Future<void> _getData(SignupRequest request) async {
    await Future.wait([_signup(request)]);
  }

  Future<void> _signup(SignupRequest request) async {
    emit(state.copyWith(userStete: BaseState(isLoading: true)));

    final BaseResponse<UserEntity> apiResult = await _signupUsecase(request);

    switch (apiResult) {
      case SuccessBaseResponse<UserEntity>():
        emit(state.copyWith(userStete: BaseState(data: apiResult.data)));
      case ErrorBaseResponse<UserEntity>():
        emit(
          state.copyWith(
            userStete: BaseState(errorMessage: apiResult.errorMessage),
          ),
        );
    }
  }
}
