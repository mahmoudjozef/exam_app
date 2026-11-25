import 'package:exam_app/features/auth/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:exam_app/features/auth/presentation/cubit/forget_password/forget_password_events.dart';
import 'package:exam_app/features/auth/presentation/cubit/forget_password/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_responce/base_responce.dart';
import '../../../../../config/base_state/base_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _sendEmailUseCase;

  ForgetPasswordCubit(this._sendEmailUseCase) : super(ForgetPasswordState());

  void addEvent(ForgetPasswordEvents event) {
    switch (event) {
      case SendEmailEvent(:final email):
        _submitEmail(email);
    }
  }

  Future<void> _submitEmail(String email) async {
    emit(state.copyWith(sendEmailState: BaseState(isLoading: true)));

    final result = await _sendEmailUseCase.call(email);

    switch (result) {
      case SuccessBaseResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            sendEmailState: BaseState<ForgetPasswordEntity>(data: result.data),
          ),
        );
      case ErrorBaseResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            sendEmailState: BaseState<ForgetPasswordEntity>(
              errorMessage: result.errorMessage,
            ),
          ),
        );
    }
  }
}
