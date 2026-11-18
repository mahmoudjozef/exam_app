import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app/features/auth/domain/usecase/signup_usecase.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignupViewmodel extends Cubit<SignupState> {
  SignupUsecase _signupUsecase;
  SignupViewmodel(this._signupUsecase) : super(SignupState());
Future<void> getData() async {   // public
  await Future.wait([_signup()]);
}

  Future<void> _signup() async {
    emit(state.copyWith(isLoading: true, errorMsg: null));
    final BaseResponce<UserEntity> apiResult = await _signupUsecase();
    switch (apiResult) {
      case SuccessBaseResponce<UserEntity>():
        emit(state.copyWith(isLoading: false, userStete: apiResult.data));
      case ErrorBaseResponce<UserEntity>():
        emit(state.copyWith(errorMsg: apiResult.errorMsg, isLoading: false));
    }
  }
}
