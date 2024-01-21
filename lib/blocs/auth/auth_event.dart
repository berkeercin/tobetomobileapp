abstract class LoginScreenEvent {}

class LoginUser extends LoginScreenEvent {
  final String email;
  final String password;
  LoginUser({required this.email, required this.password});
}

class ReturnLoginScreen extends LoginScreenEvent {}
