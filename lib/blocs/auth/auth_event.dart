abstract class AuthEvent {}

class CheckLogin extends AuthEvent {}

class LoginUser extends AuthEvent {
  final String email;
  final String password;
  LoginUser({required this.email, required this.password});
}

class ReturnLoginScreen extends AuthEvent {}
