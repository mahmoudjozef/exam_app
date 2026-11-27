import 'package:exam_app/features/auth/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/domain/entities/verify_reset_code_entity.dart';
import 'package:exam_app/features/auth/domain/usecases/resend_code_use_case.dart';
import 'package:exam_app/features/auth/domain/usecases/verify_reset_code_use_case.dart';
import 'package:exam_app/features/auth/presentation/cubit/reset_code/verify_reset_code_events.dart';
import 'package:exam_app/features/auth/presentation/cubit/reset_code/verify_reset_code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../config/base_responce/base_responce.dart';
import '../../../../../config/base_state/base_state.dart';

@injectable
class VerifyResetCodeCubit extends Cubit<VerifyResetCodeState> {
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResendCodeUseCase _resendCodeUseCase;

  VerifyResetCodeCubit(this._verifyResetCodeUseCase, this._resendCodeUseCase)
      : super(VerifyResetCodeState());

  void addEvent(VerifyResetCodeEvents event) {
    switch (event) {
      case VerifyResetCodeEvent(:final code):
        _submitCode(code);
      case ResendCodeEvent(:final email):
        _resendCode(email);
    }
  }

  Future<void> _submitCode(String code) async {
    emit(state.copyWith(verifyResetCode: BaseState(isLoading: true)));

    final result = await _verifyResetCodeUseCase.call(code: code);

    switch (result) {
      case SuccessBaseResponse<VerifyResetCodeEntity>():
        emit(
          state.copyWith(
            verifyResetCode: BaseState<VerifyResetCodeEntity>(
              data: result.data,
            ),
          ),
        );
      case ErrorBaseResponse<VerifyResetCodeEntity>():
        emit(
          state.copyWith(
            verifyResetCode: BaseState<VerifyResetCodeEntity>(
              errorMessage: result.errorMessage,
            ),
          ),
        );
    }
  }

  Future<void> _resendCode(String email) async {
    emit(state.copyWith(resendCode: BaseState<ForgetPasswordEntity>(isLoading: true)));

    final result = await _resendCodeUseCase.call(email);

    switch (result) {
      case SuccessBaseResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            resendCode: BaseState<ForgetPasswordEntity>(data: result.data),
          ),
        );
      case ErrorBaseResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            resendCode: BaseState<ForgetPasswordEntity>(
              errorMessage: result.errorMessage,
            ),
          ),
        );
    }
  }
}
