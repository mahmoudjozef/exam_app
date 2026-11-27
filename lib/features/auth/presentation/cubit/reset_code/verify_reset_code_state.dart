import 'package:equatable/equatable.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/domain/entities/verify_reset_code_entity.dart';

class VerifyResetCodeState extends Equatable {
  final BaseState<VerifyResetCodeEntity> verifyResetCode;
  final BaseState<ForgetPasswordEntity> resendCode;

  VerifyResetCodeState({
    BaseState<VerifyResetCodeEntity>? verifyResetCode,
    BaseState<ForgetPasswordEntity>? resendCode,
  }) : verifyResetCode =
      verifyResetCode ?? BaseState<VerifyResetCodeEntity>(),
        resendCode = resendCode ?? BaseState<ForgetPasswordEntity>();

  VerifyResetCodeState copyWith({
    BaseState<VerifyResetCodeEntity>? verifyResetCode,
    BaseState<ForgetPasswordEntity>? resendCode,
  }) {
    return VerifyResetCodeState(
      verifyResetCode: verifyResetCode ?? this.verifyResetCode,
      resendCode: resendCode ?? this.resendCode,
    );
  }

  @override
  List<Object> get props => [verifyResetCode, resendCode];
}