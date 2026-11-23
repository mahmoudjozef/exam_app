import 'package:equatable/equatable.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';

class SignupState extends Equatable {
  final BaseState<UserEntity> userStete;

  SignupState({this.userStete = const BaseState()});

  SignupState copyWith({BaseState<UserEntity>? userStete}) {
    return SignupState(userStete: userStete ?? this.userStete);
  }

  @override
  List<Object?> get props => [userStete];
}
