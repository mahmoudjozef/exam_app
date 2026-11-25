import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/domain/entities/reset_password_entity.dart';

class ResetPasswordState {
  BaseState<ResetPasswordEntity> resetPassword;

  ResetPasswordState({BaseState<ResetPasswordEntity>? resetPassword})
      : resetPassword = resetPassword ?? BaseState<ResetPasswordEntity>();


  ResetPasswordState copyWith({BaseState<ResetPasswordEntity>? resetPassword}){
    return ResetPasswordState(
      resetPassword : resetPassword ?? this.resetPassword,
    );
  }
}
