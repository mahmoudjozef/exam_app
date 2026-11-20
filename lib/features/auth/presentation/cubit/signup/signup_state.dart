import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app/features/auth/domain/usecase/signup_usecase.dart';
class SignupState {
  UserEntity? userStete;
  String? errorMsg;
  bool isLoading;

  SignupState({
    this.userStete,
    this.errorMsg,
    this.isLoading = false, // القيمة الافتراضية هنا
  });

  SignupState copyWith({
    UserEntity? userStete,
    String? errorMsg,
    bool? isLoading,
  }) {
    return SignupState(
      userStete: userStete ?? this.userStete,
      errorMsg: errorMsg ?? this.errorMsg,
      isLoading: isLoading ?? this.isLoading, // هنا بنستخدم الـ ?? عادي لأن اليمين bool? واليسار bool
    );
  }
}