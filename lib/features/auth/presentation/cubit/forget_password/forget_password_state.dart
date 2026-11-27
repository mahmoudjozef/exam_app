import 'package:equatable/equatable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entities/forget_password_entity.dart';

class ForgetPasswordState extends Equatable {
  final BaseState<ForgetPasswordEntity> sendEmailState;

  ForgetPasswordState({
    BaseState<ForgetPasswordEntity>? sendEmailState,
  }) : sendEmailState =
      sendEmailState ?? BaseState<ForgetPasswordEntity>();

  ForgetPasswordState copyWith({
    BaseState<ForgetPasswordEntity>? sendEmailState,
  }) {
    return ForgetPasswordState(
      sendEmailState: sendEmailState ?? this.sendEmailState,
    );
  }

  @override
  List<Object> get props => [sendEmailState];
}