sealed class ResetPasswordEvents {}

class ResetPasswordEvent extends ResetPasswordEvents{
  final String newPassword;
  final String email;

  ResetPasswordEvent(this.newPassword , this.email);
}