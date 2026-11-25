


import 'package:exam_app/features/auth/domain/entities/verify_reset_code_entity.dart';
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

  VerifyResetCodeCubit(this._verifyResetCodeUseCase) : super(VerifyResetCodeState());

  void addEvent(VerifyResetCodeEvents event) {
    switch (event) {

      case VerifyResetCodeEvent(:final code):
        _submitCode(code);
    }
  }

  Future<void> _submitCode(String code) async {
    emit(state.copyWith(verifyResetCode: BaseState(isLoading: true)));

    final result = await _verifyResetCodeUseCase.call(code: code);

    switch (result) {
      case SuccessBaseResponse<VerifyResetCodeEntity>():
        emit(
          state.copyWith(
            verifyResetCode: BaseState<VerifyResetCodeEntity>(data: result.data),
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
}