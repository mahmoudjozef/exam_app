import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/domain/entities/verify_reset_code_entity.dart';

class ResetCodeState {
  BaseState<VerifyResetCodeEntity> verifyResetCode;

  ResetCodeState({BaseState<VerifyResetCodeEntity>? verifyResetCode})
    : verifyResetCode = verifyResetCode ?? BaseState<VerifyResetCodeEntity>();


  ResetCodeState copyWith({BaseState<VerifyResetCodeEntity>? verifyResetCode}){
    return ResetCodeState(
      verifyResetCode: verifyResetCode ?? this.verifyResetCode,
    );
  }
}
