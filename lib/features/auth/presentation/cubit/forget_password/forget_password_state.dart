import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entities/forget_password_entity.dart';

class ForgetPasswordState {
  final BaseState<ForgetPasswordEntity> sendEmailState;

  ForgetPasswordState({BaseState<ForgetPasswordEntity>? sendEmailState})
      : sendEmailState =
      sendEmailState ?? BaseState<ForgetPasswordEntity>();

  ForgetPasswordState copyWith({
    BaseState<ForgetPasswordEntity>? sendEmailState,
  }) {
    return ForgetPasswordState(
      sendEmailState: sendEmailState ?? this.sendEmailState,
    );
  }
}