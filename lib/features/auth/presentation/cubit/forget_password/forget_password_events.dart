sealed class ForgetPasswordEvents {}

class SendEmailEvent extends ForgetPasswordEvents{
  final String email;

  SendEmailEvent(this.email);
}