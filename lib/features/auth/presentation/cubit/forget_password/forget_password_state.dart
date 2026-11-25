import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entities/forget_password_entity.dart';

class SendEmailState {
  final BaseState<ForgetPasswordEntity> sendEmailState;

  SendEmailState({BaseState<ForgetPasswordEntity>? sendEmailState})
      : sendEmailState =
      sendEmailState ?? BaseState<ForgetPasswordEntity>();

  SendEmailState copyWith({
    BaseState<ForgetPasswordEntity>? sendEmailState,
  }) {
    return SendEmailState(
      sendEmailState: sendEmailState ?? this.sendEmailState,
    );
  }
}