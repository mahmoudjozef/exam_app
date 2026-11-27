sealed class VerifyResetCodeEvents {}


class VerifyResetCodeEvent extends VerifyResetCodeEvents{
  final String code;

  VerifyResetCodeEvent(this.code);
}


class ResendCodeEvent extends VerifyResetCodeEvents{
  final String email;

  ResendCodeEvent(this.email);
}