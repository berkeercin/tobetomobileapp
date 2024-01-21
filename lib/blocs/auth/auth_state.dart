import 'package:tobetomobileapp/models/user.dart';

abstract class AuthState {}

class CheckUserLoginData extends AuthState {}

class LogIn extends AuthState {}

class LoadingUser extends AuthState {}

class LoadedUser extends AuthState {
  final UserData user;
  LoadedUser({required this.user});
}
