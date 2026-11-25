sealed class VerifyResetCodeEvents {}


class VerifyResetCodeEvent extends VerifyResetCodeEvents{
  final String code;

  VerifyResetCodeEvent(this.code);
}