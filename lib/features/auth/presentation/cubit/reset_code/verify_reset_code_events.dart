sealed class ResetCodeEvents {}


class VerifyResetCode extends ResetCodeEvents{
  final String code;

  VerifyResetCode(this.code);
}