sealed class ResetPasswordEvents {}

class ResetPasswordEvent extends ResetPasswordEvents{
  final String newPassword;

  ResetPasswordEvent(this.newPassword);
}