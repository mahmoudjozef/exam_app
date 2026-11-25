import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/domain/entities/verify_reset_code_entity.dart';

class VerifyResetCodeState {
  BaseState<VerifyResetCodeEntity> verifyResetCode;

  VerifyResetCodeState({BaseState<VerifyResetCodeEntity>? verifyResetCode})
    : verifyResetCode = verifyResetCode ?? BaseState<VerifyResetCodeEntity>();


  VerifyResetCodeState copyWith({BaseState<VerifyResetCodeEntity>? verifyResetCode}){
    return VerifyResetCodeState(
      verifyResetCode: verifyResetCode ?? this.verifyResetCode,
    );
  }
}
