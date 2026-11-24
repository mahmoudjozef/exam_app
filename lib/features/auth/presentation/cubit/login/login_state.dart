import 'package:equatable/equatable.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';

class LoginState extends Equatable {
  final BaseState<UserEntity> loginStete;

  LoginState({this.loginStete = const BaseState()});

  LoginState copyWith({BaseState<UserEntity>? userStete}) {
    return LoginState(loginStete: userStete ?? this.loginStete);
  }

  @override
  List<Object?> get props => [loginStete];
}
