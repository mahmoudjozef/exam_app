


import 'package:exam_app/features/auth/domain/entities/reset_password_entity.dart';
import 'package:exam_app/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:exam_app/features/auth/presentation/cubit/reset_password/reset_password_events.dart';
import 'package:exam_app/features/auth/presentation/cubit/reset_password/reset_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_responce/base_responce.dart';
import '../../../../../config/base_state/base_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(this._resetPasswordUseCase) : super(ResetPasswordState());

  void addEvent(ResetPasswordEvents event) {
    switch (event) {

      case ResetPasswordEvent(:final newPassword , :final email):
        _resetPassword(newPassword , email);
    }
  }

  Future<void> _resetPassword(String newPassword , String email) async {
    emit(state.copyWith( resetPassword : BaseState(isLoading: true)));

    final result = await _resetPasswordUseCase.call(newPassword , email);

    switch (result) {
      case SuccessBaseResponse<ResetPasswordEntity>():
        emit(
          state.copyWith(
            resetPassword: BaseState<ResetPasswordEntity>(data: result.data),
          ),
        );
      case ErrorBaseResponse<ResetPasswordEntity>():
        emit(
          state.copyWith(
            resetPassword : BaseState<ResetPasswordEntity>(
              errorMessage: result.errorMessage,
            ),
          ),
        );
    }
  }
}